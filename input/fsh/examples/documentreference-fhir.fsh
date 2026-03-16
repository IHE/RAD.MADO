Instance: DocumentReferenceFHIR
InstanceOf: MadoFhirMinimalDocumentReference
Title: "DocumentReference Example for FHIR manifests"
Description: "DocumentReference Example for FHIR manifests"
Usage: #example
* masterIdentifier[+]
  * system = "http://www.example.com/identifiers/documentreference"
  * use = #usual
  * value = "1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"

* status = #current
* date = "2025-05-08T00:00:00Z"

* subject = Reference(pat-mrn-1538098370)
// * custodian = Reference(OrganizationSemiStructuredReport)

* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR

* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#61685007

* relatesTo[kosReference]
  * code = #transforms
  * target = Reference( DocumentReferenceKOS )


* content[+]
  * extension[profile]
    * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.content.profile"
    * extension[value[x]]
      * url = "value[x]"
      * valueCanonical = Canonical( MadoFhirBundle )
  * format =  http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:rad:MADO:fhir-manifest:2026 // pending
  * attachment[+]
    * contentType = #application/fhir+json
    * url = "Bundle/fhir-manifest-bundle"
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"

* context
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

