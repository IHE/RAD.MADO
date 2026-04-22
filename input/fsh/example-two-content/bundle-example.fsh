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

* entry[0].fullUrl = "http://example.org/fhir/ImagingStudy/ExampleImagingStudy"
* entry[=].resource = ExampleImagingStudy

* entry[+].fullUrl = "http://example.org/fhir/Endpoint/wado-url-endpoint-84713519"
* entry[=].resource = wado-url-endpoint-84713519

* entry[+].fullUrl = "http://example.org/fhir/Patient/pat-mrn-1538098370"
* entry[=].resource = pat-mrn-1538098370

* entry[+].fullUrl = "http://example.org/fhir/Device/device-creator"
* entry[=].resource = device-creator

* entry[+].fullUrl = "http://example.org/fhir/Provenance/provenance-example"
* entry[=].resource = provenance-example
