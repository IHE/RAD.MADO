Extension: MadoKeyObjectDocumentTitle
Title: "Extension: MADO Document Title of Key Object Selection documents"
Description: """
The document title code of the Key Object Selection document [TID 2010](https://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_tid_2010.html) this instance refers to.
""" 
Context: ImagingStudy.series.instance
* insert SetFmmAndStatusRule( 1, draft )
* value[x] only CodeableConcept
* valueCodeableConcept from http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_7010.html (required)