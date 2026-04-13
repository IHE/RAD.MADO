// Profile:  MadoXcWadoEndpoint
// Parent: MadoWadoEndpoint
// Title: "Endpoint: MADO WADO endpoint holding Retrieve Location UID"
// Description: """
// This profile defines the XC-WADO endpoint for accessing imaging study content.
// It is a regular WADO endpoint with an additional extension that holds the `retrieveLocationUID` of the domain where the content can be accessed. See the IHE XC-WADO specification for more details.
// Note that in MADO the address is optional (see section X.4.1.2). When no address is known, a placeholder value is inserted and a data absent exception with the code `not-applicable`.
// """
// * insert SetFmmAndStatusRule( 1, "draft" )

// Extension: XcWadoRetrieveLocationUIDExtension
// Title: "Extension: Retrieve Location UID"
// Description: """
// The location UID of the source of the WADO URL. See XC-WADO and https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_A.35.4.3.html#table_A.35.4-1.
// """
// Context: Endpoint
// * insert SetFmmAndStatusRule( 1, draft )
// * value[x] only string
// // * address ^short = "Note that in XC-WADO the address is optional. When no address is known, that will be signaled using a data absent exception with the code not-applicable."
// // http://hl7.org/fhir/StructureDefinition/data-absent-reason
//  // not-applicable	Not Applicable	There is no proper value for this element (e.g. last menstrual period for a male).