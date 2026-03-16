{% include aliases.md %}

The following MHD DocumentReferences SHALL be used when distributing a MADO Imaging Manifest in an {{iheMHD}} environment:

* {{MadoFhirMinimalDocumentReference}} for FHIR Manifests 
* {{MadoDicomKosMinimalDocumentReference}} for DICOM KOS Manifests

An IHE-MHD infrastructure may choose or not a mapping service between the two manifest formats. In the case it supports a mapping service, the address field in the unsupported DocumentReference to the mapping service that will return the translated document.

In the case the manifest is available in multiple formats, the Document Consumer SHOULD show to the user a single entry representing all possible formats.

As is stated in section X.6.1, Manifest Creators SHALL create the manifest in the format of their choice. The selection is made at deployment time (see section X.6.1 for more detail).

The figure below shows the `MHD DocumentReference`s including the most relevant restrictions and its relationship with the manifests and each other.

{% include img.html img="manifest-envelope.drawio.svg" caption="Figure: IHE-MHD envelope" %}


The main choices illustrated in the figure are:

* There are two different DocumentReferences, one for the FHIR and one for the DICOM KOS representation. When both are present, the relatesTo field points to the other representation.
* A FHIR manifest is represented as a FHIR json encoded FHIR {{Bundle}} following the profile {{MadoFhirBundle}}. This Bundle contains the {{ImagingStudy}} resource as well other resources such as the {{Patient}} and various {{Endpoint}}s.
* A KOS manifest is represented as a DICOM encoded DICOM instance following the MADO KOS profile.

The FHIR-manifest can be translated into the KOS-manifest and vice-versa allowing applications to change the representation when needed.

{% include stunote.html text="In this specification the choice for presenting the manifest in an IHE-MHD environment is representing them as two separate DocumentReference instances. Feedback is requested from the implementer community whether this is the approach is correct and adequate."%}

### Related FHIR profiles

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND ( Name LIKE '%DocumentReference' )",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Search parameters

#### Imaging specific search parameters

Imaging specific search parameters include:

{:.grid}
| **Name** | **Type** | **Description** | **Expression** |
| =====| ===== | ===========| ========== |
| [bodysite](SearchParameter-SearchParameterDocumentReferenceBodySite.html) | [token](https://hl7.org/fhir/R4/search.html#token) | The body site studied | DocumentReference.bodySite.concept |
| [modality](SearchParameter-SearchParameterDocumentReferenceModality.html) | [token](https://hl7.org/fhir/R4/search.html#token) | The modality used | DocumentReference.modality |

#### {{iheMHD}} search parameters

General {{iheMhd}} defined search parameters are:

{:.grid}
| **Name** | **Type** | **Description** | **Expression** |
| =====| ===== | ===========| ========== |
| author | [reference](https://hl7.org/fhir/R4/search.html#reference) | Who and/or what authored the document | DocumentReference.author |
| author.given & author.family | [string](https://hl7.org/fhir/R4/search.html#string) | This parameters, of type string, specify the name parts of the author person, which is associated with the DocumentReference Resource, or in Document Sharing nomenclature, the author of the Document Entry. See ITI TF-2x: Appendix Z.2 for use of the string data type. This use of author.given and author.family follows the FHIR Chaining Parameters search methodology. ||
| category | [token](https://hl7.org/fhir/R4/search.html#token) | This parameter, of type token, specifies the general classification of the DocumentReference Resource, or in Document Sharing nomenclature, the classCode of the Document Entry. See ITI TF-2x: Appendix Z.2 for additional constraints on the use of the token search parameter type. | DocumentReference.category |
| creation | [date](https://hl7.org/fhir/R4/search.html#date) | Date attachment was first created | DocumentReference.content.attachment.creation | 
| date | [date](https://hl7.org/fhir/R4/search.html#date) | When this document reference was created | DocumentReference.date |
| event| [token](https://hl7.org/fhir/R4/search.html#token) | This parameter, of type token, specifies the main clinical acts documented by the DocumentReference Resource, or in Document Sharing nomenclature, the eventCodeList of the Document Entry. See ITI TF-2x: Appendix Z.2 for additional constraints on the use of the token search parameter type. | DocumentReference.context.event |
| format | [token](https://hl7.org/fhir/R4/search.html#token) | Format code content rules for the (DocumentReference.content.profile.value.ofType(Coding)) | DocumentReference.content.format|
| facility | [token](https://hl7.org/fhir/R4/search.html#token) | Kind of facility where patient was; or in Document Sharing nomenclature, the healthcareFacilityTypeCode of the Document Entry. See ITI TF-2x: Appendix Z.2 for additional constraints on the use of the token search parameter type. | DocumentReference.context.facilityType |
| identifier | [token](https://hl7.org/fhir/R4/search.html#token) | Identifier of the attachment binary DocumentReference.identifier |
| patient | [reference](https://hl7.org/fhir/R4/search.html#reference) | Who/what is the subject of the DocumentReference | DocumentReference.subject.where(resolve() is Patient) |
| patient.identifier | token | This parameter, of type token, specifies an identifier associated with the patient to which the DocumentReference Resource is assigned. See ITI TF-2x: Appendix Z.2 for additional constraints on the use of the token search parameter type. This use of patient.identifier follows the FHIR Chaining Parameters search methodology. | |
| period | [date](https://hl7.org/fhir/R4/search.html#date) | the time of service that is being documented by the DocumentReference. The period search parameter specifies an interval which the time of service overlaps. | DocumentReference.period |
| related | [reference](https://hl7.org/fhir/R4/search.html#reference) | represents other identifiers associated with the DocumentReference Resource, or in Document Sharing nomenclature, the referenceIdList of the Document Entry. | DocumentReference.context.related |
| security-label | [token](https://hl7.org/fhir/R4/search.html#token) | Document security-tags | DocumentReference.securityLabel |
| setting | [token](https://hl7.org/fhir/R4/search.html#token) | the specific practice setting of the DocumentReference Resource, or in Document Sharing nomenclature, the practiceSettingCode of the Document Entry. | DocumentReference.context.practiceSetting |
| status | [token](https://hl7.org/fhir/R4/search.html#token) | The status of the DocumentReference Resource | DocumentReference.status |
| type | [token](https://hl7.org/fhir/R4/search.html#token) | Kind of document (LOINC if possible) | DocumentReference.type |

