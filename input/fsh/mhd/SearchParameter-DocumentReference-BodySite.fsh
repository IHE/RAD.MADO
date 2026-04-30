
Instance: SearchParameterDocumentReferenceBodySite
InstanceOf: SearchParameter
Usage: #definition
* name = "DocumentReferenceAnatomicalRegion"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial-use
* status = #active
* experimental = false 
* description = """Searches for document references with a specific anatomical region."""
* code = #anatomical-region
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.bodySite').extension('concept').value"
