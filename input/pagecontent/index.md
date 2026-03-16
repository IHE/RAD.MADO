{% include aliases.md %}

This profile addresses the access to DICOM Instances based on an imaging study manifest.
The need for this profile was identified as part of the sharing of imaging studies and related 
reports as required under the EHDS Regulation.

The access to DICOM Instances based on an imaging study manifest can be combined either 
with MHD (or MHDS) to deploy FHIR-based document sharing infrastructures or XDS.b, or 
some proprietary document sharing scheme. Such flexibility ensures a common and more 
effective way to access the DICOM Objects through a solid profiling of WADO-RS consistent 
with the XC-WADO Cross-Community profile and the IID (Invoke Image Display) profiles. The 
MADO Profile includes also a more robust imaging study manifest compared to the one 
introduced by XDS-I.b, supporting two complementary encodings based on the DICOM KOS 
IOD or FHIR Imaging Study resource, as well as profiling in a more precise way existing 
attributes and new attributes, such as those necessary to improve access to key images in a way 
compatible with the IHE KIN Profile.

{% include stunote.html text="Note that this website only represents the FHIR part of the MADO specification. Where possible, references/redirects are added that point to the PDF MADO specification that contains the Volume 1, Volume 2 and the DICOM part of Volume 3."%}