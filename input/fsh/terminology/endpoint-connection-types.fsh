CodeSystem: MadoEndpointConnectionTypes
Title: "MADO Endpoint Connection Types Code System"
Description: "Code system for the MADO-specific Endpoint connection types used in the MADO context."
* insert SetFmmAndStatusRule( 1, trial-use )
* ^caseSensitive = true
* ^experimental = false
* ^status = #active
* #web-viewer "DICOM web viewer for the study"

ValueSet: MadoWebViewerConnectionType
Title: "ValueSet: MADO Web Viewer Endpoint connection types"
Description: """
Connection types allowed for a MADO Web Viewer endpoint: the IHE Invoke Image Display code or the MADO web-viewer code.
"""
* insert SetFmmAndStatusRule( 1, trial-use )
* ^experimental = false
// ihe-iid is deprecated in endpoint-connection-type but is explicitly allowed here for backward compatibility
* http://terminology.hl7.org/CodeSystem/endpoint-connection-type#ihe-iid "IHE IID"
* https://profiles.ihe.net/RAD/MADO/CodeSystem/MadoEndpointConnectionTypes#web-viewer "DICOM web viewer for the study"
