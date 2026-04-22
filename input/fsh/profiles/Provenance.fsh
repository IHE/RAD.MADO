Profile: MadoProvenance
Parent: Provenance
Title: "MADO Provenance"
Description: """
The MADO imaging study Bundle will contain at least one Provenance resource. The purpose of this resource is to indicate the system that created the manifest. Additionally, it can be used to sign the content of the Bundle."""
* insert SetFmmAndStatusRule( 1, draft )

* target MS
  * ^short = "SHALL contain a list with all MADO resources in the Bundle."
// needed to include this slices or is the sentence above enough?
//   * insert SliceElement( #profile, [[resolve()]])
// * target contains 
//     imaging-study 1..1 MS and
//     patient 0..1 MS and
//     wado-endpoint 1..* MS and
//     web-endpoint 0..* MS and
//     creator 1..1 MS and
//     creator-organization 0..1 MS and
//     requested-procedure 0..* MS and
//     provenance 1..1 MS
// * target[imaging-study] only Reference( MadoImagingStudy )
// * target[patient] only Reference( MadoPatient )
// * target[creator] only Reference( MadoCreator )
// * target[creator-organization] only Reference( MadoCreatorOrganization )
// * target[wado-endpoint] only Reference( MadoWadoEndpoint )
// * target[web-endpoint] only Reference( MadoWebViewerEndpoint )
// * target[requested-procedure] only Reference( MadoRequestedProcedure )

* recorded
* agent
  * insert SliceElement( #value, type )
* agent contains mado-creator 1..1 MS
* agent[mado-creator]
  * type = #assembler
  * who only Reference( MadoCreator )

