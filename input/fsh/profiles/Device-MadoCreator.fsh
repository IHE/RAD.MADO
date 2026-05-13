Profile: MadoCreator
Parent: Device
Title: "MADO Creator"
Description: """A profile for the Device resource that represents the creator of an imaging study manifest. The primary goal is to communicate the fields:

* type = MadoDeviceType#mado-creator "MADO Creator"
* manufacturer
* owner (Reference to MadoCreatorOrganization)

"""
* insert SetFmmAndStatusRule( 1, draft )
* type 1..1 MS
* type = MadoDeviceType#mado-creator "MADO Creator"
* type.coding 1..1
* manufacturer MS
* owner MS
* owner only Reference( MadoCreatorOrganization )

Profile:     MadoCreatorOrganization
Parent:      Organization
Title:       "MADO Creator Organization"
Description: "Profile on Organization that specifies the required elements for the organization that creates MADO manifests.
"
* name MS
* identifier MS
* type MS
