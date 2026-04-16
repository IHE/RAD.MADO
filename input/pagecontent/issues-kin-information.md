This file discusses different ways to represent KIN information.

KIN information, or key image information, consists of two datafields (see Table 6.X.2.9-4):  

1. Document Title (code sequence)
2. Key Object Description (string)

In the study this information is stored in KIN SR documents (Key Image Note). This information needs to be parsed, the  relevant key images are extracted and they are marked explicitly in the MADO manifest. A study can have multiple KIN SR documents. The Document Title explains why it is a key image as a coded value, the description provides a human readable description.

In the KOS manifest, they are added at the TID 1602 instance description as two separate DICOM nodes.

What is the best way to represent these in FHIR? 

There are different options:

1. In FHIR R5 and R6, each key image could be represented as a `ImagingSelection` instance. In R4, one could use a `Basic` resource with a cross-version imaging selection extension. This is also the approach taken in the HL7eu imaging report ballot.
2. Add an extension on the `ImagingStudy.series.instance` that is represented in KIN to reflect the document title and key object description fields. It has to be a complex extension as there might be more than one DocumentTitle/KeyObjectDescription pair.
3. Include a representation of the KIN document in the Bundle (e.g. a `Composition` or `List`) holding the information encoded in the KIN document.
4. On the `ImagingStudy.series.instance` representing the KIN, include the information in the KIN.

From an _easy to access_ perspective, the extension approach is the more intuitive. The `Composition`/`List` approach is the more flexible and closer to the DICOM encoding. But MADO does not require full representation of the KO/KIN information. It only requires indicating the two attributes on KO instances with the study. The most straightforward way
of representing this information is option 4, adding extensions on the instance level.

