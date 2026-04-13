Profile: MadoAccessionNumberIdentifier
Parent: Identifier
Title: "MADO Accession Number Identifier"
Description: """
Profile for the Accession Number Identifier used in the MADO context. This profile is used for the Identifier that represents the Accession Number in the MADO context. It includes additional
constraints and extensions specific to the MADO context, such as the value set for the type of identifier and the fixed value for the system of the identifier.
"""
* insert SetFmmAndStatusRule( 1, draft )
* system 1..1 
* value 1..1
* type 1..1
* type
  * coding
    * insert SliceElement( #value, $this )
  * coding contains v2-0203-coding 1..1 and dcm 1..1 // and xds
  * coding[v2-0203-coding] = $v2-0203#ACSN "Accession Id"
  * coding[dcm] = $dicomOntology#121022 "Accession Number"
  // * coding[xds] = ????#urn:ihe:iti:xds:2013:accession 
// urn:ihe:iti:xds:2013:accession  
// https://profiles.ihe.net/ITI/TF/Volume3/ch-4.2.html#4.2

Profile: MadoReferencedAccessionNumberIdentifier
Parent: Reference
Title: "MADO Referenced Accession Number Identifier"
Description: """
Profile for the Reference that contains the Accession Number Identifier used in the MADO context. This profile is used for the Reference that contains the Identifier that represents the Accession Number in the MADO context. It includes additional
constraints and extensions specific to the MADO context, such as the value set for the type of identifier and the fixed value for the system of the identifier.
"""
* insert SetFmmAndStatusRule( 1, draft )
* identifier 1..1
* identifier only MadoAccessionNumberIdentifier