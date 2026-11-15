import java.nio.file.*;
import java.util.*;
import java.util.jar.*;
import org.eclipse.emf.common.util.*;
import org.eclipse.emf.ecore.*;
import org.eclipse.emf.ecore.resource.*;
import org.eclipse.emf.ecore.resource.impl.*;
import org.eclipse.emf.ecore.util.*;
import org.eclipse.uml2.uml.*;
import org.eclipse.uml2.uml.resources.util.UMLResourcesUtil;

/** Loads the real UML/SysML profiles, then validates the generated release package. */
public class ValidateUML {
 public static void main(String[] args) throws Exception {
  var rs = new ResourceSetImpl();
  UMLResourcesUtil.init(rs);
  var plugins = Path.of(args[0], "plugins");
  try (var paths = Files.list(plugins)) {
   for (var p : paths.filter(p -> p.toString().endsWith(".jar") && !p.toString().contains(".source_")).toList()) {
    String bundle = p.getFileName().toString().split("_")[0];
    rs.getURIConverter().getURIMap().put(URI.createURI("platform:/plugin/" + bundle + "/"), URI.createURI("archive:" + p.toUri() + "!/"));
    if (bundle.equals("org.eclipse.papyrus.sysml16")) {
     String jar = "archive:" + p.toUri() + "!/resources/";
     rs.getURIConverter().getURIMap().put(URI.createURI("pathmap://SysML16_PROFILES/"), URI.createURI(jar + "profile/"));
     rs.getURIConverter().getURIMap().put(URI.createURI("pathmap://SysML16_LIBRARIES/"), URI.createURI(jar + "library/"));
     rs.getURIConverter().getURIMap().put(URI.createURI("http://www.eclipse.org/papyrus/sysml/1.6/SysML"), URI.createURI(jar + "profile/SysML.profile.ecore"));
    }
   }
  }
  var sp = org.eclipse.papyrus.sysml16.sysml.SysMLPackage.eINSTANCE;
  rs.getPackageRegistry().put(sp.getNsURI(), sp);
  for (EPackage p : sp.getESubpackages()) rs.getPackageRegistry().put(p.getNsURI(), p);
  Path model = Path.of(args[1]).toAbsolutePath();
  Path profilePath = model.getParent().getParent().resolve("Metamodel and Profile/ArrowheadProfile_v5.3.profile.uml");
  Resource pr = rs.getResource(URI.createFileURI(profilePath.toString()), true);
  for (EObject ob : pr.getContents()) if (ob instanceof Profile profile) {
   if (System.getenv("UPDATE_PROFILE") != null) {
    var enums = new ArrayList<org.eclipse.uml2.uml.Enumeration>();
    for (var it = profile.eAllContents(); it.hasNext();) {
     var item = it.next(); if (item instanceof org.eclipse.uml2.uml.Enumeration en) enums.add(en);
    }
    for (var en : enums) {
     String[] additions = switch(en.getName()) {
      case "ApplicationProtocolKind" -> new String[]{"https", "mqtts", "amqp", "amqps"};
      case "HTTP1.1_MethodKind" -> new String[]{"PATCH"};
      case "ArrowheadCertificateKind" -> new String[]{"Onboarding", "Operator", "System"};
      default -> new String[0];
     };
     for(String name : additions) if(en.getOwnedLiteral(name) == null) en.createOwnedLiteral(name);
    }
    profile.define(); pr.save(null);
   }
   EPackage p = profile.getDefinition();
   if(p == null) { p = profile.define(); pr.save(null); }
   rs.getPackageRegistry().put(p.getNsURI(), p);
  }
  Resource r = rs.getResource(URI.createFileURI(model.toString()), true);
  int errors = r.getErrors().size();
  for (var e : r.getErrors()) System.out.println("LOAD: " + e);
  org.eclipse.uml2.uml.Package release = null;
  for (EObject ob : r.getContents()) if (ob instanceof Model m) release = m.getNestedPackage("Release_5_3_0");
  if (release == null) throw new IllegalStateException("Missing release package");
  EcoreUtil.resolveAll(release);
  int unresolved = EcoreUtil.UnresolvedProxyCrossReferencer.find(release).size();
  System.out.println("UNRESOLVED_RELEASE_REFERENCES=" + unresolved);
  errors += unresolved;
  Diagnostic d = Diagnostician.INSTANCE.validate(release);
  var queue = new ArrayDeque<Diagnostic>(); queue.add(d); int warnings = 0;
  while (!queue.isEmpty()) {
   var a = queue.remove();
   if (a.getChildren().isEmpty() && a.getSeverity() >= Diagnostic.WARNING) {
    if (a.getSeverity() >= Diagnostic.ERROR) errors++; else warnings++;
    System.out.println(a.getMessage());
   }
   queue.addAll(a.getChildren());
  }
  System.out.println("UML_ERRORS=" + errors + " UML_WARNINGS=" + warnings);
  if (errors > 0) System.exit(1);
 }
}
