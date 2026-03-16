// CapabilityStatement for EEHRxF Document Consumer Actor
// Composite actor grouping MHD Document Consumer + PDQm Consumer + IUA Authorization Client

Instance: IHE.RAD.MADO.DocumentResponder
InstanceOf: CapabilityStatement
Title: "MADO Document Responder (server)"
Usage: #definition

* name = "IHE_RAD_MADO_DocumentResponder"
* title = "MADO Document Responder CapabilityStatement"
* description = "IHE RAD Manifest based Access to DICOM Objects(MADO) - Document Responder (server). It extends https://build.fhir.org/ig/IHE/ITI.MHD/branches/MHD5/CapabilityStatement-IHE.MHD.DocumentResponder.html"
* status = #active
* experimental = false
* date = "2026-02-27"
* publisher = "IHE international"
* kind = #requirements
* fhirVersion = #4.0.1
* format[+] = #json
* format[+] = #xml
* imports[+] = "https://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentResponder"

* rest[+]
  * mode = #server
  * resource[+]
    * type = #DocumentReference
    * searchParam[+]
      * name = "bodysite"
      * definition = Canonical( SearchParameterDocumentReferenceBodySite )
      * type = #token
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * documentation = "Anatomical region of the related imaging study"
    * searchParam[+]
      * name = "modality"
      * definition = Canonical( SearchParameterDocumentReferenceModality )
      * type = #token
      * extension[+]
        * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
        * valueCode = #SHALL
      * documentation = "Modality of the related imaging study" 