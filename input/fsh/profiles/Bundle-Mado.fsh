Profile: MadoFhirBundle
Parent: Bundle
Title: "MADO FHIR Bundle"
Description: """
Profile for FHIR Bundles used in the MADO context. This profile is used for the FHIR Bundles that 
represent imaging manifests using the DICOM KOS format in the MADO context. It includes additional
constraints and extensions specific to imaging manifests, such as the type of
report, the clinical specialty, and the anatomical region of interest.
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier 1..1 MS
* type = #collection
* total ..0
* entry 1..*
  * insert SliceElement( #profile, resource )
* entry contains
    imaging-study 1..1 and
    patient 0..1 and
    endpoint 1..* and
    creator 1..1 and
    requested-procedure 0..* 
* entry[imaging-study].resource only MadoImagingStudy
  * ^short = "Imaging Study holding information on the structure of the study."
* entry[patient].resource only Patient
  * ^short = "Patient the study is about."
* entry[creator].resource only MadoCreator
  * ^short = "Information on the author of the study."
* entry[endpoint].resource only Endpoint
  * ^short = "Endpoint holding information on how to retrieve the study data."
* entry[requested-procedure].resource only ServiceRequest
  * ^short = "Service Request holding information on the order."
