Profile: MadoImagingStudy
Parent: ImagingStudy
Title: "MADO Imaging Study"
Description: """
Profile for ImagingStudy resources that represent the imaging studies manifest in the MADO context. It includes additional constraints and extensions specific to the MADO context, such as the study modality, the clinical specialty, the anatomical region of interest, the presence of significant images.

In the case significant images are present, an instance referenced in the `ImagingStudy` is a Key Object Selection document [TID 2010](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_tid_2010.html), the `ImagingStudy.series.instance.extension[ko-document-title]` SHALL contain the Document Title code of the referenced document, and the `ImagingStudy.series.instance.description` field contains the contents of the KeyObjectSelectionDescription field.
"""
* insert SetFmmAndStatusRule( 1, draft )

* identifier 1..*
* identifier
  * insert SliceElement( #profile, $this )
* identifier contains study-instance-uid 1..1 MS
* identifier[study-instance-uid] only MadoStudyInstanceUidIdentifier


* extension contains MadoAnatomicalRegionExtension named anatomical-region 0..* MS // and MadoCreatorExtension named creator 1..1 MS
* extension[anatomical-region] ^short = "The anatomical regions covered by the study."
* extension[anatomical-region] ^definition = """
The anatomical regions covered by the study, depending on the study there can be zero, one or more regions. 
The regions SHALL overlap with the bodysite references from `ImagingStudy.series.bodysite`.
"""
//* extension[creator] ^short = "The creator of the MADO imaging study manifest."

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
  * ^short = "The `ProcedureCode`s associated with the study."
* numberOfSeries 1..1 MS

* series
  * uid 1..1 MS
  * number MS
  * modality MS
  * description MS
  * numberOfInstances 1..1 MS
  * bodySite MS
//  * laterality MS
  * specimen MS
  * started MS
  
  * endpoint 1..*
    * insert SliceElement( #profile, [[$this.resolve()]] )
  * endpoint contains wado 1..* MS
  * endpoint[wado] only Reference(MadoWadoEndpoint)
  
  * instance
    * uid 1..1 MS
    * sopClass MS
    * number MS
    * title MS
      * ^short = "Will contain the Key Object Description in the case the instance represents a Key Object."
    * extension contains 
        MadoNumberOfFrames named number-of-frames 0..1 MS and 
        MadoKeyObjectDocumentTitle named ko-document-title 0..1 MS
    * extension[number-of-frames] ^short = "The number of frames in an ImagingStudy instance."
    * extension[ko-document-title] ^short = "When this instance represents a Key Object Selection document, this extension contains the document title code of the referenced document."

// Invariant: procedureCode.text.exists() or  procedureCode.coding.display.exists()

// Invariant:   mado-docref-1
// Description: "masterIdentifier, when used, need to be present as an identifier as well"
// Severity:    #error
// Expression:  "masterIdentifier.exists() implies identifier.where( %resource.masterIdentifier.system = system and %resource.masterIdentifier.value = value ).exists()"
