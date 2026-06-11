Instance: MadoCompositionExample
InstanceOf: MadoComposition
Title: "Composition Example for FHIR Imaging Study Manifest"
Description: "Composition Example for FHIR Imaging Study Manifest"
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
* event[imaging-study].detail = Reference(ExampleImagingStudy)
* text
  * div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h1>Head CT</h1><table><tbody><tr><td><b>Study Instance UID</b></td><td>1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448</td></tr>        <tr><td><b>Subject</b></td><td><span>ExamplePatient</span></td></tr>        <tr><td><b>Author</b></td><td><span>MADO creator</span></td></tr>        <tr><td><b>Author</b></td><td><span>ACME</span></td></tr>        <tr><td><b>Created</b></td><td>2026-05-29</td></tr>        <tr><td><b>Type</b></td><td>Diagnostic imaging Study</td></tr>        <tr><td><b>Category</b></td><td>Medical-Imaging</td></tr>        <tr><td><b>Study Start</b></td><td>2018-02-27T09:48:29+01:00</td></tr>        <tr><td><b>Modalities</b></td><td>SM</td></tr>        <tr><td><b>Anatomical region</b></td><td>Upper trunk Thoracic segment of trunk</td></tr>        <tr><td><b>Accession number</b></td><td>http://hospital.org/acc | 2017092101</td></tr>        <tr><td><b>Number of series</b></td><td>1</td></tr></tbody>    </table></div>"
  * status = #generated