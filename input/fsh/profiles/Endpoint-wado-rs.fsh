Profile: MadoWadoEndpoint
Parent: Endpoint
Title: "Endpoint: MADO WADO endpoint"
Description: """
This profile defines a WADO endpoint for accessing imaging study content. [MADO WADO Endpoint](Endpoint-wado-endpoint-with-url.html) holds an example of a endpoint with a 
`RetrieveLocationUid` and an address.
"""
* insert SetFmmAndStatusRule( 1, "draft" )

* extension contains MadoRetrieveLocationUIDExtension named retrieve-location-uid 1..1 MS
* status = #active
* address
  * ^short = "The base URL of the WADO service. When unknown it SHALL be set to \"http://notspecified\""
* address.extension contains http://hl7.org/fhir/StructureDefinition/data-absent-reason|5.3.0 named data-absent-reason 0..1
  * ^short = "This extension is present when the address value is a placeholder and should not be used (a RetrieveLocationUID lookup is needed)."
* address.extension[data-absent-reason].valueCode = #unknown

* connectionType.system
  * ^fixedUri = http://terminology.hl7.org/CodeSystem/endpoint-connection-type
* connectionType.code
  * ^fixedCode = #dicom-wado-rs


* payloadType
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.code"
  * ^slicing.discriminator[+].type = #value
  * ^slicing.discriminator[=].path = "coding.system"
  * ^slicing.ordered               = false
  * ^slicing.rules                 = #open
* payloadType contains text-wado 1..1
* payloadType[text-wado]
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
  * text = "DICOM WADO-RS" // GET proper code for this

// * payloadType.coding 0..0
// //  = http://terminology.hl7.org/CodeSystem/endpoint-payload-type#none
// * payloadType 1..1
// * payloadType.text = "DICOM WADO-RS" // GET proper code for this

// * payloadMimeType
//   * insert SliceElement( #value, $this )
// * payloadMimeType contains 
//       // source dicom
//       dicom       1..1 and 
//       // dicom-xml   0..1 and 
//       // dicom-json  0..1 and 
//       // dicom-octet 0..1 and
//       // image
//       image-jpg 0..1 and
//       image-gif 0..1 and
//       image-jp2 0..1 and
//       image-jph 0..1 and
//       image-jxl 0..1 and
//       // multiframe
//       // image-gif 0..1 and
//       // image-jxl 0..1 and
//       // video
//       video-mpeg 0..1 and
//       video-mp4  0..1 and
//       video-H265 0..1 and
//       // text
//       text-html       0..1 and
//       text-plain      0..1 and
//       text-xml        0..1 and  
//       text-rtf        0..1 and
//       application-pdf 0..1
// * payloadMimeType[dicom]           = #application/dicom
// // * payloadMimeType[dicom-octet]     = #application/octet-stream
// // * payloadMimeType[dicom-xml]       = #application/dicom+xml
// // * payloadMimeType[dicom-json]      = #application/json
// * payloadMimeType[image-jpg]       = #image/jpg
// * payloadMimeType[image-gif]       = #image/gif
// * payloadMimeType[image-jp2]       = #image/jp2
// * payloadMimeType[image-jph]       = #image/jph
// * payloadMimeType[image-jxl]       = #image/jxl
// * payloadMimeType[video-mpeg]      = #video/mpeg
// * payloadMimeType[video-mp4]       = #video/mp4
// * payloadMimeType[video-H265]      = #video/H265
// * payloadMimeType[text-html]       = #text/html
// * payloadMimeType[text-plain]      = #text/plain
// * payloadMimeType[text-xml]        = #text/xml
// * payloadMimeType[text-rtf]        = #text/rtf
// * payloadMimeType[application-pdf] = #application/pdf

* address MS