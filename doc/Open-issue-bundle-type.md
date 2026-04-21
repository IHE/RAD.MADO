# Bundle type of FHIR manifests

## Comments from Antoine
Overall, I believe that specifying a Document-type bundle to represent the manifest object seems more appropriate. 

Indeed, if we refer to the FHIR standard and the description of the Document and Collection bundle types (https://build.fhir.org/bundle.html), it appears that there is no particular advantage to using a Collection type compared to a Document type. Indeed, FHIR states the following regarding the Collection type: 
“No particular use with respect to the FHIR specification is associated with this Bundle.” 

On the other hand, the Document type seems more suitable for our context. It consists of a fixed version of a set of data intended to be used in combination. The Document type therefore represents an “indivisible” entity as it symbolizes a set of resources intended to be used within the same context. The only inconvenience to note regarding the use of a document-type bundle is the need to specify a composition resource to be associated with it. This is a requirement imposed by the standard, and the composition resource associated with the manifest object will probably need to be profiled to best fit our context. 

In addition, the transactions defined by the MHD profile for publishing data to a FHIR server seem to be more adapted to managing a Document-type bundle. Indeed, whether it is the ITI-65 or ITI-105 transaction, the specifications for these APIs are designed for publishing Document-type bundles. If we maintain the manifest object as a Collection-type bundle, this implies that it cannot be submitted to a FHIR server via an MHD transaction. This leaves us with two options: either say nothing about how to submit the Collection bundle to the FHIR server, or specify a transaction dedicated to this process. The latter option seems to require a considerable amount of specification effort for a minor benefit, if we consider that the Collection-type bundle offers no additional value compared to the Document-type bundle for a manifest object. 

## Topics

Does is it matter what the Bundle.type is? The type is indicated by the DocumentReference and it will not be evaluated on its own.
What are the related use cases to consider
If Composition is included - what will be in there? In what way do we encode the corresponding information in DICOM? Or is this the DICOM-SR content?




