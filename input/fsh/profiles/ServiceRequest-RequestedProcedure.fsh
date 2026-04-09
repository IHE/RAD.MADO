Profile: MadoRequestedProcedureOrder
Parent: ServiceRequest
Title: "ServiceRequest: Requested Procedure for Imaging Study"
Description: """
This profile on ServiceRequest represents the order for the Imaging Study and report. In DICOM this is referred
to as the *Requested Procedure*. The `code` element represents the requested imaging procedure type which includes
the requested modality.
"""

* insert SetFmmAndStatusRule( 1, draft )

* category 1..*
  * insert SliceElement( #value, $this )
* category contains imaging 1..1
* category[imaging] = $sct#363679005 // "Imaging"

* identifier
  * insert SliceElement( #value, type )
* identifier contains accessionNumber 0..1 and fillerNumber 0..* and placerNumber 0..*
* identifier[accessionNumber] only MadoAccessionNumberIdentifier
* identifier[fillerNumber] only MadoFillerNumberIdentifier
* identifier[placerNumber] only MadoPlacerNumberIdentifier

* code
  * ^short = "Requested procedure code, which includes the requested modality."
* code from ProcedureEuImagingType (example)



