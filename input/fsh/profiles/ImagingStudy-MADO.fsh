Profile: MadoImagingStudy
Parent: ImagingStudy
Title: "MADO Imaging Study"
Description: """
Profile for ImagingStudy resources used in the MADO context. This profile is used for the ImagingStudy resources that represent the imaging studies in the MADO context. It includes additional constraints and extensions specific to the MADO context, such as the type of imaging study, the clinical specialty, and the anatomical region of interest.

When a instance in the study represents a Key Object Selection document [TID 2010](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_tid_2010.html), the `ImagingStudy.series.instance.extension[ko-document-title]` contains the document title code of the referenced document, using the `MadoKoDocumentTitle` extension and the `ImagingStudy.series.instance.description` field the contents of the KeyObjectSelectionDescription field.
"""
* insert SetFmmAndStatusRule( 1, draft )
* obeys MadoImagingStudy-endpoint-required
* identifier 1..*
* identifier
  * insert SliceElement( #profile, $this )
* identifier contains study-instance-uid 1..1 MS
* identifier[study-instance-uid] only MadoStudyInstanceUidIdentifier


* extension contains MadoAnatomicalRegionExtension named anatomical-region 0..* MS and MadoCreatorExtension named creator 1..1 MS
* extension[anatomical-region] ^short = "The anatomical regions covered by the study."
* extension[anatomical-region] ^definition = """
The anatomical regions covered by the study, depending on the study there can be zero, one or more regions. 
The regions SHALL overlap with the bodysite references from `ImagingStudy.serie.bodysite`.
"""
* extension[creator] ^short = "The creator of the MADO, which is the device that created the ImagingStudy resource in the MADO context."

* subject 1..1 MS
* subject only Reference( MadoPatient )

* basedOn
  * insert SliceElement( #type, $this )
* basedOn contains order 0..1 MS
* basedOn[order] only MadoReferencedAccessionNumberIdentifier

* endpoint 
  * insert SliceElement( #profile, [[$this.resolve()]] )
* endpoint contains webviewer 0..* MS
* endpoint[webviewer] only Reference(MadoWebViewerEndpoint)

* modality MS
* started MS
* description MS
* procedureCode MS

* series
  * uid 1..1 MS
  * number MS
  * modality MS
  * description MS
  * numberOfInstances MS
  * bodySite MS
  * specimen MS
  * started MS
  
  * endpoint 1..*
    * insert SliceElement( #profile, [[$this.resolve()]] )
  * endpoint contains wado 0..* MS
  * endpoint[wado] only Reference(MadoWadoEndpoint)
  
  * instance
    * uid 1..1 MS
    * sopClass MS
    * number MS

    * extension contains 
        MadoNumberOfFrames named number-of-frames 0..1 MS and 
        MadoKoDocumentTitle named ko-document-title 0..1 MS
    * extension[number-of-frames] ^short = "The number of frames in an ImagingStudy instance."
    * extension[ko-document-title] ^short = "When this instance represents a Key Object Selection document, this extension contains the document title code of the referenced document."

Invariant: MadoImagingStudy-endpoint-required
Description: "An endpoint reference is required for each series in the ImagingStudy, or for the ImagingStudy itself if there are no series."
Severity: #error
Expression: "endpoint.exists() or series.endpoint.all($this.exists())"