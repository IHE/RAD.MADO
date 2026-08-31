Instance: MadoRequestedProcedureExample
InstanceOf: MadoRequestedProcedure
Title: "Requested Procedure Example with Placer and Filler"
Description: "Example of a MADO Requested Procedure (ServiceRequest) carrying the Accession Number, Placer Order Number, and Filler Order Number identifiers."
Usage: #example
* status = #completed
* intent = #order
* subject = Reference(ExamplePatient)
* identifier[accession-number].type.coding[v2-0203-coding] = $v2-0203#ACSN "Accession Id"
* identifier[accession-number].type.coding[dcm] = $dicomOntology#121022 "Accession Number"
* identifier[accession-number].system = "http://example.org/fhir/ris-ids"
* identifier[accession-number].value = "1731954284869428"
* identifier[placer].type = $v2-0203#PLAC "Placer Identifier"
* identifier[placer].system = "http://example.org/fhir/placer-ids"
* identifier[placer].value = "PLAC-2024-0098"
* identifier[filler].type = $v2-0203#FILL "Filler Identifier"
* identifier[filler].system = "http://example.org/fhir/filler-ids"
* identifier[filler].value = "FILL-2024-0442"
* code = $sct#77477000 "Computed tomography"
