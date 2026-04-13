Instance: mado-bundle-589331894518000
InstanceOf: MadoFhirBundle
Title: "Bundle: MADO FHIR document"
Description: "An example of a MADO FHIR manifest."
Usage: #example
* type = #collection
* identifier
  * system = "http://www.example.com/identifiers/mado-bundle"
  * value = "koewopfwjqoddasf"
* timestamp = "2026-02-24T11:48:21.136+01:00"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4fe96b54-204d-4f98-ae8d-491869a8ba01"
* entry[0].fullUrl = "urn:ImagingStudy/1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"
* entry[=].resource = ExampleImagingStudy
* entry[+].fullUrl = "urn:Endpoint/wado-url-endpoint-84713519"
* entry[=].resource = wado-url-endpoint-84713519
* entry[+].fullUrl = "urn:Patient/pat-mrn-1538098370"
* entry[=].resource = pat-mrn-1538098370
* entry[+].fullUrl = "urn:Device/device-creator"
* entry[=].resource = device-creator
