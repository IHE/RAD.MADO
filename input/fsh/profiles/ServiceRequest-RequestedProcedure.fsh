Profile: MadoRequestedProcedure
Parent: ServiceRequest
Title: "MADO Requested Procedure"
Description: """
A profile for the ServiceRequest resource that represents the Requested Procedure (see 6.X.2.8.1 Referenced Request Macro Description).
"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier
  * insert SliceElement( #value, type.coding )
* identifier contains accession-number 1..1 MS and placer 0..* MS and filler 0..*
* identifier[accession-number] only MadoAccessionNumberIdentifier
  * ^short = "The Accession Number, the issuer of the accession number and the locally unique number that identifies the Imaging Service Request."

* identifier[placer]
  * ^short = "The identifier assigned by the system that placed the order."
  * type 1..1
    * coding 1..*
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "code"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.ordered               = false
      * ^slicing.rules                 = #open
    * coding contains placer 1..1
    * coding[placer].system
      * ^fixedUri = $v2-0203
    * coding[placer].code
      * ^fixedCode = #PLAC  

* identifier[filler]
  * ^short = "The identifier assigned by the system that filled the order."
  * type 1..1
    // * insert SliceElementWithDescription( filler, $v2-020, #FILL )
    * coding 1..*
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "code"
      * ^slicing.discriminator[+].type = #value
      * ^slicing.discriminator[=].path = "system"
      * ^slicing.ordered               = false
      * ^slicing.rules                 = #open
    * coding contains filler 1..1
    * coding[filler].system
      * ^fixedUri = $v2-0203
    * coding[filler].code
      * ^fixedCode = #FILL


* status 1..1
  * ^short = "The status of the requested procedure, typically set to completed."
* intent 1..1
  * ^short = "The intent of the requested procedure, typically set to order."
  
* code 
  * ^short = "The `Requesting Service Code Sequence` or (when not available) the `Procedure Code` from the DICOM study."
* code from ProcedureEuImagingType (example)

