Instance: mado-bundle-589331894518000
InstanceOf: MadoFhirBundle
Title: "Bundle: MADO FHIR document"
Description: "An example of an FHIR Imaging Study Manifest."
Usage: #example
* type = #document
* identifier
  * system = "http://www.example.com/identifiers/mado-bundle"
  * value = "koewopfwjqoddasf"
* timestamp = "2026-02-24T11:48:21.136+01:00"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4fe96b54-204d-4f98-ae8d-491869a8ba01"

* entry[+].fullUrl = "https://profiles.ihe.net/RAD/MADO/Composition/MadoCompositionExample"
* entry[=].resource = MadoCompositionExample

* entry[+].fullUrl = "https://profiles.ihe.net/RAD/MADO/ImagingStudy/ExampleImagingStudy"
* entry[=].resource = ExampleImagingStudy

* entry[+].fullUrl = "https://profiles.ihe.net/RAD/MADO/Endpoint/MadoWadoEndpointExample"
* entry[=].resource = MadoWadoEndpointExample

* entry[+].fullUrl = "https://profiles.ihe.net/RAD/MADO/Patient/ExamplePatient"
* entry[=].resource = ExamplePatient

* entry[+].fullUrl = "https://profiles.ihe.net/RAD/MADO/Device/MadoCreatorDeviceExample"
* entry[=].resource = MadoCreatorDeviceExample

* entry[+].fullUrl = "https://profiles.ihe.net/RAD/MADO/Organization/MadoCreatorOrganizationExample"
* entry[=].resource = MadoCreatorOrganizationExample

// * entry[+].fullUrl = "http://example.org/fhir/Provenance/provenance-example"
// * entry[=].resource = provenance-example
