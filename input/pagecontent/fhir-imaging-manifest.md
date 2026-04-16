{% include aliases.md %}

The FHIR imaging manifest represents a summary of the data stored in a DICOM imaging study as is stored in a PACS expressed in FHIR. It is the FHIR equivalent of the DICOM KOS manifest. It is the '*document*' that is searched for and provides the URL's that allow download of the imaging content. 

### FHIR Manifest 

The figure below presents an overview of the data that is part of the imaging-manifest. In order to keep the diagram readable, not all references are included.

{% include img.html img="fhir-manifest-overview.drawio.svg" caption="Figure: FHIR Manifest Overview" %}

The manifest is a FHIR bundle that SHALL conform to the {{MadoFhirBundle}} profile. This {{Bundle}} includes the {{MadoImagingStudy}} resource, the {{MadoCreator}} and {{MadoCreatorOrganization}}, the {{MadoRequestedProcedure}}, at least one {{Endpoint}} and additional resources.


The profiles for the {{MadoFhirBundle}} and the resources it contained have fields marked as `Must Support` (`MS`) (marked with an S in the _Flags_ column), which means that within this specification, fields marked as `MS` SHALL be populated if the value is known.

The {{MadoCreator}} and {{MadoCreatorOrganization}} resources provide information on the device and organization that created the manifest.

The {{MadoRequestedProcedure}} provides information on the order for the imaging study, including the order specific identifiers: Accession Number, Placer Number and Filler number.

{{Endpoint}} resources contain the information that allows the client to access the DICOM data. The current model identifies different {{Endpoint}}s:

* On study level, the manifest can contain:
  * The {{MadoWebViewerEndpoint}} endpoint which provides an web based endpoint.
* For each series, the manifest can contain
  * The {{MadoWadoEndpoint}} endpoint which provides a {{iheXcWado}} endpoint corresponding the WADO profile defined in this specification.

As the purpose of the manifest is to provide access to the imaging study content, inclusion of an endpoint at study level or at each series level is REQUIRED.

The {{MadoCreator}} profile provides information on the system that generated the manifest.

Besides the {{ImagingStudy}} and {{Endpoint}} resources, also additional resources are present that reflect information present in DICOM such as information on the patient, performer, procedure and imaging device. What resources to include depends on the information to be included, see [DICOM KOS <-> FHIR mappings](mapping.html) for more information on when to include what resource.

### Related FHIR profiles

The following links are provided for convenience.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND ( Name NOT LIKE '%DocumentReference' ) ORDER BY name ASC",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Name", "target" : "Web"},
    { "name" : "Name"       , "type" : "markdown" , "source" : "Title" },
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

