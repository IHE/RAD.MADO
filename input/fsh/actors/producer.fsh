Instance: MadoImagingManifestResponder
InstanceOf: ActorDefinition
Title: "ActorDefinition: Imaging Manifest Responder"
Description: "The actor responsible for producing the Imaging Manifest resources."
Usage: #definition
* name = "EuImagingReportResponder"
* title = "Imaging Manifest Responder"
* status = #draft
* description = "Provides the Imaging Manifest."
* documentation = """
This actor typically represents a system that provides access to radiology reports. Typically this would be systems like a Electronic Health Record (EHR), Radiology Information System (RIS) or a Picture Archiving and Communication System (PACS) that manages and provides access to Imaging Manifests.
"""
* type = #system