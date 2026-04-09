Profile: MadoPlacerNumberIdentifier
Parent: Identifier
Title: "MADO Placer Number Identifier"
Description: """
Profile for the Placer Number Identifier used in the MADO context. This profile is used for the Identifier that represents the Placer Number in the MADO context. It includes additional
constraints and extensions specific to the MADO context, such as the value set for the type of identifier and the fixed value for the system of the identifier.
"""
* insert SetFmmAndStatusRule( 1, draft )
* system 1..1 
* value 1..1
* type 1..1
* type
  * coding
    * insert SliceElement( #value, $this )
  * coding contains placer 1..1 and dcm 0..1
  * coding[placer] = $v2-0203#PLAC "Placer Identifier"
  * coding[dcm] = $dicomOntology#121020 "Placer Number"