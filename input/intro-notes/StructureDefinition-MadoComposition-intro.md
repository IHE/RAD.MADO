The `Composition.text` field includes a description of the study level info which includes the following information:

* SHALL include subject (identifiers and name)
* SHALL include author (identifiers and name) of device as well as organization
* SHALL include `StudyInstanceUID`
* SHALL include manifest creation date
* SHALL include type and categories
* SHALL include study date and time
* SHALL include `StudyDescription` (if present)
* SHALL include modalities in the study
* SHALL include anatomical regions
* SHALL include accession number(s)
* SHALL include the number of series in the study
* SHOULD include a link to the webviewer endpoint for the study (if present and reachable)
  
Optionally, each section in the Composition may provide information on each series.

Besides the author information, all information in the `Composition` is a derivative of the information in the manifest and should not be used as the definitive source of information.
