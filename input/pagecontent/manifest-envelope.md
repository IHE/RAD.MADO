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
* The FHIR DocumentReference SHALL have the identifier of the {{MadoFhirBundle}} as `masterIdentifier`.
* A KOS manifest is represented as a DICOM encoded DICOM instance following the MADO KOS profile.
* The KOS manifest DocumentReference SHALL have include the SOPInstanceUid of the KOS instance as as `masterIdentifier`.
* The `masterIdentifier` SHALL be part of the `identifier` list as well.


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

### Capability Statements

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='CapabilityStatement'",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
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

The url points to a transform service and passes the link to the KOS manifest. This is just one example of such service. This specification does not specify the interface. Alternative implementation could could pass the StudyInstanceUID and wado URL parameters, or some other set of data.
