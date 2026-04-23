Profile: MadoRequestedProcedure
Parent: ServiceRequest
Title: "MADO Requested Procedure"
Description: """
A profile for the ServiceRequest resource that represents the Requested Procedure (see 6.X.2.8.1 Referenced Request Macro Description).
"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier
  * insert SliceElement( #value, type.coding )
* identifier contains accessionNumber 1..1 MS and placer 0..* MS and filler 0..*
* identifier[accessionNumber] only MadoAccessionNumberIdentifier
  * ^short = "The Accession Number, the issuer of the accession number and the locally unique number that identifies the Imaging Service Request."

* identifier[placer]
  * ^short = "The identifier assigned by the system that placed the order."
  * type 1..1
    * coding
      * insert SliceElement( #value, $this )
    * coding contains placer 1..1
    * coding[placer] = $v2-0203#PLAC

* identifier[filler]
  * ^short = "The identifier assigned by the system that filled the order."
  * type 1..1
    * coding
      * insert SliceElement( #value, $this )
    * coding contains filler 1..1
    * coding[filler] = $v2-0203#FILL

* status 1..1
  * ^short = "The status of the requested procedure, typically set to completed."
* intent 1..1
  * ^short = "The intent of the requested procedure, typically set to order."
  
* code 
  * ^short = "The `Requesting Service Code Sequence` or (when not available) the `Procedure Code` from the DICOM study."
* code from ProcedureEuImagingType (example)

