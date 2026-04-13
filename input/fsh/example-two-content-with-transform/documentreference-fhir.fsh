Instance: DocumentReferenceFHIRwithTransform
InstanceOf: MadoFhirMinimalDocumentReference
Title: "DocumentReference Example for FHIR manifests with transform"
Description: "DocumentReference Example for FHIR manifests with transform service called to transform the KOS manifest into a FHIR manifest"
Usage: #example
* masterIdentifier[+]
  * system = "http://www.example.com/identifiers/documentreference"
  * value = "koewopfwjqoddasf"

* identifier[+]
  * system = "http://www.example.com/identifiers/documentreference"
  * value = "koewopfwjqoddasf"

* status = #current
* date = "2025-05-08T00:00:00Z"

* subject = Reference(pat-mrn-1538098370)
// * custodian = Reference(OrganizationSemiStructuredReport)

* insert DocumentReferenceDefaults

* extension[modality].valueCodeableConcept = http://dicom.nema.org/resources/ontology/DCM#MR

* extension[bodysite]
  * extension[concept]
    * valueCodeableConcept
      * coding[+] = $sct#61685007

* relatesTo[kosReference]
  * code = #transforms
  * target = Reference( DocumentReferenceKOSwithTransform )


* content[+]
  * extension[profile]
    * url = "http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.content.profile"
    * extension[value[x]]
      * url = "value[x]"
      * valueCanonical = Canonical( MadoFhirBundle )
  * format =  http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:rad:MADO:fhir-manifest:2026 // pending
  * attachment[+]
    * contentType = #application/fhir+json
    * url = "http://kos2FhirTranformService.example.com/transform?url=http://mhdserver.example.com/Binary/mado-kos-manifest-binary" 
    * language = #de-DE
    * creation = "2025-05-08T00:00:00Z"

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

