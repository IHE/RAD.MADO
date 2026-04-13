Instance: EndpointWadoExampleNoAddress
InstanceOf: MadoWadoEndpoint
Title: "Endpoint: MADO WADO Endpoint example with no URL"
Description: "Example implementation of an WADO endpoint holding a RetrieveLocationUID and no address."
Usage: #example
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
* status = #active
* payloadType.text = "DICOM WADO-RS" // GET proper code for this
* payloadMimeType[dicom]           = #application/dicom
* payloadMimeType[dicom-octet]     = #application/octet-stream
* payloadMimeType[dicom-xml]       = #application/dicom+xml
* payloadMimeType[dicom-json]      = #application/json
* extension[locationUid].valueString = "oid:213.323245.462.63.56"
* address = "http://doesnotexist"
* address.extension.url = "http://hl7.org/fhir/StructureDefinition/data-absent-reason"
* address.extension.valueCode = #not-applicable