Profile: MadoWadoEndpoint
Parent: Endpoint
Title: "Endpoint: MADO WADO endpoint"
Description: """
This profile defines the definition of a WADO endpoint for accessing imaging study content. Note that in
the case the endpoint supports XC-WADO, the derived MADO profile for XC-WADO endpoints should be used instead 
of this profile.
"""
* insert SetFmmAndStatusRule( 1, "draft" )

* connectionType = http://terminology.hl7.org/CodeSystem/endpoint-connection-type#dicom-wado-rs "DICOM WADO-RS"

* payloadType.text = "DICOM WADO-RS" // GET proper code for this

* payloadMimeType
  * insert SliceElement( #value, $this )
* payloadMimeType contains 
      // source dicom
      dicom 1..1 and 
      dicom-octet 1..1 and
      dicom-xml 1..1 and 
      dicom-json 1..1 and 
      // image
      image-jpg 0..1 and
      image-gif 0..1 and
      image-jp2 0..1 and
      image-jph 0..1 and
      image-jxl 0..1 and
      // multiframe
      // image-gif 0..1 and
      // image-jxl 0..1 and
      // video
      video-mpeg 0..1 and
      video-mp4 0..1 and
      video-H265 0..1 and
      // text
      text-html 0..1 and
      text-plain 0..1 and
      text-xml 0..1 and  
      text-rtf 0..1 and
      application-pdf 0..1
* payloadMimeType[dicom]           = #application/dicom
* payloadMimeType[dicom-octet]     = #application/octet-stream
* payloadMimeType[dicom-xml]       = #application/dicom+xml
* payloadMimeType[dicom-json]      = #application/json
* payloadMimeType[image-jpg]       = #image/jpg
* payloadMimeType[image-gif]       = #image/gif
* payloadMimeType[image-jp2]       = #image/jp2
* payloadMimeType[image-jph]       = #image/jph
* payloadMimeType[image-jxl]       = #image/jxl
* payloadMimeType[video-mpeg]      = #video/mpeg
* payloadMimeType[video-mp4]       = #video/mp4
* payloadMimeType[video-H265]      = #video/H265
* payloadMimeType[text-html]       = #text/html
* payloadMimeType[text-plain]      = #text/plain
* payloadMimeType[text-xml]        = #text/xml
* payloadMimeType[text-rtf]        = #text/rtf
* payloadMimeType[application-pdf] = #application/pdf

