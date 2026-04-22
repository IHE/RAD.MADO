
Instance: provenance-example
InstanceOf: MadoProvenance
Title: "Example MADO Provenance"
Description: "Example MADO Provenance"
Usage: #inline
* target[+] = Reference(ExampleImagingStudy)
* target[+] = Reference(pat-mrn-1538098370)
* target[+] = Reference(wado-url-endpoint-84713519)
* target[+] = Reference(device-creator)
* recorded = "2026-02-24T11:48:21.136+01:00"
* agent[mado-creator][+]
  * type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
  * who = Reference(device-creator)      
  * onBehalfOf = Reference( device-organization )