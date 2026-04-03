
Instance: wado-url-endpoint-84713519
InstanceOf: MadoWadoEndpoint
Title: "Endpoint: WADO"
Description: "Example of a DICOM web endpoint supporting WADO."
Usage: #example
* status = #active
* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"
* name = "WADO endpoint"
* payloadType.text = "DICOM WADO-RS"
* payloadMimeType[dicom]           = #application/dicom
* payloadMimeType[dicom-octet]     = #application/octet-stream
* payloadMimeType[dicom-xml]       = #application/dicom+xml
* payloadMimeType[dicom-json]      = #application/json
* address = "http://example.org:8041/dcm4chee-arc/aets/DCM4CHEE/rs"
