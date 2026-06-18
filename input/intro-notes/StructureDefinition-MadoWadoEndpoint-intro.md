This profile supports two cases (see X.4.1.2 Intra-community Sharing Infrastructure):

1. The case where `address` is provided in addition to a `RetrieveLocationUID`.
2. The case when only the `RetrieveLocationUID` is known and the `address` is unknown (see example [EndpointWadoExampleNoAddress](Endpoint-EndpointWadoExampleNoAddress.html)). In this case:
   1. The `address` SHALL be set to \"http://notspecified\"
   2. A [`Data Absent Reason Exception`](http://hl7.org/fhir/StructureDefinition/data-absent-reason) with the value `unknown` SHALL be added to indicate that the address is missing.

Note that we do not require population of the `payloadMimeType` as this information is not present in the DICOM KOS. As is defined in section 6.X.6.6.2, in MADO, only the `dicom` mimetype is required.

Note that payloadType has been fixed to text only. We anticipate that a proper code will be required in future versions of this specification.
