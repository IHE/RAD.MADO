# Comments from Antje and responses

## pdf-based comments

### Section 6.x.3

I would  make the third Paragraph (this section specifies..) the Introduction to the section and list the requirements afterwards. Also I think it would be good, to sort the requirements by Creator and Consumer.

Response:
  * CP: OK I moved the third paragraph first.  I know Wim and Kevin prefer the hard requirement first, but your proposal makes the reading easier.
  
With regards to the Consumer text, “If a Consumer claims support for processing a FHIR-based Imaging Study Manifest, it shall process its content as specified in this section. Was it meant to related to the paragraph: “Within the MADO Profile, these specifications are part of the Profile requirements (see Section X.1, MADO Actors, Transactions, and Content Modules).”? Then I would write those two sentences closer to each other. Because otherwise it is not clear, what these specifications refers to.

Response:
  * CP: I added the title of the specifications to remove the ambiguity.
 

### Section 6.x.4

I think the sentence is misleading: "This MADO HL7 FHIR Envelope specification shall be used in conjunction with the IHE MHD or MHDS Profiles when the Imaging Study Manifest is shared in either FHIR-based format or DICOM KOS-based format (see Sections X.6.1 and X.6.2)." Does this mean, that I need to use a the FHIR envelope also, when operating KOS based?

Response:
  * CP: Absolutely.  The Doc Reference resource is required and includes in Base64 the Part 10 wrapped DICOM KOS SOP Class.

 
## FHIR comments

### imaging manifest

#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/fhir-imaging-manifest.html> Related FHIR Profiles: The text says, the following links are provided for convenience, nevertheless there is normative text included (which admittedly is copied from the pages for the referenced resources). However, I think we should not provide normative text in sections that are marked for convenience.

Response:
* CP: Above there is a SHALL statement: The manifest is a FHIR bundle that SHALL conform to the MADO FHIR Bundle profile.   The list of “FHIR Profile” provided for convenience are all included within the “MADO FHIR Bundle”.  I propose to make the point explicit: Replace: “The following links are provided for convenience.” By: “The following links are provided for convenience as they are explicitly required in the MADO Manifest FHIR Bundle profile.”
* BvdH: V

 
#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/fhir-imaging-manifest.html> Examples: The word based occurs twice

Response:
* CP: OK.
* BvdH: V

#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/fhir-imaging-manifest.html> Examples: The second sentence in the second paragrah (The Bundle Resource the FHIR Imaging Study Manifest) is incomplete. Either add a verb, or make this sentence continuation of the previous sentence.

Response:
* CP: Correct: “The sections below show the various MADO data elements that are generated based based on a DICOM study.
The Binary resource contains the DICOM KOS Manifest for the study. The Bundle resource contains the FHIR Imaging Study Manifest. The DocumentReference instances provide MHD DocumentReference instances that point to these manifests.”
* BvdH: V
 
#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/fhir-imaging-manifest.html: In the text directly under the figure, you talk About the MADO FHIR Bundle, however in the resource Definition (at https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/StructureDefinition-MadoFhirBundle.html) you talk about the MADO Imaging Study Manifest FHIR Bundle

* CP: MADO Imaging Study Manifest FHIR Bundle should be the official name.
Update the text under the figure to say: “The imaging study manifest is a FHIR bundle that SHALL conform to the MADO imaging Study Manifest FHIR Bundle profile. 
* BvdH: V

#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/StructureDefinition-MadoFhirBundle.html: Bundle.identifier states "An OID according to the DICOM value representation UI. This field will hold the same value that is used as the SOP Instance UID of the corresponding DICOM KOS manifest." What happens if there is no KOS? Section X.1.1.1 it states, "The Content Creator shall be configurable to produce either format." For me that means that there are Scenarios where only one of the two is supported.

* CP: This is indeed not clear.  The intent is to have an OID that aligns with the DICOM UID format for the FHIR Bundle identifier, even if the manifest is only in a FHIR Format.  In case it needs to be mapped to a DICOM KOS based format, this UID will map to the SOP Instance UID.
Update the text to:
"An OID according to the DICOM value representation UI for a FHIR-Based formatted Imaging Study Manifest. This field will hold the same value that is could be used as the SOP Instance UID of the corresponding translated DICOM KOS manifest."  
* BvdH: V
 
#### Comment

