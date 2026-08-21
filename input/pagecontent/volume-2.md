{% include aliases.md %}

<!-- Previous behavior: redirect to the PDF supplement.
{% include embed.html redirect="https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_Suppl_MADO_Rev1-2_TI_2026-08-20.pdf#page=33" %}
-->

Update Section 4.107 in Volume 2.

*Editor Note: 4.1xy of the Public Comment version was removed and replaced by reuse of 4.107 with profile specific requirement clarifications as shown below.*

[Current 4.107.4 Messages from IHE RAD TF-2: 4.107 WADO-RS Retrieve [RAD-107]:]

## Messages

{% include mado-wado-interaction.svg %}

*Figure 4.107.4-1: Interaction Diagram*

### Message Support Requirements

This transaction defines four request/response message pairs:

- Get Instances (Section 4.107.4.1 and 4.107.4.2)
- Get Metadata (Section 4.107.4.3 and 4.107.4.4)
- Get Bulkdata (Section 4.107.4.5 and 4.107.4.6)
- Get Rendered Instances (Section 4.107.4.7 and 4.107.4.8)

A Requester shall support at least one of these request/response pairs; a Responder shall support all four pairs, as defined in DICOM.

Add the following new subsections.

#### Cross-Enterprise Document Sharing for Imaging (XDS-I.b) Profile

A Responder in the XDS-I.b Profile shall support all four message pairs.

#### Web-based Image Access (WIA) Profile

A Responder in the WIA Profile shall support all four message pairs.

#### Integrated Multimedia Reporting (IMR) Profile

A Responder in the IMR Profile shall support all four message pairs.

#### Manifest-based Access to DICOM Objects (MADO) Profile

A Responder in the MADO Profile shall support the 'Get Instances' message pair for Study Instances, Series Instances and Instance Resources. The Responder may support the Frame Pixel Data Resource.

*Note: The Frame Pixel Data Resource is being introduced by a DICOM CP on DICOM PS3.18.*

##### Rendered Instances Option

A Requester in the MADO Profile that claims the Rendered Instances Option shall support the 'Get Rendered Instances' message pair for the Rendered Instance Resource. The Requester may support Rendered Series and Rendered Frame resources.

A Responder in the MADO Profile that claims the Rendered Instances Option shall support the 'Get Rendered Instances' message pair for the Rendered Instance Resource. The Responder may support Rendered Series and Rendered Frame resources.

#### Cross-Community Web-Based Access to DICOM Objects (XC-WADO) Profile

A Requester and a Responder in the XC-WADO Profile shall support the 'Get Instances' message pair as defined in DICOM PS3.18. They may optionally support the 'Get Rendered Instances' message pair as defined in DICOM PS3.18.

## Appendix XA – Managing the Addresses of the Sources of Images to Retrieve Beyond a Single Community

This appendix provides information about the way the addresses of image sources are handled both within a Community where the DICOM instances are accessed through the MADO Profile, as well as Cross-community where the MADO Profile is grouped with the XC-WADO Profile.

*Note: The term Community is used to consider a set of Imaging Document Sources, Content Creators and Imaging Document Consumers that are implemented by individual organizations or enterprises. The way the MADO actors are integrated within their respective individual organizations or enterprises is beyond the scope of the MADO Profile and may use IHE profiles such as IHE WIA, IHE SWF.b, ARI. Examples of such Communities are regional ehealth networks, and national ehealth infrastructures.*

*The term Cross-community is used to consider how one or more Communities, as defined above, may be integrated and allow actors such as Imaging Document Consumers to access Imaging Document Sources from other Communities to retrieve DICOM Instances across these Community boundaries.*

In particular, the way the WADO-RS Request conveys address information in such a mixed environment is handled.

The following four figures present an example of Cross-community handling of the retrieve URL used in the WADO-RS transactions. Figures XA-1 and XA-2 depict the case of a Community A that uses a Retrieve Location UID. Figures XA-3 and XA-4 depict the case of a Community A that uses a Retrieve URL in the imaging study manifest (See Section X.4.1.2 Intra-community sharing infrastructure).

In these examples, a Cross-community WADO-RS Retrieve transaction initiates from a Community B Imaging Document Consumer and progresses via Initiating and Responding Imaging Gateways to reach the Community A where the Imaging Document Source is located. The example focuses on the WADO-RS retrieve URL, and the value it contains, as it moves from B to A. These transformations are specified by the XC-WADO Profile using the MADO specified imaging study manifest (see Section 58.4.1.5 DICOMweb Study Service Retrieve transaction URI).

