
Instance: SearchParameterDocumentReferenceAccessionNumber 
InstanceOf: SearchParameter
Usage: #definition
* name = "DocumentReferenceAccessionNumber"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial-use
* status = #active
* experimental = false 
* description = """Searches for document references with a specific Accession Number."""
* code = #accession-number
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.context.related.identifier.where( type.coding.where( system= 'http://dicom.nema.org/resources/ontology/DCM' and code = '121022' ).exists())"
