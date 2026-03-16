Extension: MadoAnatomicalRegionExtension
Title: "Extension: Anatomical Region"
Description: "The anatomical region in an ImagingStudy instance. This is additional information next to ImagingStudy.series.bodySite."
Context: DiagnosticReport, ImagingStudy
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only CodeableConcept
* valueCodeableConcept from ValueSetAnatomicalRegion (required)
  * coding 1..*
    * insert SliceElement( #value, $this )
  * coding contains anatomical-region 1..*
  * coding[anatomical-region] from ValueSetAnatomicalRegion (required)
