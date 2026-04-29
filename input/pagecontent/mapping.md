{% include aliases.md %}

The mapping between the DICOM KOS and FHIR format is presented in the table below. In order to make it clear what concept is addressed, the first column contains a short
characterization of the concept. The other two columns show the corresponding FHIR and DICOM KOS fields. In the case that more than one field is presented, it is
expected that the concept will be present in each of them.

**Table 4.3-1: MADO DICOM KOS <-> FHIR mapping**

### old

{:.grid}
| Concept  | FHIR   | KOS      | Notes |
| ------------------------------------ | ------------------------------------ | ----------------------------------------------- | ------------------------------------ |
| Study Instance UID       | MadoImagingStudy.identifier[studyInstanceUid]    | Study Instance UID (0020,000D)                    |  |
|                          |                                                  | Referenced Request Macro (0040.A370) -> Study Instance UID (0020,000D) | |
| Study Modalities         | MadoImagingStudy.modality                        | SR: EV(EV(121139, DCM, "Modality")   |  |
| Study Started            | MadoImagingStudy.started                         | SR: EV(111028,DCM."Image Library") -> EV(111060,DCM,"Study Date") & EV (111060,DCM,"Study Time")  |  |
|                          |                                                  | StudyDate (0008,0020) & StudyTime (0008,0030)   | |
| Study anatomicalRegions  | MadoImagingStudy.extension[anatomicalRegion]     | SR: EV(111028,DCM."Image Library") -> EV(123014, DCM, "Target Region")   |  |
| Study procedureCodes     | MadoImagingStudy.procedureCodes                  | SR: EV(121023,DCM."ProcedureCode")    |  |
| Study Description        | MadoImagingStudy.description                     | StudyDescription (008,1030)                               | CHECK         |
| Study numberOfSeries     | MadoImagingStudy.numberOfSeries                  | SR: EV(111028,DCM."Image Library") -> EV (ddd009, DCM, “Number of Study Related Series” | |
| Study endpoint           | MadoImagingStudy.endpoint -> MadoWebViewerEndpoint          |      |  |
| Study endpoint.url       | MadoImagingStudy.endpoint -> MadoWebViewerEndpoint.address  | DisplayURI **(000D,xx01)**      | To be replaced |
| Study  series            | MadoImagingStudy.series                          | SR: EV(111028,DCM."Image Library") -> EV(126200,DCM."Image Library Group")    |  |
| Study  series.seriesUid  | MadoImagingStudy.series.uid                      | SR: EV(111028,DCM."Image Library") -> EV(126200,DCM."Image Library Group") -> EV (121139,DCM,"112002")   |  |
| Study  series.number     | MadoImagingStudy.series.number                   | SR: EV(111028,DCM."Image Library") -> EV(126200,DCM."Image Library Group") -> EV (113607,DCM,"Series Number")   |  |
| Study  series.seriesModality | MadoImagingStudy.series.modality             | SR: EV(111028,DCM."Image Library") -> EV(126200,DCM."Image Library Group") -> EV (121139,DCM,"Modality")   |  |
| Study  series.description | MadoImagingStudy.series.description  |  TID 1602:EV (MADOTEMP002, 99IHE, “Series Description”)     |  |
| Study  series.numberOfInstances | MadoImagingStudy.series.numberOfInstances  |  TID 1602:EV (MADOTEMP007, 99IHE, “Number of Series Related Instances”)      |  |
| Study  series.seriesEndpoint | MadoImagingStudy |       |  |
| Study  series.bodySite | MadoImagingStudy.series.bodySite  |  TID 1602:EV (123014, DCM, "Target Region")     |  |
| Study  series.specimen | MadoImagingStudy.series.specimen  | Specimen Module      |  |
| Study  series.started | MadoImagingStudy.series.started  |  TID 1602:EV (MADOTEMP003, 99IHE, "Series Date")  +  TID 1602:EV (MADOTEMP004, 99IHE, "Series Time")   |  |
| Study endpoint           | MadoImagingStudy.series.endpoint -> wadoEndpoint |     |  |
| Study endpoint.locationUid | MadoImagingStudy.endpoint -> XcWadoEndpoint.extension[locationUid]  | KeyObjectDocument-CurrentRequestedProcedureEvidenceSequence-Retrieve Location UID |  |
| Study endpoint.url | MadoImagingStudy.endpoint -> MadoWebViewerEndpoint.address  | KeyObjectDocument-DisplayURI      |  |
| Study  series.instancesInTheSeries | MadoImagingStudy.series.instance  |       |  |
| Study  series.instancesInTheSeries.instanceTitle | MadoImagingStudy.series.instance.title  |       |  |
| Study  series.instancesInTheSeries.instanceUid | MadoImagingStudy.series.instance.uid  |  TID 1601:EV (112002, DCM, “Instance Number”)     |  |
| Study  series.instancesInTheSeries.sopClass | MadoImagingStudy.series.instances.sopClass  |       |  |
| Study  series.instancesInTheSeries.instanceNumber | MadoImagingStudy.series.instance.number  |  TID 1601:EV (112002, DCM, “Instance Number”)     |  |
| Study  series.instancesInTheSeries.numberOfFrames | MadoImagingStudy.series.instance.extension[numberOfFrames]  |  TID 1601:EV (121140, DCM, “Number of Frames”)     |  |
| Study  series.instancesInTheSeries.koDocumentTitle | MadoImagingStudy.series.instance.extension[ko-document-title]  |  SR-TID1602:EV (121144, DCM, "Document Title")     |  |
| Study  series.instancesInTheSeries.koDescription | MadoImagingStudy.series.instance.description  |  SR-TID1602:EV (113012, DCM, "Key Object Description")     |  |
|   |    |       |  |
|   |    |       |  |
| Patient Name | MadoImagingStudy.subject->Patient.name  | PatientModule PatientName     |  |
| Patient ID | MadoImagingStudy.subject->Patient.identifier  | PatientModule PatientID  +  IssuerOfPatientID  +  OtherPatientIDsSequence |  |
| Patient Birthdate | MadoImagingStudy.subject->Patient.birthdate  | PatientModule PatientBirthDate     |  |
| Patient Sex | MadoImagingStudy.subject->Patient.gender  | PatientModule PatientSex     |  |
|   |    |       |  |
| RequestedProcedure Accession Number | MadoImagingStudy.basedOn[order].identifier  | GeneralStudy AccessionNumber  +  IssuerOfAccessionNumberSequence   |  |
| RequestedProcedure OrderId | MadoImagingStudy.basedOn[order] -> ServiceRequest. identifier  | GeneralStudy PlacerId     |  |
| RequestedProcedure requester | MadoImagingStudy.basedOn[order] -> ServiceRequest. requester  | GeneralStudy ReferringPhysiciansName     |  |
| RequestedProcedure reason | MadoImagingStudy.basedOn[order] -> ServiceRequest. reasonCode  | GeneralStudy ReasonForPerformedProcedureCodeSequence     |  |
| RequestedProcedure code | MadoImagingStudy.procedureCode | GeneralStudy ProcedureCodeSequence     |  |
|   |    |       |  |
| Procedure (scheduled or performed) procedureCode | MadoImagingStudy.procedureCode  |  TID 2010: EV (121023, DCM “Procedure Code”)     | Pending DICOM approval |
|   |    |       |  |
| MADO Author manufacturer | MadoAuthor.manufacturer  | GeneralEquipment Manufacturer     |  |
| MADO Author institution name | MadoAuthor.owner -> Organization. name  | GeneralEquipment InstitutionName     |  |
| MADO Author institution id | MadoAuthor.owner -> Organization. identifier  | GeneralEquipment InstitutionId     |  |
| MADO Author institution type | MadoAuthor.owner -> Organization. type  | GeneralEquipment InstitutionCodeSequence     |  |


### NEW

| Concept  | FHIR   | KOS      | Notes |
| ------------------------------------ | ------------------------------------ | ----------------------------------------------- | ------------------------------------ |
|	Study	Study Instance UID	|	MadoImagingStudy.	identifier[studyInstanceUid]		|		StudyInstanceUID (0020,000D)							|		|
|			|				|		Referenced Request Macro (0040.A370) -> Study Instance UID (0020,000D)							|		|
|	Study	Modalities	|	MadoImagingStudy.	modality		|	SR:	EV(121139, DCM, "Modality")							|		|
|	Study	Started	|	MadoImagingStudy.	started		|		StudyDate (008,0020) & StudyTime (008,0030)							|		|
|			|				|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")		 EV(111060,DCM,"Study Date") & EV (111060,DCM,"Study Time") 			|		|
|	Study	anatomicalRegion	|	MadoImagingStudy.	extension[anatomicalRegion]		|	SR:	EV(111028,DCM."Image Library")	->	EV(123014, DCM, "Target Region")					|		|
|	Study	procedureCodes	|	MadoImagingStudy.	procedureCode		|	SR:	EV(121023,DCM."ProcedureCode")							|		|
|	Study	description	|	MadoImagingStudy.	description		|		StudyDescription (008,1030)  							|		|
|	Study	numberOfSeries	|	MadoImagingStudy.	numberOfSeries		|	SR:	EV(111028,DCM."Image Library")	->	EV (ddd009, DCM, “Number of Study Related Series”)					|		|
|	Study	endpoint	|	MadoImagingStudy.	endpoint -> MadoWadoEndpoint.address		|		DisplayURI **(000D,xx01)**							|	Temp Code	|
|	Study	 series	|	MadoImagingStudy.	series		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")					|		|
|	Study	 series.seriesUid	|	MadoImagingStudy.	series.uid		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV(112002, DCM, “Series Instance UID”)			|		|
|	Study	 series.number	|	MadoImagingStudy.	series.number		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (113607, DCM, “Series Number”)			|		|
|	Study	 series.seriesModality	|	MadoImagingStudy.	series.modality		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (ddd002, DCM, "Modality")			|		|
|	Study	 series.description	|	MadoImagingStudy.	series.description		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (ddd002, DCM, “Series Description”)			|		|
|	Study	 series.started	|	MadoImagingStudy.	series.started		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (ddd003, DCM, “Series Date”) &  EV (ddd004, DCM, “Series Time”)			|		|
|	Study	 series.numberOfInstances	|	MadoImagingStudy.	series.numberOfInstances		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (ddd007, DCM, “Number of Series Related Instances”) 			|		|
|	Study	 series.bodySite	|	MadoImagingStudy.	series.bodySite		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (123014, DCM, "Target Region")			|		|
|	Study	 series.specimen	|	MadoImagingStudy.	series.specimen		|									|		|
|	Study	series.laterality	|	MadoImagingStudy.	series.laterality		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	EV (111027, DCM, "Image Laterality")			|		|
|	Study	 series.seriesEndpoint	|	MadoImagingStudy.			|			->		->				|		|
|	Study	 series.instancesInTheSeries	|	MadoImagingStudy.	series.instance		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE			|		|
|	Study	 series.instancesInTheSeries.instanceTitle	|	MadoImagingStudy.	series.instance.title		|			->		->				|		|
|	Study	 series.instancesInTheSeries.instanceUid	|	MadoImagingStudy.	series.instance.uid		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE	-	Referenced SOP Sequence (0008,1199) -> Referenced SOP Instance UID	|		|
|	Study	 series.instancesInTheSeries.sopClass	|	MadoImagingStudy.	series.instances.sopClass		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE	-	Referenced SOP Sequence (0008,1199) -> Referenced SOP Class UID	|		|
|	Study	 series.instancesInTheSeries.instanceNumber	|	MadoImagingStudy.	series.instance.number		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE	-	EV (113609, DCM, “Instance Number”)	|		|
|	Study	 series.instancesInTheSeries.numberOfFrames	|	MadoImagingStudy.	series.instance.extension[numberOfFrames]		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE	-	EV (121140, DCM, “Number of Frames”) 	|		|
|	Study	series.instancesInTheSeries.koDocumentTitle	|	MadoImagingStudy.	MadoImagingStudy.series.instance.extension[ko-document-title]		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE	-	EV (121144, DCM, "Document Title")	|		|
|	Study	series.instancesInTheSeries.koDescription	|	MadoImagingStudy.	MadoImagingStudy.series.instance.title		|	SR:	EV(111028,DCM."Image Library")	->	EV(126200,DCM."Image Library Group")	->	IMAGE	-	EV (113012, DCM, “ Key Object Description" )	|		|
|			|				|									|		|
|	Patient	Name	|	MadoImagingStudy.subject->Patient.	name		|		Patient Name (0010,0010)							|		|
|	Patient	ID	|	MadoImagingStudy.subject->Patient.	identifier		|		Patient ID (0010,0020) & Type of Patient ID  (0010,0022) & Issuer of Patietn ID Qualifiers Sequence (0010,0026)							|		|
|	Patient	Birthdate	|	MadoImagingStudy.subject->Patient.	birthdate		|		Patient Birth Date (0010,0030) 							|		|
|	Patient	Sex	|	MadoImagingStudy.subject->Patient.	gender		|		Patient Sex (0010,0040)							|		|
|			|				|									|		|
|	RequestedProcedure	Accession Number	|	MadoImagingStudy.	basedOn[order].identifier		|		AccessionNumber (0008,0050) & Issuer of Accession Number Sequence (0008,0051)							|		|
|			|	basedOn[order]->ServiceRequest.	identifier[accession][		|									|		|
|	RequestedProcedure	Placer Order Number	|	basedOn[order]->ServiceRequest.	identifier[placer]		|		Referenced Request Macro (0040.A370) -> Order Placer Identifier Sequence (0040,0026)							|		|
|	RequestedProcedure	Filler Order Number	|	basedOn[order]->ServiceRequest.	identifier[filler]		|									|		|
|			|				|									|		|
|	MADO Author	manufacturer	|	MadoCreator	manufacturer		|		Manufacturer (0008,0070)							|		|
|	MADO Author	manufacturer id	|	MadoCreator	identifer / udiCarrier		|		Device UID (0018,1002)							|		|
|	MADO Author	institution name	|	MadoCreatorOrganization	name		|		Institution Name (0008,0080)							|		|
|	MADO Author	instutution type	|	MadoCreatorOrganization	type		|									|	???InstitutionCodeSequence?? 	|
