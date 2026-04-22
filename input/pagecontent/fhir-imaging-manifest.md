{% include aliases.md %}

The MADO FHIR imaging manifest represents a summary of the data stored in a DICOM imaging study. It contains the information stored in a PACS expressed in FHIR. This page defines the FHIR encoding of such manifest. It is the '*document*' that is searched for and provides the URL's that allow download of the imaging content.

This section specifies the structure and format of an Imaging Study Manifest for the MADO Profile using the DICOM standards. It is based on the DICOM Key Object Selection (KOS) Document Information Object Definition (IOD) as specified in DICOM PS3.3 Section A.35.4 
Key Object Selection Document IOD.

### FHIR Manifest overview

The figure below presents an overview of the data that is part of the imaging-manifest. In order to keep the diagram readable, not all references are included.

{% include img.html img="fhir-manifest-overview.drawio.svg" caption="Figure: FHIR Manifest Overview" %}

The manifest is a FHIR bundle that SHALL conform to the {{MadoFhirBundle}} profile. This {{Bundle}} includes the {{MadoImagingStudy}} resource, the {{MadoPatient}}, {{MadoCreator}} and {{MadoCreatorOrganization}}, the {{MadoRequestedProcedure}}, and the {{MadoWadoEndpoint}} and {{MadoWebViewerEndpoint}}s.

The profiles for the {{MadoFhirBundle}} and the resources it contains have fields marked as `Must Support` (`MS`) (marked with an S in the _Flags_ column), which SHALL be populated if the value is known.

The {{MadoPatient}} resource holds the patient information.

The {{MadoCreator}} and {{MadoCreatorOrganization}} resources provide information on the device and organization that created the manifest.

The {{MadoRequestedProcedure}} provides information on the order for the imaging study, including the order specific identifiers: Accession Number, Placer Number and Filler number.

{{Endpoint}} resources contain the information that allows the client to access the DICOM data. The current model identifies different {{Endpoint}}s:

* On study level, the manifest MAY contain:
  * The {{MadoWebViewerEndpoint}} which provides a web based endpoint. The `address` defined in the endpoint, opens a webviewer on the study.
* For each series, the manifest SHALL contain:
  * The {{MadoWadoEndpoint}} which `address` field holds the WADO base url that allows access to the series information (see [IHE RAD TF-2](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2.pdf): 4.107 WADO-RS Retrieve [RAD-107]).

### Related FHIR profiles

The following links are provided for convenience.

{% sql {
  "query" : "SELECT name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE Type='StructureDefinition' AND ( Name NOT LIKE '%DocumentReference' ) ORDER BY name ASC",
  "class" : "lines",
  "columns" : [
    { "name" : "Title"      , "type" : "link"     , "source" : "Title", "target" : "Web"},
    { "name" : "Description", "type" : "markdown" , "source" : "Description"}
  ]
} %}

### Examples

The sections below show the various MADO data elements that are generated based based on a DICOM study.

The `Binary` resource contains the DICOM KOS Manifest for the study. The `Bundle` resource the FHIR Imaging Study Manifest. The `DocumentReference` instances provide MHD DocumentReference instances that point to these manifests.

#### Study A

Based on the DICOM study A, ([Study_A.zip](Study_A.zip)), the following resources are created:

{% sql {
  "query" : "SELECT type AS Type, id AS Id, name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE ( Id LIKE '%65' ) ORDER BY id ASC",
  "class" : "lines",
  "columns" : [
    { "name" : "Resource Type" , "type" : "markdown" , "source" : "Type"},
    { "name" : "Id"            , "type" : "link"     , "source" : "Id", "target" : "Web"}
  ]
} %}

#### Study B

Based on the DICOM study A, ([Study_B.zip](Study_B.zip)), the following resources are created:

{% sql {
  "query" : "SELECT type AS Type, id AS Id, name AS Name, title AS Title, Type, Description, Web FROM Resources WHERE ( Id LIKE '%66' ) ORDER BY id ASC",
  "class" : "lines",
  "columns" : [
    { "name" : "Resource Type" , "type" : "markdown" , "source" : "Type"},
    { "name" : "Id"            , "type" : "link"     , "source" : "Id", "target" : "Web"}
  ]
} %}

