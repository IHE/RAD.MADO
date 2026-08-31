
Instance: webviewer-endpoint-example
InstanceOf: MadoWebViewerEndpoint
Title: "Endpoint: MADO Web Viewer Endpoint"
Description: "Example of a web viewer endpoint whose address launches a viewer on the imaging study."
Usage: #example
* status = #active
* connectionType = MadoEndpointConnectionTypes#web-viewer "DICOM web viewer for the study"
* name = "Web Viewer endpoint"
* payloadType[type-none].coding[none] = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#none
* payloadMimeType[html] = #text/html
* address = "https://viewer.example.org/launch?studyUID=1.2.392.200140.2.1.1.1.2.799008771.2076.1519721309.448"
