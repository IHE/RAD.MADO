ValueSet: MadoNarrativeNotEmpty
Title: "ValueSet: Non-empty Narrative status codes"
Description: """
This value set includes all Narrative status codes that are not empty.
"""
* insert SetFmmAndStatusRule( 1, draft )
* ^experimental = false
* include codes from system http://hl7.org/fhir/narrative-status
* exclude http://hl7.org/fhir/narrative-status#empty