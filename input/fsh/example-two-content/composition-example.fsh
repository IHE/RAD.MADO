Instance: MadoCompositionExample
InstanceOf: MadoComposition
Title: "Composition Example for FHIR manifests"
Description: "Composition Example for FHIR manifests"
Usage: #inline
* status = #final
* date = "2025-05-08T00:00:00Z"
* type
  * coding[+] = $loinc#18748-4 "Diagnostic Imaging Study"
* subject = Reference(ExamplePatient)
* author[source-device] = Reference( MadoCreatorDeviceExample )
* author[source-organization] = Reference( MadoCreatorOrganizationExample )
* identifier
  * system = "urn:dicom:uid"
  * value = "1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"
* type = $loinc#18748-4 "Diagnostic imaging study"
* category = $loinc#18748-4 "Diagnostic imaging study"
* title = "CT of the head without contrast"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">CT of the head without contrast</div>"