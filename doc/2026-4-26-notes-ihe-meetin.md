# Intention of the IG - pdf and FHIR IG

FHIR IG is the agent of the main specification.
Whether the both need to be integrated is planned between TI and final text.

# Vol 3- manifest

```
The FHIR imaging manifest represents a summary of the data stored in a DICOM imaging study as is
stored in a PACS expressed in FHIR.
```
Split the first sentence for clarity

The FHIR imaging manifest represents a summary of the data stored in a DICOM imaging study as is
stored in a PACS expressed in FHIR. This page defines the FHIR encoding of such a manifest.

# Picture

ImagingStudy -> Procedure needed
ImagingStudy.procedureCode is where we code the procedureCode 
We can choose to follow R5 and Encode this in procedure and additional in ImagingStudy.

In TID1600 - ProcedureCode -> scheduled or performed
    at study level --> maps to ImagingStudy.procedureCode (or PerformedProcedure.code)

The need from the MADO perspective is to be able to indicate the procedure that was performed and potentially search/filter on it.

**The code always represents the performed procedure.**

The advantage of using the Procedure resource direction would be to pre-adopt the future pattern. Making future changes easier.

--> Topic for discussion/homework

# Endpoint definition is a bit vague.

Second MADO Creator sentence can be removed.

------
On study level, the manifest can contain:
The MADO FHIR WebViewer Endpoint endpoint which provides an web based endpoint.
For each series, the manifest can contain
The MADO FHIR WADO Endpoint endpoint which provides a IHE-RAD-XC-WADO endpoint corresponding the WADO profile defined in this specification.

Need to be clarified - launch viewer, access content.

-----

# Manifest ENvelopes for IHE-MHD

> An IHE-MHD infrastructure may choose or not a mapping service between the two manifest formats. In the case it supports a mapping service, the address field in the unsupported DocumentReference to the mapping service that will return the translated document.

Rephrase

------

> In the case the manifest is available in multiple formats, the Document Consumer SHOULD show to the user a single entry representing all possible formats.

The intent is that you can choose - the clinician does not to choese

> In the case the manifest is available in multiple formats, the Document Consumer SHOULD show to the user a single entry chosen by the implementation.

-----

A KOS manifest is represented as a DICOM encoded DICOM instance following the MADO KOS profile.

--> 

A KOS manifest is represented as a `application/dicom` encoded DICOM instance (8.7.3.1 Instance Media Types, https://dicom.nema.org/medical/dicom/current/output/html/part18.html#table_8.7.3-2 ).

-----
The KOS manifest DocumentReference SHALL have include the SOPInstanceUid of the KOS instance as as masterIdentifier.

Rephrase

The KOS manifest DocumentReference SHALL include the SOPInstanceUid of the KOS instance as as masterIdentifier.

-----

STU note

In this specification the choice for presenting the manifest in an IHE-MHD environment is representing them as two separate DocumentReference instances. Feedback is requested from the implementer community whether this is the approach is correct and adequate.

-->

In this specification the choice for presenting the manifest in an IHE-MHD environment is representing them as two separate DocumentReference instances. Feedback is requested from the implementer community whether this approach is correct and adequate.

---  Related FHIR profiles

Copy sentence in both.


-----

Search parameter
    add note why study and acc is not required.
    --> SHOULD in SHALL

----

# mapping

Study Study --> Study

>> remove the module and add attribute types 
and remove "SR-"

----

Modalities --> not on general study but on TID160X

Study endpoint --> webviewer  -> DisplayURI


Is it a list of where the concept reside or where the main field location is.

