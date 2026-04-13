Instance: DocumentReferenceKOSNoRelated
InstanceOf: MadoDicomKosMinimalDocumentReference
Title: "DocumentReference Example for DICOM KOS manifests and no related reference to the FHIR manifest example"
Description: "DocumentReference Example for DICOM KOS manifests with no related reference to the FHIR manifest example"
Usage: #example
* masterIdentifier[+]
  * system = "urn:dicom:uid"
  * value = "1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"

* identifier[+]
  * system = "urn:dicom:uid"
  * value = "1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"

* status = #current
* date = "2025-05-08T00:00:00Z"

* insert DocumentReferenceDefaults

* subject = Reference(pat-mrn-1538098370)
// * custodian = Reference(OrganizationSemiStructuredReport)

* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR

* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#61685007

* content[+]
  * attachment[+]
    * contentType = #application/dicom
    * url = "Binary/mado-kos-manifest-binary"
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"
  * format = http://dicom.nema.org/resources/ontology/DCMUID#1.2.840.10008.5.1.4.1.1.88.59	"Key Object Selection Document"

* context
  * period
    * start = "2018-02-27T09:48:29+01:00"
  * related[study-instance-uid].identifier
    * type
      * coding[dcm] = $dicomOntology#110180 "Study Instance UID"
    * system = "urn:dicom:uid"
    * value = "1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"
  * related[accession-number].identifier
    * type
      * coding[v2-0203-coding] = $v2-0203#ACSN "Accession Id"
      * coding[dcm] = $dicomOntology#121022 "Accession Number"
    * system = "http://hospital.org/acc"
    * value = "2017092101"