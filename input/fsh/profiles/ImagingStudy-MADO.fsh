Profile: MadoImagingStudy
Parent: ImagingStudy
Title: "MADO Imaging Study"
Description: """
Profile for ImagingStudy resources used in the MADO context. This profile is used for the ImagingStudy resources that represent the imaging studies in the MADO context. It includes additional
constraints and extensions specific to the MADO context, such as the type of imaging study, the clinical specialty, and the anatomical region of interest.
"""
* insert SetFmmAndStatusRule( 1, draft )
* obeys MadoImagingStudy-endpoint-required
* identifier 1..*
* identifier
  * insert SliceElement( #profile, $this )
* identifier contains study-instance-uid 1..1
* identifier[study-instance-uid] only MadoStudyInstanceUidIdentifier


* extension contains MadoAnatomicalRegionExtension named anatomical-region 0..* and MadoCreatorExtension named creator 1..1
* extension[anatomical-region] ^short = "The anatomical regions covered by the study."
* extension[anatomical-region] ^definition = """
The anatomical regions covered by the study, depending on the study there can be zero, one or more regions. 
The regions SHALL overlap with the bodysite references from `ImagingStudy.serie.bodysite`.
"""
* extension[creator] ^short = "The creator of the MADO, which is the device that created the ImagingStudy resource in the MADO context."

* subject 1..1

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains order 0..1
* basedOn[order] only MadoReferencedAccessionNumberIdentifier

* endpoint 
  * insert SliceElement( #profile, [[$this.resolve()]] )
* endpoint contains webviewer 0..* 
* endpoint[webviewer] only Reference(MadoWebViewerEndpoint)

* series
  * uid 1..1
  * extension contains MadoRepresentativeInstanceExtension named representative-instance 0..1
  * extension[representative-instance] ^short = "Indicates that a referenced instance on and ImagingStudy series is a representative instance for that series."

  * endpoint 1..*
    * insert SliceElement( #profile, [[$this.resolve()]] )
  * endpoint contains wado 0..* and wado-with-location-uid 0..*
  * endpoint[wado] only Reference(MadoWadoEndpoint)
  * endpoint[wado-with-location-ui] only Reference(MadoXcWadoEndpoint)

  * instance
    * uid 1..1
    * extension contains 
        MadoRepresentativeInstanceExtension named representative-instance 0..1 and
        MadoNumberOfFrames named number-of-frames 0..1
    * extension[representative-instance] ^short = "Indicates that a referenced instance on and ImagingStudy series is a representative instance for that series."
    * extension[number-of-frames] ^short = "The number of frames in an ImagingStudy instance."

Invariant: MadoImagingStudy-endpoint-required
Description: "An endpoint reference is required for each series in the ImagingStudy, or for the ImagingStudy itself if there are no series."
Severity: #error
Expression: "endpoint.exists() or series.endpoint.all($this.exists())"