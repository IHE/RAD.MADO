Profile: MadoComposition
Parent: Composition
Title: "MADO Composition"
Description: """This profile is needed as 
FHIR Bundles of type `document` require a `Composition` resource as the first entry. Instances of this profile can be rendered in normal document based system without the need for the Client to understand the MADO-specific profiles, while still allowing to capture the necessary information about the creator of the manifest in a structured way.

It also provides fields that allow communication of typical document related information such as author.
"""
* insert SetFmmAndStatusRule( 1, draft )
* text 1..1 MS
  * status = #generated
* identifier 1..1 MS
  * ^short = "An OID according for a FHIR-Based formatted Imaging Study Manifest. The OID is structured according to the DICOM UI value representation. In the case that a DICOM KOS manifest is present, this field will hold the same value as the SOP Instance UID of the corresponding translated DICOM KOS manifest."

* type 1..1 MS
  * ^short = "Kind of document (LOINC if possible), see section 6.X.6 of volume 3."
* category MS
  * ^short = "Categorization of document, see section 6.X.6 of volume 3."

* subject 1..1 MS
* subject only Reference( MadoPatient )
* date 1..1 MS
  * ^short = "When the manifest was created."

* author
  * ^short = "Who and/or what authored the document (i.e. manifest)"
  * insert SliceElement( #profile, [[$this.resolve()]] )
* author contains source-organization 1..1 and source-device 1..1
* author[source-device] only Reference( MadoCreator )
  * ^short = "The device that generated the manifest."
* author[source-organization] only Reference( MadoCreatorOrganization )
  * ^short = "The organization that generated the manifest."
* title MS
  * ^short = "Human readable title to display for the manifest."
* custodian
  * ^short = "The organization that is the custodian of the manifest."

* section 0..* MS
  * ^short = "Optionally, one or more sections. Each section provides informtion on a series in the study." 
  * text 1..1 MS
    * ^short = """
    A human readable narrative that contains the information about the section. This narrative should contain at least:
    * the series instance UID
    * the series description
    * the number of instances in the series
    * the modality
    * the body site and laterality 
    
    """
  * entry 0..*
    * insert SliceElement( #profile, [[$this.resolve()]] )
  * entry contains wado-endpoint 0..*
  * entry[wado-endpoint] only Reference( MadoWadoEndpoint )
    * ^short = "The WADO endpoint that can be used to retrieve the referenced DICOM objects."
