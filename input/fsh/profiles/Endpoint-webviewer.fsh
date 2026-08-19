Profile:  MadoWebViewerEndpoint
Parent: Endpoint
Title: "Endpoint: MADO profile for Web Viewer endpoints"
Description: """
This profile defines the Web Viewer endpoint for accessing imaging study content. The URL in the Endpoint
SHALL be a fully populated URL that contains all the information required to the launch the viewer to this study.
"""
* insert SetFmmAndStatusRule( 1, trial-use )

* connectionType from MadoWebViewerConnectionType (required)

* payloadType
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.system"
  * ^slicing.ordered               = false
  * ^slicing.rules                 = #open
* payloadType contains type-none 1..1
* payloadType[type-none]
  * coding
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "code"
    * ^slicing.discriminator[+].type = #value
    * ^slicing.discriminator[=].path = "system"
    * ^slicing.ordered               = false
    * ^slicing.rules                 = #open
  * coding contains none 1..1
  * coding[none]
    * system
      * ^fixedUri = http://terminology.hl7.org/CodeSystem/endpoint-payload-type
    * code
      * ^fixedCode = #none

* payloadMimeType
  * insert SliceElement( #value, $this )
* payloadMimeType contains html 1..1
* payloadMimeType[html] = #text/html
* address MS
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