
## Significant Changes

### Significant Changes from Revision x.x

- change 1
- change 2
- etc.

## Issues

### Submit an Issue

### Open Issues

#### Need for a Accession Number Identifier profile

The spec introduces a Data Type Profile: MADO Accession Number Identifier.  Why is this needed when it as not needed for the imaging report ?

**Resolution:** This profile (and the study-instance-uid profile) are added to clearly define the type field requirements when providing identifiers that represent these concepts. We will maintain the definition and require the dcm field.

**OPEN ISSUE:** Discuss during the face-2-face whether and how to include urn:ihe:iti:xds:2013 as a third option.

#### Need for representing the performed procedure

The imaging Manifest includes both:
26. Bundle.entry:requested-procedure
30. Bundle.entry:performed-procedure
which is not consistent, as this distinction does not appear explicitly in the DICOM Manifest? Nor in the mapping table with: “Procedure (scheduled or performed) procedureCode” which is correct at the study level, with a zero or more “Procedure” at the Study level.

**Resolution:** Remove the reference to performed procedure from the Bundle (we just need a procedure code)

#### MadoRepresentativeInstanceExtension

Not sure what this extension is about ?

MadoRepresentativeInstanceExtension

```
Extension: Representative Instance
An extension to indicate that a referenced instance on and ImagingStudy series is a representative instance for that series. This extension is used in the MADO context to indicate that a referenced instance on an ImagingStudy series is a representative instance for that series, which can be used for display purposes in the MADO context.
In the Manifest Envelope, the descriptive text (first five sentences and the text below the figure) for MHD needs a structure that sets a context about the MHD profile to better understand these technical statements (e.g. using the MHD actor profile names and associated MHD transactions).
```

**Resolution:** In (an earlier?) version of the MADO spec, in the the KOS list of images, there was a remark that this should contain the representative images to be shown first. This extension was added to support those. I cannot find that text the current spec anymore. I these are indeed no longer in the spec, we will remove this extension.

Additional issue: KIN - key object information
TBD: BvdH will provide a proposal for this based on the text in line 1195 and lower. KIN Document Title Code and description (at instance level).
Option 1 = description--> series.instance.title / extension for title-code
Option 2 = Basic+cross version imaging selection with this info.
==> Bas will proposal - topic for face-2-face

#### Base resource for MHD DocumentReference

In the Manifest Envelope, section related FHIR Profile, it speaks about the related “MHD Minimal Document Reference”.  However, in the use of MHD for imaging studies sharing, the “comprehensive MHD metadata” is used.  That is clear in the “MADO MHD DocumentReference Profile for FHIR Imaging Manifests”. The rest of the section, that only list the imaging specific.
 
**Answer:** Minimal Document Reference has been chosen as this is the minimal MHD requirement and the one used in the EU Health Access API specification. I do not see a reason to add the restrictions in this profile to all deployments of MADO.

The comprehensive includes relevant fields that are needed in this context such as time, ...
**Proposed Resolution:** Take over the fields from comprehensive except `securityLabel`.
Add period

#### What examples to include

The Examples should be “complete examples” not piece-wise resources as listed in: https://build.fhir.org/ig/IHE/RAD.ADO/branches/call20260402/artifacts.html#example-example-instances
 
**Resolution:** These were included to show examples of the individual artifacts. We can remove them and only support the Bundles.

#### Query parameter optionality

The use of the term “optional” in relationship with the query parameters, need to be made clearer when MHD is grouped with MADO.  In the context of MADO, the support by MHD Doc Responder and MHD Doc Source has to be required, but optional for the MHD Document consumer.


AP BvdH: make the relation with MHD more apparent in the the spec.

#### Try-out example 

Does the document remain a collection bundle or move to a document bundle.

### Closed Issues

#### XC WADO endpoint

XC-WADO end-point is not part of the MADO Profile.  Remove XC-WADO Endpoint box from the Figure: FHIR Manifest Overview.  Below remove the text about two endpoint formats, including: “The MADO FHIR XC-WADO Endpoint endpoint which provides an IHE-RAD-XC-WADO endpoint corresponding the IHE-RAD-XC-WADO specification.

**Resolution:** We will better explain that this is a profile that defines how to encode XC-WADO information in the MADO FHIR manifest.

#### Improve overview picture

The Figure: FHIR Manifest Overview should be refined because some Bundle resources are referenced by the Imaging Study Resource (study-level part) other at the Series instance level (such as WADO Endpoint).

**Resolution:** The arrows to the WADO endpoint will come from the Series boxes. We will add a new box representing a viewer with an arrow coming from the study. Add MADO WADO - with location uid in picture. Add <<resourceType>> where not clear from the name. Add LocationUID to WADO endpoint - remove XC-WADO endpoint definition - add example for WADO with no URL and mention it in the text.


#### Circular dependencies between mapping and definition

Below the figure, the following text is inappropriate: “The Bundle SHALL contain all available data elements in the FHIR column in Table 4.3-1 (see DICOM KOS <-> FHIR mappings).”  The mapping cannot be used to specific the Manifest Content.  This creates a circular specification.  Similar comment with the text: “What resources to include depends on the information to be included, see DICOM KOS <-> FHIR mappings for more information on when to include what resource.” which is also improper.  Need a full FHIR explicit structured definition in this section.

**Resolution**: Flag them using MustSupport - add definition to manifest definition page.

#### Where to define the anatomical regions

Anatomical Regions in section https://build.fhir.org/ig/IHE/RAD.MADO/branches/call20260402/ValueSet-im-anatomical-region-valueset.html#root duplicate the value set defined in the MADO Profile.  Should reference the MADO TI Table 6.X.6.4-1: CID IHE-MADO1 High-Level Anatomic Regions and Systems.  This would avoid different display strings that are aligned with SNOMED (but not identical) and DICOM.

**Resolution**: Make comment in the ValueSet that the definition in the pdf has prevelance and that we plan to move this to IHE terminology.