The elements manipulated during transactions used in Figures XA-1, XA-2, XA-3, XA-4 that provide examples of the URL transformation by the gateways where the responding community either includes or not the Retrieve URL (0008,1190) attribute into the published imaging study manifests:

- Initiating Imaging Gateway hostname: `initiating-gateway.example.com`
- Initiating Imaging Gateway endpoint_path: `wado`
- Responding Imaging Gateway hostname: `responding-gateway.example.org`
- Responding Imaging Gateway endpoint_path: `wado-rs`
- Initiating Community homeCommunityId: `urn:oid:1.2.3.4`
- Responding Community homeCommunityId: `urn:oid:5.6.7.8`
- RetrieveLocationUID: `1.2.840.9.10.11.12`
- Retrieve URL (base URI): `hostname/DICOMweb-RS/`
- Imaging Document Source hostname: `document-source.example.org`

{% include img.html img="mado-xa1-lookup-transactions.png" caption="Figure XA-1: Image retrieval by XC-WADO with Domain A using lookup of Retrieve Location UID - Transactions" %}

The following shows an example of the related URL values as the request moves from Community B to Community A.

```text
Given a manifest for the imaging study
1.2.840.113619.2.207.28521.42888.1640475282.450/ coming from
homeCommunityID/5.6.7.8 and containing a retrieveLocationUID 1.2.840.. and no retrieve URL
The Manifest is associated with homeCommunityID/5.6.7.8 which is not the Local Home CommunityID

[1] The B_IDC sees a different homeCommunityID than its own and can construct the appropriate URL.
https://initiating-gateway.example.com/wado/
homeCommunityId/5.6.7.8/RetrieveLocationUID/1.2.840.9.10.11.12/
studies/1.2.840.113619.2.207.28521.42888.1640475282.450/

[2] B_IIGW uses A_homeCommunityID to map (lookup) the hostname for A_RGW
according to local configuration in B_IGW and constructs the appropriate URL
https://responding-gateway.example.org/wado-rs/
homeCommunityId/5.6.7.8/RetrieveLocationUID/1.2.840.9.10.11.12/
studies/1.2.840.113619.2.207.28521.42888.1640475282.450/

[3] A_RIGW The initial string document-source.example.org/pacs/wado-rs needs to be
obtained from local lookup using the retrieve location UID (OID)
https://document-source.example.org/pacs/wado-rs/
studies/1.2.840.113619.2.207.28521.42888.1640475282.450

[4] Domain A document source responds with multi-part encoded DICOM objects (images) as payload
```

*Figure XA-2: WADO-RS Retrieve URL with Domain A using lookup of Retrieve Location UID – Example of related URL values*

{% include img.html img="mado-xa3-retrieveurl-transactions.png" caption="Figure XA-3: Image retrieval by XC-WADO with Domain A directly using the Retrieve URL – Transaction flows" %}

The following shows an example of the related URL values when Domain A directly uses the Retrieve URL.

```text
Given a manifest for imaging study 1.2.840.113619.2.207.28521.42888.1640475282.450/ coming
from homeCommunityID/5.6.7.8 and containing a retrieveLocationUID 1.2.840.. and with a retrieve
URL hostname/DICOMweb-RS

The Manifest is associated with a homeCommunityID/5.6.7.8 which is not the Local Home CommunityID

[1] The B_IDC sees a different homeCommunityID than its own and can construct the appropriate URL.
https://initiating-gateway.example.com/wado/
homeCommunityId/5.6.7.8/RetrieveLocationUID/1.2.840.9.10.11.12/
studies/1.2.840.113619.2.207.28521.42888.1640475282.450
?retrieveURL=hostname/DICOMweb-RS/

[2] B_IIGW uses A_homeCommunityID to map (lookup) the hostname for A_RGW according to
local configuration in B_IGW and constructs the appropriate URL
https://responding-gateway.example.org/wado-rs/
homeCommunityId/5.6.7.8/RetrieveLocationUID/1.2.840.9.10.11.12/
studies/1.2.840.113619.2.207.28521.42888.1640475282.450
?retrieveURL=hostname/DICOMweb-RS/

[3] A_RIGW uses the URL to obtain the imaging locally. The URL used is in this form:
https://hostname/DICOMweb-RS/ studies/1.2.840.113619.2.207.28521.42888.1640475282.450

[4] Domain A document source responds with multi-part encoded DICOM objects (images) as payload
```

*Figure XA-4: WADO-RS Retrieve URL with Domain A directly using the Retrieve URL – Example of related URL values*
