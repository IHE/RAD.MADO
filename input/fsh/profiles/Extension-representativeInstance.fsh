Extension: MadoRepresentativeInstanceExtension
Title: "Extension: Representative Instance"
Description: """An extension to indicate that a referenced instance on and ImagingStudy series is a 
representative instance for that series. This extension is used in the MADO context to indicate that a 
referenced instance on an ImagingStudy series is a representative instance for that series, which can be 
used for display purposes in the MADO context."""
Context: ImagingStudy.series, ImagingStudy.series.instance
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only boolean
* valueBoolean 1..1