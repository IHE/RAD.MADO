Extension: MadoDocumentReferenceBodySite
Id: ext-R5-DocumentReference.bodySite
Title: "Extension: DocumentReference.bodySite"
Description: """
    Carries the R5 DocumentReference.bodySite.concept (CodeableReference) for use in R4. 
    Imported locally because hl7.fhir.uv.xver-r5.r4#0.1.0 does not include an extension 
    for it. Only the `concept` field has been mapped as this is the only element we need in
    this IG.
"""
Context: DocumentReference
* insert SetFmmAndStatusRule( 1, trial-use )
* value[x] only CodeableConcept
* extension 0..0
