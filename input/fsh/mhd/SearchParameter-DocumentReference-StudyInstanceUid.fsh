
Instance: SearchParameterDocumentReferenceStudyInstanceUid 
InstanceOf: SearchParameter
Usage: #definition
* name = "DocumentReferenceStudyInstanceUid"
* extension[+]
  * url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-standards-status"
  * valueCode = #trial-use
* status = #active
* experimental = false 
* description = """Searches for document references with a specific Study Instance UID."""
* code = #study-instance-uid
* base[+] = #DocumentReference
* type = #token
* expression = "DocumentReference.context.related.identifier.where( type.coding.where( system= 'http://dicom.nema.org/resources/ontology/DCM' and code = '110180' ).exists())"
