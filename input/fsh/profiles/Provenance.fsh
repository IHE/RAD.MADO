Profile: MadoProvenance
Parent: Provenance
Title: "MADO Provenance"
Description: """
The purpose of this resource is to indicate information about the system that created the manifest. Additionally, it can be used to sign the content of the Bundle.

In DICOM KOS this information (and the referred MadoCreator) corresponds to the Institution Name, Institution Id, Manufacturer Name in the General Equipment module.
"""
* insert SetFmmAndStatusRule( 1, draft )

* target MS
  * ^short = "SHALL contain a list with all resources in the Bundle."
* recorded
  * ^short = "When the bundle/provenance was created."
* agent
  * insert SliceElement( #value, type )
* agent contains mado-creator 1..1 MS 
* agent[mado-creator]
  * type = http://terminology.hl7.org/CodeSystem/provenance-participant-type#assembler
  * who only Reference( MadoCreator )
  * onBehalfOf 1..1 MS
  * onBehalfOf only Reference( MadoCreatorOrganization )
    * ^short = "The owner of the MadoCreator device."


