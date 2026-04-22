
Instance: wado-url-endpoint-84713519
InstanceOf: MadoWadoEndpoint
Title: "Endpoint: WADO"
Description: "Example of a DICOM web endpoint supporting WADO."
Usage: #inline
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
* name = "WADO endpoint"
* extension[MadoRetrieveLocationUIDExtension].valueString = "oid:213.323245.462.63.56"
* payloadType.text = "DICOM WADO-RS"
// * payloadMimeType[dicom]           = #application/dicom
* address = "http://example.org:8041/dcm4chee-arc/aets/DCM4CHEE/rs"
