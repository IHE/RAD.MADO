
Instance: MadoWadoEndpointExample
InstanceOf: MadoWadoEndpoint
Title: "Endpoint: WADO"
Description: "Example of a DICOM web endpoint supporting WADO."
Usage: #inline
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
* payloadType[text-wado].coding[0] = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#none
* payloadType[text-wado].text = "DICOM WADO-RS" // GET proper code for this
* name = "WADO endpoint"
* extension[retrieve-location-uid].valueString = "oid:213.323245.462.63.56"
* payloadType.text = "DICOM WADO-RS"
// * payloadMimeType[dicom]           = #application/dicom
* address = "http://example.org:8041/dcm4chee-arc/aets/DCM4CHEE/rs"
