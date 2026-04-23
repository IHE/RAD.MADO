{% include aliases.md %}

When distributing a MADO imaging manifest in an {{iheMHD}} environment the `DocumentReference` profiles defined below:

* FHIR Imaging Study Manifest SHALL be packaged with an envelope defined in {{MadoFhirDocumentReference}}.
* DICOM KOS Manifest envelopes SHALL be packaged with an envelope defined in  {{MadoDicomKosDocumentReference}}.

An IHE-MHD infrastructure may choose to provide one manifest format and implement a mapping service to the alternate format. When such a mapping service is provided, the `address` field in the alternate `DocumentReference` includes a fully populated url to the mapping service that, when called, will return the manifest in the alternate format.

In the case the manifest is available in multiple formats, the Document Consumer SHOULD show to the user a single entry.

As is stated in section X.6.1, Manifest Creators will create the manifest in the format of their choice. The selection is made at deployment time.

The figure below shows the `MHD DocumentReference`s including the most relevant restrictions and its relationship with the manifests and each other.

{% include img.html img="manifest-envelope.drawio.svg" caption="Figure: IHE-MHD envelope" %}

The main choices illustrated in the figure are:

* There are two different `DocumentReferences`, one for the FHIR ImagingStudy and one for the DICOM KOS representation. When both are present, the relatesTo field points to the other representation.
* FHIR Imaging Study manifest:
  * A FHIR manifest is represented as a FHIR json encoded FHIR {{Bundle}} following the profile {{MadoFhirBundle}}. This Bundle contains the {{ImagingStudy}} resource as well other resources such as the {{Patient}} and various {{Endpoint}}s.
  * The FHIR DocumentReference SHALL include the identifier of the {{MadoFhirBundle}} as `masterIdentifier`.
* DICOM KOS manifest:
  * A KOS manifest is represented as a `application/dicom` encoded DICOM instance (see [8.7.3.1 Instance Media Types](https://dicom.nema.org/medical/dicom/current/output/html/part18.html#table_8.7.3-2)) following the MADO KOS profile.
  * The DICOM KOS manifest DocumentReference SHALL include the `SOPInstanceUid` of the KOS instance as `masterIdentifier`.
* The `masterIdentifier` SHALL be part of the `identifier` list as well.

The FHIR-manifest can be translated into the KOS-manifest and vice-versa, allowing applications to provide alternate representations when needed (see [Mapping](mapping.html)).

### Related FHIR profiles

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND ( Name LIKE '%DocumentReference' )",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"       , "type" : "link" , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Capability Statements for MADO MHD Actors

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='CapabilityStatement'",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"       , "type" : "link" , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}


#### Imaging specific search parameters

Imaging specific search parameters include:

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='SearchParameter'",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

The expression below uses these search parameters to search for a FHIR manifest with StudyInstanceUid=324.232.5.5.324.2.

```
DocumentReference/?study-instance-uid=urn:oid:324.232.5.5.324.2&format=urn:ihe:rad:MADO:fhir-manifest:2026
```

This uses the optional study-instance-uid search parameter. An alternative with standard search params would be. As the study instance uid is an OID, in the identifier it is prefixed with `urn:oid:`.

```
DocumentReference/?related:identifier=urn:oid:324.232.5.5.324.2&format=urn:ihe:rad:MADO:fhir-manifest:2026
```

A similar query searching for DICOM KOS Manifests with accession number `12345` would look like:

```
DocumentReference/?related:identifier="12345"&format=1.2.840.10008.5.1.4.1.1.88.59
```

an alternative using the `accession-number` query is:

```
DocumentReference/?accession-number="12345"&format=1.2.840.10008.5.1.4.1.1.88.59
```

### DocumentReference examples

The list below presents various examples of MADO DocumentReferences.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='DocumentReference'",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

The [DocumentReference Example for FHIR manifests with transform](DocumentReference-DocumentReferenceFHIRwithTransform.html) example contains a FHIR MADO DocumentReference. The content section does not point to a FHIR file but to a transform service. The `content.attachment` section is presented below

{% fragment DocumentReference/DocumentReferenceFHIRwithTransform JSON BASE:content.attachment %}

The url points to a transform service and passes the link to the KOS manifest. This is just one example of such service. This specification does not specify the interface. Alternative implementations could could pass the StudyInstanceUID and wado URL parameters, or some other set of data.
