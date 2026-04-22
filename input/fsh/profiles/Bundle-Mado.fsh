Profile: MadoFhirBundle
Parent: Bundle
Title: "MADO Imaging Study Manifest FHIR Bundle"
Description: """
Profile for FHIR Bundles used as a imaging study Manifest in the MADO context. It includes constraints and extensions specific to imaging study manifests, such as the type of study, the clinical specialty, and the anatomical region of interest.

"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier 1..1 MS

* timestamp 1..1 MS

* type = #collection

* total ..0

* entry 3..*
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.discriminator[+].type = #profile
* entry ^slicing.discriminator[=].path = "resource"
* entry ^slicing.rules = #open

* entry contains
    imaging-study 1..1 MS and
    patient 0..1 MS and
    wado-endpoint 1..* MS and
    web-endpoint 0..* MS and
    creator 1..1 MS and
    creator-organization 0..1 MS and
    requested-procedure 0..* MS and
    provenance 1..1 MS

* entry[imaging-study].resource only MadoImagingStudy
  * ^short = "ImagingStudy holding information on the structure of the study."

* entry[patient].resource only MadoPatient
  * ^short = "Patient the study is about."

* entry[creator].resource only MadoCreator
  * ^short = "The author of the manifest."

* entry[creator-organization].resource only MadoCreatorOrganization
  * ^short = "The organization of the author of the manifest."

* entry[wado-endpoint].resource only MadoWadoEndpoint
  * ^short = "Endpoint for retrieval of the study data."

* entry[web-endpoint].resource only MadoWebViewerEndpoint
  * ^short = "Endpoint launching a web viewer."

* entry[requested-procedure].resource only MadoRequestedProcedure
  * ^short = "ServiceRequest of the order for the study (Requested Procedure)."

* entry[provenance].resource only MadoProvenance
  * ^short = "Defines who created the Manifest."

