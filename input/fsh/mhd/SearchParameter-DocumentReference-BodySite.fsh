
Instance: SearchParameterDocumentReferenceBodySite
InstanceOf: SearchParameter
Usage: #definition
* name = "DocumentReferenceAnatomicalRegion"
* extension[+]
  * url = $StructureDefinitionStandardsStatus
  * valueCode = #trial-use
* status = #active
* experimental = false 
* description = """Searches for document references with a specific anatomical region."""
* code = #anatomical-region
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.extension('https://profiles.ihe.net/RAD/MADO/StructureDefinition/ext-R5-DocumentReference.bodySite').value"
