
Instance: device-creator
InstanceOf: MadoCreator
Title: "Device: MADO creator"
Description: "Example of a Device that represents the system that creates the MADO content."
Usage: #inline
* type = MadoDeviceType#mado-creator "MADO Creator"
* manufacturer = "ACME Company"

Instance: device-organization
InstanceOf: MadoCreatorOrganization
Title: "Example of an orgnization that generated the manifest"
* identifier
  * system = "http:/asask/aa"
  * value = "32478378429"
* name = "ACME"
