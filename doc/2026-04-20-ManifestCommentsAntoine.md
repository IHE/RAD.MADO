# Comments Antoine.

## StudyInstanceUID

Regarding the StudyInstanceUID concept : I believe there is a missing reference within the “KOS” column. Indeed, according to the IHE MADO profile, the StudyInstanceUID identifier is also present within the “CurrentRequestedProcedureEvidenceSequence”, in addition to the two other fields already mentioned. I’m not sure if we want to be exhaustive in this KOS column, but if so, it seems necessary to add this reference. 

### Conclusion

Add it to “CurrentRequestedProcedureEvidenceSequence” 

## Anatomical Region

Regarding the Study anatomicalRegion concept : In the DICOM KOS version of the manifest object, as specified in the IHE MADO profile, the “Target Region” field may be associated with either a coded value or a text value. In this implementation guide, we restrict the anatomical region to be specified as a coded value within the FHIR manifest. Is it problematic not to allow the use of a text value?

### Resolution options

1. require a code in DICOM KOS as well
2. add a constraint to extension, when coding is there, there has to be at least one from AnatomicalRegion ValueSet
3. add an extensible binding to the extension - it means that a anatomical region code has to be provided and additional are allowed when they extend the anatomical region value. It also makes it impossible to validate as it also allows the situation of inclusion of a code not in the valueset.
   
recommendation - add constraint.

## Endpoint

Regarding the endpoint concepts : In the current version of the mapping, we can see several endpoint concepts based on different levels: study or series. At the study level for the FHIR manifest, we mentioned the RetrieveURL and RetrieveLocationUID by referencing the same fields within the DICOM KOS object. For the series level, no such separation or mapping is specified. I believe this needs to be clarified. Indeed, if we refer to the description of the ImagingStudy resource in the implementation guide, the series-level endpoint corresponds to the RetrieveURL/RetrieveLocationUID in the KOS. On the other hand, the study-level endpoint corresponds to the DisplayURI in the KOS and enables the implementation of an Invoke Image Display transaction. 

### Evaluation

Not sure that I understand the point. We still have an open issue on whether we allow WADO at study level.


## series.instance.tile

Regarding the Study series.instancesInTheSeries.instanceTitle concept : This concept is linked to the MadoImagingStudy.series.instance.title field. However, according to the ImagingStudy resource specification, this field does not appear to be defined. 

### Resolution

See https://build.fhir.org/ig/IHE/RAD.MADO/branches/kin-representation/StructureDefinition-MadoImagingStudy.html and https://github.com/IHE/RAD.MADO/compare/master...kin-representation.

Add extension for instance-title and allow it on series.instance

## Mapping series - instanceUID

Regarding the Study series.instancesInTheSeries.instanceUid concept : For this concept, the reference listed in the “KOS” column appears to be incorrect. In fact, it would be more appropriate to mention the DICOM ReferencedSOPInstanceUID field here. 

## RequestedProcedure OrderID

Regarding the RequestedProcedure OrderId concept : The “FHIR” column associated with this concept refers to the “ServiceRequest.identifier” value. However, according to the implementation guide, multiple “identifiers” may be listed within the “ServiceRequest” resource. It may be necessary to specify which one is intended here. For this same concept, the “KOS” column indicates “GeneralStudy PlacerId”. It might be more appropriate to use the terms from the IHE MADO profile, which are: “Placer Order Number / Imaging Service Request”.

## Mapping - number of series

The DICOM KOS field “Number of Study-related Series,” which is mandatory according to IHE MADO, does not appear in the mapping table. This is probably because the FHIR equivalent of this field is not specified within the ImagingStudy resource. Is it necessary to add it?
