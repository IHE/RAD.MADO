
# Encoding of the procedureCode

ImagingStudy -> Procedure needed
ImagingStudy.procedureCode is where we code the procedureCode 
We can choose to follow R5 and Encode this in procedure and additional in ImagingStudy.

In TID1600 - ProcedureCode -> scheduled or performed
    at study level --> maps to ImagingStudy.procedureCode (or PerformedProcedure.code)

The need from the MADO perspective is to be able to indicate the procedure that was performed and potentially search/filter on it.

**The code always represents the performed procedure.**

The advantage of using the Procedure resource direction would be to pre-adopt the future pattern. Making future changes easier.

--> Topic for discussion/homework


# WADO endpoint at the study level

If all the series point to the same WADO base url, it should be allowed at the study level as well.

## options

1. duplicate DICOM KOS -> keep them aligned 
2. remove unnecessary references by including it once.

Keep to option one. 


# Bundle type of FHIR manifests

## Comments from Antoine
Overall, I believe that specifying a Document-type bundle to represent the manifest object seems more appropriate. 

Indeed, if we refer to the FHIR standard and the description of the Document and Collection bundle types (https://build.fhir.org/bundle.html), it appears that there is no particular advantage to using a Collection type compared to a Document type. Indeed, FHIR states the following regarding the Collection type: 
“No particular use with respect to the FHIR specification is associated with this Bundle.” 

On the other hand, the Document type seems more suitable for our context. It consists of a fixed version of a set of data intended to be used in combination. The Document type therefore represents an “indivisible” entity as it symbolizes a set of resources intended to be used within the same context. The only inconvenience to note regarding the use of a document-type bundle is the need to specify a composition resource to be associated with it. This is a requirement imposed by the standard, and the composition resource associated with the manifest object will probably need to be profiled to best fit our context. 

In addition, the transactions defined by the MHD profile for publishing data to a FHIR server seem to be more adapted to managing a Document-type bundle. Indeed, whether it is the ITI-65 or ITI-105 transaction, the specifications for these APIs are designed for publishing Document-type bundles. If we maintain the manifest object as a Collection-type bundle, this implies that it cannot be submitted to a FHIR server via an MHD transaction. This leaves us with two options: either say nothing about how to submit the Collection bundle to the FHIR server, or specify a transaction dedicated to this process. The latter option seems to require a considerable amount of specification effort for a minor benefit, if we consider that the Collection-type bundle offers no additional value compared to the Document-type bundle for a manifest object. 

## Summary

Does is it matter what the Bundle.type is? The type is indicated by the DocumentReference and it will not be evaluated on its own.
What are the related use cases to consider
If Composition is included - what will be in there? In what way do we encode the corresponding information in DICOM? Or is this the DICOM-SR content?

## Conclusion

transaction/batch/searchset/history are not applicable.
This leaves collection and document.

Labeling it as document - requires inclusion of a Composition and the definition of the contents. E.g. using the module structure.

In MHD contexts, document bundles have the advantage that there are only document bundles making it easier for the client.

The Composition would duplicate the info also included in the ImagingStudy narrative.

Options for the Composition:
* leave it open  - specify that it has to contain the content labeled as MS
* use the module approach as basis
* seams overkill

# Mapping - requirement or not

Making the mapping part of the requirement makes sense.

# slicing 

draft or trial-use