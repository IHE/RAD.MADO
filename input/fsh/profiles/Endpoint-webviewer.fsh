Profile:  MadoWebViewerEndpoint
Parent: Endpoint
Title: "Endpoint: MADO profile for Web Viewer endpoints"
Description: """
This profile defines the Web Viewer endpoint for accessing imaging study content. The URL in the Endpoint
SHALL contain all the information required to the launch the viewer to this study.
"""
* insert SetFmmAndStatusRule( 1, "draft" )
* payloadType =  http://terminology.hl7.org/CodeSystem/endpoint-payload-type#none "NONE"
* payloadMimeType = #text/html

// Profile: MadoIidEndpoint
// Parent: Endpoint
// Title: "Endpoint: MADO profile for IHE IID endpoints"
// Description: """
// This profile defines the IHE IID endpoint for accessing imaging study content.
// """
// * insert SetFmmAndStatusRule( 1, "draft" ) 
// * connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-iid "IHE IID"
// * payloadType =  http://terminology.hl7.org/CodeSystem/endpoint-payload-type#none "NONE"
// * payloadMimeType = #text/html