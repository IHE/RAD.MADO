Profile: MadoRequestedProcedure
Parent: ServiceRequest
Title: "MADO Requested Procedure"
Description: """A profile for the ServiceRequest resource that represents the Requested Procedure."""
* insert SetFmmAndStatusRule( 1, draft )
* identifier
  * insert SliceElement( #value, type.coding )
* identifier contains accessionNumber 0..1 MS and placer 0..* MS and filler 0..* MS
* identifier[accessionNumber] only MadoAccessionNumberIdentifier
* identifier[placer]
  * type
    * coding
      * insert SliceElement( #value, $this )
    * coding contains placer 1..1
    * coding[placer] = $v2-0203#PLAC

* identifier[filler]
  * type
    * coding
      * insert SliceElement( #value, $this )
    * coding contains filler 1..1
    * coding[filler] = $v2-0203#FILL

* code MS
  * ^short = "Requested procedure"
* code from ProcedureEuImagingType (example)

* requester MS
* reasonCode MS