In https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/StructureDefinition-MadoFhirBundle.html Bundle.type you are offering a list of possible types (document, message, …. collection). However you are stating that in this context collection is required. Why are you listing all the other types. And further more, in some subsequent entry files you are stating: " For bundles of type 'document' and 'message', …" Since you are stating in the type field that collection is required, the above Statement does not seem to be applicable at all. Is this how it is typically done in FHIR, that you are listing all of this, although by the restriction, these are not supported?

* CP: The multiple possible values are listed, but the value “collection” is stated as required.  I agree that this appears somewhat confusing.  Bas could suggest a clarification.
* BvdH: This is a FHIR artifact - similar issues have been reported in imaging report as well. The modelling is correct, the rendering is (a bit) unclear. I'll take it up with Lloyd during the WGM to see what we can do to improve the rendering.

#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/StructureDefinition-MadoCreator.html: "A profile for the Device resource that represents the creator of an ImagingStudy in the MADO context." What does ImagingStudy mean? The actual study that was created by an Acquisition device or the MADO Imaging Study Resource

* CP: With the introduction of the provenance resource it is not clear why the MADO Creator resource is present.  There is no need to have in the imaging manifest information about the acquisition device that acquired the imaging study referenced by the MADO imaging study manifest. 
Remove MADO Creator resource.
* BvdH: If we remove the profile we can no longer indicate that manufacturer, type and owner are required fields. Would renaming it/improving the description help?
  * A profile for the Device resource that represents the creator of an **FHIR imaging study manifest**." 
 
#### Comment

(https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/StructureDefinition-MadoCreator.html: What Instance is the Device.Identifier referring to? Is this meant to be an instance of the device? Is this the actual Resource identifier? But that one I thought would be presented in th Device.ID. Please note, this is not in the Key Elements view but in the snapshot view, which I accidentally landed at).

* CP: With the introduction of the provenance ressource it is not clear why the MADO Creator resource is present.  There is no need to have in the imaging manifest information about the acquisition device that acquired the imaging study referenced by the MADO imaging study manifest. 
Remove MADO Creator resource.
* BvdH: See reaction to similar comment above. I do not think the profile should be removed.
* BvdH: The Device.identifier, in FHIR, represents an identifier for the Device. The Device.id represents the primary key of the resource in the FHIR server it is stored in. 

#### Comment

https://build.fhir.org/ig/IHE/RAD.MADO/branches/master/StructureDefinition-MadoCreator.html: Device.type list a binding to a very Long list, from looking at it, I think none of the codes is applicable. I assume the device type refers to the content creator of the FHIR Manifest. So none of the codes I saw in that list seems to make sense.

* CP: With the introduction of the provenance resource it is not clear why the MADO Creator resource is present.  There is no need to have in the imaging manifest information about the acquisition device that acquired the imaging study referenced by the MADO imaging study manifest.
Remove MADO Creator resource.
* BvdH: See reaction to similar comment above. I do not think the profile should be removed.
* BvdH: The restriction requires that at least one CodeableConcept is required with the value `https://profiles.ihe.net/RAD/MADO/CodeSystem/MadoDeviceType#mado-creator`. No need to consider the list. The rendering could be improved here.
 
#### Comment

https://profiles.ihe.net/RAD/MADO/CodeSystem/MadoDeviceType. Device.type.coding mandates to use a fixed value of complex. But how is complex encoded?

* CP: With the introduction of the provenance resource it is not clear why the MADO Creator resource is present.  There is no need to have in the imaging manifest information about the acquisition device that acquired the imaging study referenced by the MADO imaging study manifest. 
Remove MADO Creator resource.
* BvdH: See reaction to similar comment above. I do not think the profile should be removed.
* BvdH: Not sure what is meant with the comment. The restriction requires that at least one CodeableConcept is required with the value `https://profiles.ihe.net/RAD/MADO/CodeSystem/MadoDeviceType#mado-creator`.
 
#### Comment

https://profiles.ihe.net/RAD/MADO/CodeSystem/MadoDeviceType. Device.type.system refers to https://profiles.ihe.net/RAD/MADO/CodeSystem/MadoDeviceType

However this link does not exist

* CP: With the introduction of the provenance ressource it is not clear why the MADO Creator resource is present.  There is no need to have in the imaging manifest information about the acquisition device that acquired the imaging study referenced by the MADO imaging study manifest. 
Remove MADO Creator resource.
* BvdH: See reaction to similar comment above. I do not think the profile should be removed.
* BvdH: This code system is used as the mandatory Device.type for MadoCreator devices.
 