Extension: MadoDocumentReferenceBodySite
Id: ext-R5-DocumentReference.bodySite
Title: "Extension: DocumentReference.bodySite (R5 cross-version)"
Description: "Carries the R5 DocumentReference.bodySite (CodeableReference) for use in R4. Imported locally because hl7.fhir.uv.xver-r5.r4#0.1.0 models bodySite as a Reference only, without the CodeableConcept concept used by this IG."
Context: DocumentReference
* insert SetFmmAndStatusRule( 1, trial-use )
* value[x] 0..0
* extension contains concept 0..1 and reference 0..1
* extension[concept].value[x] only CodeableConcept
* extension[reference].value[x] only Reference
