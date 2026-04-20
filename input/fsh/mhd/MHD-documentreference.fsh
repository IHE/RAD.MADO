Profile: MadoFhirMinimalDocumentReference
Parent: IHE.MHD.Minimal.DocumentReference
Title: "MADO MHD DocumentReference Profile for FHIR Imaging Manifests"
Description: """
MADO specific profile for the IHE-MHD Minimal Document Reference for MADO FHIR Manifests that includes the MADO specific content format, the extensions
related to body-site and modality, and the definition on where `StudyInstanceUID` and `AccessionNumber` are stored.

This profile copies most of the restrictions defined in the [MHD DocumentReference Comprehensive](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html) 
profiles (except `securityLabel`) and requires `context.period`.
"""
* insert SetFmmAndStatusRule( 1, draft )
* insert CommonMhdDocumentReferenceFields

* masterIdentifier
  * ^short = "The identifier of the FHIR bundle manifest."
  * ^definition = "This field is used to store the identifier of the FHIR bundle manifest."

* relatesTo 
  * insert SliceElement( #value, code )
* relatesTo contains kosReference 0..1
* relatesTo[kosReference] 
  * ^short = "Reference to the DocumentReference resource that contains the DICOM KOS manifest that corresponds to this imaging report in FHIR format"
  * code = #transforms
  * target only Reference( MadoDicomKosMinimalDocumentReference )
// category EU EEHRxFDocumentTypeMedicalImagingVS#Medical-Imaging
// type $loinc 18748-4/
//    $loinc#18748-4 "Diagnostic imaging study"
//    $loinc#85430-7 "Diagnostic imaging report - example sections and entries"


// content profile representation
* content 1..1
  * attachment 1..1
    * contentType = #application/fhir+json
  * format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn:ihe:rad:MADO:fhir-manifest:2026 // pending
  * extension contains  http://hl7.org/fhir/5.0/StructureDefinition/extension-DocumentReference.content.profile named profile 1..*
  * extension[profile]
    * ^short = "Contains the profile of the referred report"
    * extension[value[x]]
      * valueCanonical = Canonical( MadoFhirBundle )

Profile: MadoDicomKosMinimalDocumentReference
Parent: IHE.MHD.Minimal.DocumentReference
Title: "MADO MHD DocumentReference Profile for DICOM KOS Imaging Manifests"
Description: """
MADO specific profile for the IHE-MHD Minimal Document Reference for MADO DICOM KOS Manifests that includes the MADO specific content format, the extensions
related to body-site and modality, and the definition on where `StudyInstanceUID` and `AccessionNumber` are stored. 

This profile copies most of the restrictions defined in the [MHD DocumentReference Comprehensive](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Comprehensive.DocumentReference.html) 
profiles (except `securityLabel`) and requires `context.period`.

"""
* insert SetFmmAndStatusRule( 1, draft )
* insert CommonMhdDocumentReferenceFields

* masterIdentifier
  * ^short = "The SOP Instance UID of the DICOM KOS manifest."
  * ^definition = "This field is used to store the SOP Instance UID of the DICOM KOS manifest."

* relatesTo 
  * insert SliceElement( #value, code )
* relatesTo contains fhirReference 0..1
* relatesTo[fhirReference] 
  * ^short = "Reference to the DocumentReference resource that contains the FHIR manifest that corresponds to this imaging report in DICOM KOS format"
  * code = #transforms
  * target only Reference( MadoFhirMinimalDocumentReference )
* content
  * attachment 1..1
    * contentType = #application/dicom
  * format = http://dicom.nema.org/resources/ontology/DCMUID#1.2.840.10008.5.1.4.1.1.88.59	"Key Object Selection Document"


RuleSet: CommonMhdDocumentReferenceFields
* obeys mado-documentreference-masterIdentifier-also-identifier
// bodysite
* extension contains $CrossVersion-R5-DocumentReference.bodySite-for-R4 named bodysite 0..1 MS
* extension[bodysite].extension[concept] 1..1
* extension[bodysite].extension[concept]
  * valueCodeableConcept from ValueSetAnatomicalRegion (extensible)
  * ^short = "The anatomical region of the patient that is the focus of the imaging manifest, concept field is required."
  * ^definition = "This field may be used to provide additional information about the anatomical region of interest for the imaging manifest."

// // modality
* extension contains $CrossVersion-R5-DocumentReference.modality-for-R4 named modality 1..1 MS

* type 1..1 MS
* category 1..1 MS
* subject 1..1 MS
* content
  * attachment
    * language 1..1 MS
    * creation 1..1 MS 

// study Instance UID and accession number
* context 1..1
  * facilityType 1..1 MS 
  * practiceSetting 1..1 MS
  * period 1..1 MS
    * start 1..1
  * related 
    * insert SliceElement( #profile, identifier )
  * related contains study-instance-uid 1..1 MS and accession-number 0..1 MS
  * related[study-instance-uid] only MadoReferencedStudyInstanceUidIdentifier
    * ^short = "The Study Instance UID of the imaging study that is the focus of the imaging manifest, represented as an Identifier with a fixed system and a value that corresponds to the Study Instance UID."
  * related[accession-number] only MadoReferencedAccessionNumberIdentifier
    * ^short = "The Accession Number of the imaging study that is the focus of the imaging manifest, represented as an Identifier with a fixed system and a value that corresponds to the Accession Number."


Invariant:   mado-documentreference-masterIdentifier-also-identifier
Description: "masterIdentifier, when used, need to be present as an identifier as well"
Severity:    #error
Expression:  "masterIdentifier.exists() implies identifier.where( %resource.masterIdentifier.system = system and %resource.masterIdentifier.value = value ).exists()"
