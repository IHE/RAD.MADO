{% include aliases.md %}

<style>
table.madotable { border-collapse: collapse; margin-bottom: 1em; }
table.madotable caption { caption-side: top; text-align: center; font-weight: bold; padding: 4px 0; }
table.madotable th, table.madotable td { border: 1px solid #7f7f7f; padding: 4px 8px; vertical-align: top; text-align: left; }
table.madotable th { background-color: #d9d9d9; font-weight: bold; }
</style>

The Manifest-based Access to DICOM Objects (MADO) Integration Profile allows a clinician exploring a remote patient record to selectively retrieve series and images of interest, based on series level information shared in an extended imaging study manifest document. This avoids having to retrieve the entire study, particularly when it is large.

The MADO Profile also provides a consistent retrieve mechanism from multiple sources of medical image data that publish imaging studies for sharing within the community. This consistent retrieve mechanism is designed to be independent from the document sharing infrastructure chosen to publish, share and discover imaging study manifest objects, thus allowing the use of the MADO Profile across many national and regional eHealth infrastructures.

The MADO Profile utilizes the RESTful DICOMweb Studies Service Retrieve transaction (a.k.a., WADO-RS, DICOM PS3.18 Section 10.4).

This profile discusses but does not specify cross-community access to DICOM Objects; however, it has been designed to be grouped with the XC-WADO Profile to support cross-community access (see Section X.6 MADO Cross Profile Considerations).

This profile does not address specific means of publishing into some community-level document registry, searching and retrieving the imaging study manifests that reference DICOM Instances stored in the community. The XDS.b or MHD (or MHDS) Profiles may be used to support such document sharing and combined with the MADO Profile (see Section X.6 MADO Cross Profile Considerations).

The reader of MADO is expected to understand the use of imaging study manifests. The Manifest concept is described below in Section X.4.1.1 Role of an Imaging Study Manifest.

## MADO Actors, Transactions, and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. General definitions of actors are given in the Technical Frameworks General Introduction Appendix A. IHE Transactions can be found in the Technical Frameworks General Introduction Appendix B. Both appendices are located at <https://profiles.ihe.net/GeneralIntro/index.html>.

Figure X.1-1 shows the actors directly involved in the MADO Profile and the relevant transactions/content between them. If needed for context, other actors that may be indirectly involved due to their participation in other related profiles are shown in dotted lines. Actors which have a required grouping (if any), are shown as joined boxes (see Section X.3).

{% include img.html img="mado-actor-diagram.png" caption="Figure X.1-1: MADO Actor Diagram" %}

Table X.1-1 lists the transactions and Table X.1-2 lists the content for each actor directly involved in the Manifest-based Access to DICOM Objects (MADO) Profile. To claim compliance with this profile, an actor shall support all required transactions/content (labeled "R") and may support the optional transactions (labeled "O").

<table class="madotable">
  <caption>Table X.1-1: MADO Profile - Actors and Transactions</caption>
  <thead>
    <tr><th>Actors</th><th>Transactions</th><th>Requester or Responder</th><th>Optionality</th><th>Reference</th></tr>
  </thead>
  <tbody>
    <tr><td>Imaging Document Consumer</td><td>WADO-RS Retrieve [RAD-107]</td><td>Requester</td><td>R</td><td>RAD TF-2: 4.107</td></tr>
    <tr><td>Imaging Document Source</td><td>WADO-RS Retrieve [RAD-107]</td><td>Responder</td><td>R</td><td>RAD TF-2: 4.107</td></tr>
  </tbody>
</table>

<table class="madotable">
  <caption>Table X.1-2: MADO Profile - Actors and Content</caption>
  <thead>
    <tr><th>Actors</th><th>Content Modules</th><th>Requester or Responder</th><th>Optionality</th><th>Reference</th></tr>
  </thead>
  <tbody>
    <tr><td rowspan="2">Content Creator</td><td>DICOM KOS-Based Imaging Study Manifest</td><td>Creator</td><td>R (See Note 1)</td><td>RAD TF-3: 6.X.2</td></tr>
    <tr><td>FHIR-Based Imaging Study Manifest</td><td>Creator</td><td>R (See Note 1)</td><td>RAD TF-3: 6.X.3</td></tr>
    <tr><td rowspan="2">Imaging Document Consumer</td><td>DICOM KOS-Based Imaging Study Manifest</td><td>Consumer</td><td>O</td><td>RAD TF-3: 6.X.2</td></tr>
    <tr><td>FHIR-Based Imaging Study Manifest</td><td>Consumer</td><td>O</td><td>RAD TF-3: 6.X.3</td></tr>
  </tbody>
</table>

*Note 1: The imaging study manifest content is defined in two alternative formats – a DICOM KOS IOD based format and a FHIR-Based format. See Section X.1.1.1.*

### Actor Descriptions and Actor Profile Requirements

The transactions needed to query and retrieve imaging study manifest documents whose content is specified by this profile are beyond the scope of the MADO Profile. Such transactions when needed are addressed by grouping the MADO Profile with the desired document sharing profiles. See Section X.6.

Most requirements are documented in RAD TF-2 Transactions. This section documents any additional requirements on the profile's actors.

#### Content Creator

The Content Creator produces the imaging study manifests.

The Content Creator shall be capable of producing imaging study manifests in both a DICOM KOS Based Imaging Study Manifest format (See RAD TF-3: 6.X.2), to facilitate systems using primarily DICOM content, and a FHIR Based Imaging Study Manifest format (See RAD TF-3: 6.X.3), to facilitate systems using primarily FHIR content. The Content Creator shall be configurable to produce either format. The Content Creator is permitted but not required to publish both imaging study manifest formats at the same time.

The Content Creator guarantees that imaging study DICOM instances referenced are available at the time of imaging study manifest creation or update.

If the content of an imaging study, for which an imaging study manifest has been created and shared by a Content Creator, is updated to add or remove shared instances, the Content Creator shall create and share a new imaging study manifest representing the updated imaging study and deprecate the previously shared imaging study manifest.

The Content Creator will need to establish an association with each Imaging Document Source it references in Manifests it creates to be able to perform the above synchronization (manifest updates, manifest sharing, etc.). The mechanism for this association is not prescribed in the MADO Profile but left to implementation of these actors.

#### Imaging Document Consumer

The Imaging Document Consumer requests and receives DICOM instances from an Imaging Document Source.

The Imaging Document Consumer obtains imaging study manifest(s) from the grouped Document Consumer that uses appropriate transactions to search for DICOM Studies of interest within the community and retrieve such imaging study manifest(s). These transactions provide access to an MHD/XDS.b sharing infrastructure, by a grouping with the MHD Document Consumer or XDS.b Document Consumer in ITI profiles. The MHD Document Consumer and XDS.b Document Consumer are NOT directly included in this profile.

The Imaging Document Consumer acts as the consuming partner of the imaging study manifest Content Creator. Thus, there is no Content Consumer actor in the MADO profile. This simplifies the profile and aligns it with the approach used by the XDS-I.b profile.

The Imaging Document Consumer shall provide three major functions:

- Parsing the imaging study manifest to access the descriptive information of the study content and the location information that provides access to the study's DICOM instances.
- Identifying DICOM instances to be retrieved based on user choice or algorithmic logic.
- Issuing a WADO-RS Retrieve [RAD-107] transaction in the Requester role to an Imaging Document Source to retrieve the selected DICOM instances within its community.

*Note: The MADO imaging study manifest does not include frame-level information beyond the number of frames. MADO does not require WADO-RS retrieval of Metadata, Pixel Data, Bulk Data Resources. Since Frame retrieval is a form of pixel data retrieval, only study, series and instance may be retrieved as DICOM Instances. Frames may be retrieved as Rendered Instances.*

The Imaging Document Consumer may be grouped with an Image Display Invoker – see Section X.6.

The Imaging Document Consumer forms the URL endpoint in a Study Service Retrieve Request by using:

- the base URI obtained by either one of two methods (see X.4.1.2 Intra-community sharing infrastructure). Both methods shall be implemented.

  *Note: The Retrieve Location UID mode requires the addition of a look-up service client which is outside the scope of the MADO Profile.*

- the following metadata elements from the retrieved imaging study manifest:
  - Study Instance UID
  - Series Instance UID, as needed
  - SOP Instance UID, as needed

The Imaging Document Consumer will typically retrieve all DICOM instances listed in the imaging study manifest that belong to the same series from a specific Imaging Document Source within the community. Alternatively, it may choose to retrieve each Instance resource individually.

The Imaging Document Consumer that requests retrieval using the Series Instances or Study Instances resources shall be able to handle the case where a larger or smaller number of Instances than expected are returned. This may occur because the list of instances in a series, or list of series in a study, referenced by an imaging study manifest might not match the instances for that series or study, retrievable from an Imaging Document Source.

#### Imaging Document Source

The Imaging Document Source provides requested DICOM instances.

If the &lt;resource&gt; component of the inbound request URL is for a complete study or series, the Imaging Document Source may choose to only return the DICOM Instances that have been published in the imaging study manifest by the Content Creator associated with the Imaging Document Source.

The Imaging Document Source will need to establish an association with each Content Creator that publishes Manifests referencing its content to remain synchronized (notify of changes in content, share what has been published, etc.). The mechanism for this association is not prescribed in the MADO Profile but left to implementation of these actors.

## MADO Actor Options

Options that may be selected for each actor in this profile, if any, are listed in Table X.2-1. Dependencies between options, when applicable, are specified in notes.

<table class="madotable">
  <caption>Table X.2-1: MADO – Actors and Options</caption>
  <thead>
    <tr><th>Actor</th><th>Option Name</th><th>Reference</th></tr>
  </thead>
  <tbody>
    <tr><td>Content Creator</td><td>No options defined</td><td>N/A</td></tr>
    <tr><td rowspan="3">Imaging Document Consumer</td><td>DICOM KOS-based Imaging Study Manifest (Note 1)</td><td>Section X.2.1</td></tr>
    <tr><td>FHIR-Based Imaging Study Manifest (Note 1)</td><td>Section X.2.2</td></tr>
    <tr><td>Rendered Instances</td><td>Section X.2.3<br>RAD TF-2: 4.107.4.0.5</td></tr>
    <tr><td>Imaging Document Source</td><td>Rendered Instances</td><td>Section X.2.3<br>RAD TF-2: 4.107.4.0.5</td></tr>
  </tbody>
</table>

*Note 1: At least one of these two options SHALL be supported.*

### DICOM KOS-Based Imaging Study Manifest Option

This option involves using a DICOM encoding of the imaging study manifest (instead of an HL7 FHIR encoding).

A Document Consumer supporting this option shall consume imaging study manifests using the specification defined in IHE RAD TF-3: 6.X.2: MADO DICOM KOS-Based Imaging Study Content Definition. The imaging study manifest shall be encoded in the DICOM File Format specified in Section 7 "DICOM File Format" in DICOM PS3.10.

### HL7 FHIR-Based Imaging Study Manifest Option

This option involves using an HL7 FHIR encoding of the imaging study manifest (instead of a DICOM encoding).

A Document Consumer supporting this option shall consume imaging study manifests using the specification defined in IHE RAD TF-3: 6.X.3: MADO HL7 FHIR-Based Imaging Study Manifest Content Definition.

### Rendered Instances Option

This option adds the exchange of images rendered (e.g., JPG) from DICOM instances.

An Imaging Document Consumer supporting this option shall be able to request and receive instances in a rendered format.

An Imaging Document Source supporting this option shall be able to respond to requests for rendered instances and return them in a rendered format.

## MADO Required Actor Groupings

An actor from this profile (Column 1) shall implement all of the required transactions and/or content modules in this profile in addition to all of the requirements for the grouped actor (Column 2).

In some cases, required groupings are defined as at least one of an enumerated set of possible actors; this is designated by merging column one into a single cell spanning multiple potential grouped actors. Notes are used to highlight this situation.

Section X.5 describes some optional groupings that may be of interest for security considerations and Section X.6 describes some optional groupings in other related profiles.

<table class="madotable">
  <caption>Table X.3-1: MADO – Actor Groupings</caption>
  <thead>
    <tr><th>MADO Actor</th><th>Actor(s) to be grouped with</th><th>Reference</th><th>Content Bindings Reference</th></tr>
  </thead>
  <tbody>
    <tr><td>Content Creator</td><td>ITI CT / Time Client</td><td>ITI TF-1: 7.1</td><td></td></tr>
    <tr><td rowspan="2">Imaging Document Consumer</td><td>ITI CT / Time Client</td><td>ITI TF-1: 7.1</td><td></td></tr>
    <tr><td>ITI ATNA / Secure Node or Secure Application</td><td>ITI TF-1: 9.1</td><td></td></tr>
    <tr><td rowspan="2">Imaging Document Source</td><td>ITI CT / Time Client (Note 1)</td><td>ITI TF-1: 7.1<br>RAD TF-3: 5.2 (CP-RAD-565)</td><td></td></tr>
    <tr><td>ITI ATNA / Secure Node or Secure Application</td><td>ITI TF-1: 9.1</td><td></td></tr>
  </tbody>
</table>

*Note 1: The Imaging Document Source, when grouped with the ITI CT / Time Client, is strongly recommended to implement the DICOM Timezone Option in the ITI CT Profile. The DICOM Timezone Option mandates the Timezone Offset From UTC (0008,0201) attribute. This option is being introduced by CP-ITI-1329 and CP-RAD-565.*

## MADO Overview

### Concepts

#### Role of an Imaging Study Manifest

An imaging study manifest is a document listing the key information about the content of a single imaging study. It acts as a summary for the actual imaging study that can be large (typically megabyte or gigabyte size) and complex (hundreds of data elements). It includes location pointers to its instances' content and organizes this information according to the well-established model of an imaging study containing one or more series with each series containing one or more instances (e.g., images).

The Content Creator produces an imaging study manifest that represents the shared content of an imaging study that is made available by the Imaging Document Source in the community. The Content Creator determines which part of the local imaging study to include in the imaging study manifest it publishes. This decision is based on local and community policies.

The MADO imaging study manifest extends the definition of the XDS-I.b imaging study manifest by including key information about the content of the imaging study including attributes that describe the:

- Modalities
- Anatomic Regions
- Study Instance UIDs
- Accession Numbers
- Placer Order Numbers
- Procedure Codes
- Number of Study Related Series
- Series Number
- Series Description
- Series Date/Time
- Number of Series Related Instances
- Instance Number
- Number of Frames (if a multi-frame instance)
- Key Image Notes title code and optional description flagging key images

These attributes can be used to identify the series/instances of the imaging study that are of interest and so optimize the instance retrieval to those series/instances instead of having to retrieve the whole study.

Once the selected study, series, instance have been identified, the Imaging Document Consumer can retrieve this selection from an Imaging Document Source using a consistent mechanism, regardless of whether the imaging study manifest is published to an MHD, XDS.b, XDS-I.b or any other document sharing infrastructure.

The Imaging Document Consumer may interact with an Imaging Document Source located within the same community (See Section X.4.1.2) or with an Imaging Document Source located in a different community by grouping the MADO Profile with the XC-WADO Profile (See Section X.4.1.3).

MADO defines two content formats (and corresponding encodings) for the imaging study manifest:

1. DICOM KOS-Based (see TF-3: 6.X.2)
2. HL7 FHIR-Based (see TF-3: 6.X.3)

In addition, it specifies a bi-directional mapping between the two formats for transformation purposes (see TF-3: 6.X.5).

#### Intra-community Sharing Infrastructure

The MADO Profile assumes the Imaging Document Consumer is located within the same community as the Imaging Document Source.

The Imaging Document Source may gain access to imaging studies information internally or from an Image Manager/Image Archive, via standard mechanisms such as the Retrieve Images [RAD-16] transaction.

Imaging Document Consumers use a WADO-RS transaction for instance retrieval from Imaging Document Sources (see RAD TF-2: 4.107).

The imaging study manifest supports two methods (see RAD TF-3: 6.X.2.14 Hierarchical Series Reference Macro) to determine the endpoint to access a series of the imaging study:

1. Retrieve URL Method. The imaging study manifest contains a Retrieve URL that conveys a base URI for the endpoint that supports the WADO-RS instance retrieve service. Although the Retrieve Location UID is always required to be present in the imaging study manifest, if there is no look-up service available the Retrieve URL must be used.
2. Retrieve Location UID Method. The imaging study manifest contains a Retrieve Location UID which is used as input to a look-up service that returns the base URI for the endpoint that supports the WADO-RS instance retrieve service. Such a look-up service is outside the scope of the MADO Profile and may consist of local configuration or a directory such as the IHE mCSD Profile.

*Note: If a study, series or instance is not available from a given endpoint, the implementation of the Imaging Document Consumer may choose to support the use of a configured value for a proxy endpoint and construct a new URL based on the UIDs of the study, series or instance.*

Imaging Document Consumers and Imaging Document Sources are configured at the time of deployment to use one of these two methods. This allows specific communities to use the addressing method of their choosing.

#### Cross-community Sharing Infrastructure

The Imaging Document Consumer located within one community may request instances of imaging studies from an Imaging Document Source located in a different community. Each community is served by initiating and responding gateways that interconnect the communities.

Such an extension to the use of MADO in cross-community environments may be achieved by grouping with the IHE XC-WADO Profile. This is done by grouping actors from the two profiles. (See XC-WADO RAD TF-1: 58.4.2.1 Use Case #1: Image Set sharing between communities.)

The formatting of the URL used in the [RAD-160] WADO-RS transaction is specified by the XC-WADO Profile and supports communities that use different modes of addressing a) Retrieve URL based, and b) Retrieve Location UID based (see Section X.4.1.2).

As a result, the Imaging Document Consumer can retrieve imaging studies from an Imaging Document Source using a consistent mechanism, regardless of whether the imaging study is published to an MHD or XDS.b environment, or an XCA community.

#### Imaging Reports

MADO focuses on retrieving DICOM Instances using RESTful services. Other imaging study-related documents, such as radiology reports in CDA or FHIR based formats are outside the scope of the MADO Profile and may be retrieved using the ITI MHD actors or the XDS.b actors.

#### Obtain the Manifests of Imaging Studies of Interest

The way in which an imaging study manifest is obtained using a document sharing infrastructure involves the following steps:

1. Discover one or more imaging study manifests by filtering them using search parameters for a selected patient - such as Modality, Anatomical Region, Study Date, and Time. These search parameters are further specified in RAD TF-3: 6.X.6 Imaging Study Manifest Search Metadata.
2. Perform a selection among the entries of this initial list of matching imaging study manifests using the full set of document search metadata returned to identify the desired imaging study manifests and request the retrieval of the imaging study manifest(s) of interest.

These steps are beyond the scope of MADO but could be accomplished using IHE Profiles such as MHD, XDS.b, XDS-I.b (see Section X.6).

As an example, the Imaging Document Consumer could be grouped with the MHD Document Consumer that is the initiator of the imaging study manifest discovery and retrieval and communicates with the MHD Document Responder. The MHD Document Consumer uses the Find Document References [ITI-67] and Retrieve Document [ITI-68] transactions to find and retrieve the imaging study manifests. The MHD Document Consumer then provides this information to the Imaging Document Consumer.

#### Selecting a Subset of an Imaging Study

Imaging studies can be very large, and it is not always necessary, or desirable, to retrieve an entire imaging study, particularly if bandwidth is limited. It is therefore useful to be able to obtain study metadata first to allow for a more selective retrieval, e.g., a particular series or instance or frame.

Though knowledge of the URL endpoint for an imaging study allows the use of QIDO or WADO metadata resource requests for any component of the entire imaging study, specific query keys may not be supported or the amount of metadata available excessive, so a selected subset of metadata made available via an imaging study manifest is a convenient alternative.

The subset is typically based on selection metadata that describes the series and the instances in the imaging study. (See the selection metadata or key information specified for the content of the imaging study listed in the middle of Section X.4.1.1)

This selection metadata is obtained by the Imaging Document Consumer from the MADO imaging study manifest (See Section X.4.1.1 Role of an Imaging Study Manifest) and made available to the user or an application (e.g., Hanging Protocols) to select their subset of interest.

#### Launching a Remote Image Display

Some imaging sources may provide remote viewers that can be launched. This is intended to allow image access to imaging consumers that are unable to process DICOM instances but have an off-the-shelf browser. The Content Creator needs to be aware of this viewer and signals its availability by including a complete URL in an imaging study manifest.

An Imaging Document Consumer may invoke or launch an image display viewer on a remote server, using the complete URL, to view the imaging study associated with the corresponding imaging study manifest.

The structure and content of the complete URL (in both imaging study manifest formats) is not constrained by this Profile. This is intended to offer the flexibility to support a variety of remote image display implementations. The use of a URL as specified by the Invoke Image Display (IID Profile – See RAD TF-1: 35) is recommended (see Section X.6).

The URL is intended to invoke the remote image display for the viewing of the Study to which the imaging study manifest corresponds (Study Instance UID).

It is the responsibility of the server that hosts the image display application to control and perform an audit trail of the access to images. Both access control and audit trail specifications are outside the scope of the MADO Profile (see further discussion in Section X.5 Security Considerations).

It is the responsibility of the Content Creator creating Imaging Manifests to include a Display URL for a server able to display all instances identified in the imaging manifest. If instances in the manifest are distributed across multiple sources and a single viewer is not capable to display all of them, then the content creator will not include such a Display URL.

Imaging Document Consumers should understand that the longevity and reachability of Display URI and Retrieve URL conveyed in the manifest may be affected by such factors as infrastructure changes, proxy configurations, TLS certificate rotation, and access control policies. This profile does not provide explicit guidance on URL lifecycle management. Note that use of the Retrieve Location UID (0040,E011) as a unique identifier of the source may be an alternative for deriving the destination URL when the URL stability cannot be guaranteed.

### Use Cases

#### Use Case #1: DICOM Instances Retrieval

##### DICOM Instances Retrieval Use Case Description

This use case focuses on the retrieve of the DICOM encoded instances which can be displayed or processed.

- The application (e.g., Electronic Patient Record, PACS) presents the descriptive information of the study content to the clinician, as available in the selected imaging study manifest.
- From this descriptive information, the clinician selects one or more series of images or specific images of interest and requests their retrieval.
- The images are retrieved from the system where they are stored (PACS, VNA) using the location identified in the imaging study manifest. The system is acting as an Imaging Document Source.
- These images may be displayed to the clinician, processed by an application or imported into a local PACS.

##### Instance Retrieval Process Flow

{% include mado-usecase1-processflow.svg %}

*Figure X.4.2.1.2-1: Basic Process Flow in MADO Profile*

#### Use Case #2: Key DICOM Instances Retrieval

##### Key Instances Retrieval Use Case Description

This use case focuses on the retrieve of the DICOM encoded instances that are flagged as key images, which can be displayed or processed. This avoids selectively retrieving all DICOM Key Object Selection instances to identify which images have been flagged as key by one or more Key Image Note (IHE KIN Profile, See RAD TF-1: 8).

- This use case starts the same as Use Case #1: DICOM Instances Retrieval.
- The imaging study manifest indicates that some images in the imaging study have been flagged by the acquiring radiologist (in a Key Object Selection or KOS) as being of significant interest expressed by a code (e.g., "Of Interest", "For Surgery", "For Referring Provider") and optionally with a free format comment (e.g., "Tumor visible near the spine").
- Based on the above information, the clinician requests that only those images flagged as significant by one or more KOS object(s) be retrieved.
- The application retrieves the selected KOS and then the images from the system where they are stored (PACS, VNA) using the location identified in the imaging study manifest.
- The application displays the images to the clinician or processes them.

##### Key Instances Retrieval Process Flow

{% include mado-usecase2-keyimages.svg %}

*Figure X.4.2.2.2-1: Key Instances Retrieval Flow*

#### Use Case #3: Invoke Remote Image Display

##### Invoke Remote Image Display Use Case Description

This use case focuses on the launching of a display application on a remote server having access to the imaging study corresponding to the imaging study manifest. Such a remote viewer only needs an off-the-shelf browser to be launched and display the images from the study (no need for a local DICOM viewer). In this example Invoke Image Display [RAD-106] is being used to launch the remote viewer but other methods may be used.

- This use case starts the same as Use Case #1: DICOM Instances Retrieval.
- The imaging study manifest indicates that the imaging study can be viewed remotely via a Display URL link through a local browser.
- The clinician chooses to invoke the remote viewing application.
- The clinician interacts with the remote viewing application to navigate among the series and instances of the imaging study as desired, using the remote viewer user interface.

##### Invoke Remote Image Display Process Flow

{% include mado-usecase3-iid.svg %}

*Figure X.4.2.3.2-1: Invoke Remote Image Display Process Flow*

## MADO Security Considerations

The images and other study data being exchanged in this profile contain PHI which requires appropriate privacy and security measures.

The imaging study manifest contains three types of information with different security challenges:

- Patient identifying information, which must be treated as PHI.
- Imaging study descriptive information (see X.4.1.1 Role of an Imaging Study Manifest).
- Location information needed to build the URL to which the retrieve transaction of each series will be directed (see X.4.1.2 Intra-community sharing infrastructure).

The creator of the imaging study manifest determines which part of the imaging study to include in the imaging study manifest it publishes. This decision may be based in part on local and community security policies.

The MADO Profile has similar security considerations to other IHE profiles that are based on HTTP or REST. See ITI TF-2: Appendix Z.8 for recommendations for secure transportation, authentication, authorization, and securing patient identifiers in URLs. Implementers are encouraged to review that section for applicability to their product environment.

Implementers may also consider implementing Cross-Origin Resource Sharing (CORS) (<https://www.w3.org/TR/cors/>) support to allow browser-based clients to retrieve information from distributed sources (for example, queries are performed on server A, and instances are downloaded from server B).

Deployments should consider whether or not:

- The Imaging Document Consumer performs user authentication to access patient data.
- The Imaging Document Source uses credentials or tokens supplied by the Imaging Document Consumer in the WADO-RS Retrieve transaction.
- The Imaging Document Consumer or the Imaging Document Source (or both) records access in an audit log.

This profile does not define how the Imaging Document Consumer supplies credentials to the Imaging Document Source to provide the user with a seamless "single sign-on" experience. The HTTP GET URL transaction allows for a range of authentication mechanisms, including use of mTLS authentication, digest authentication, client certificate-based authentication, provision of a SAML assertion in an authentication header, or other mechanisms suitable for stateless atomic transactions.

The user authentication and authorization methods are outside the scope of the MADO Profile. Implementers should consider implementing the IHE ITI Profile such as Internet User Authorization (IUA) alongside the WADO-RS transaction.

Implementations should also consider how availability and integrity will be protected, including intentional attacks such as maliciously crafted queries that interfere with service availability.

The WADO-RS transactions may include in their response a URL specifying where the corresponding instances can be retrieved. In the absence of protection, such as TLS, a malicious attacker may intercept the response and rewrite these URLs to a location of suspect origin. An Imaging Document Consumer should verify that any received URL is valid and corresponds to a known secure location (for example a whitelisting service may be used to secure URLs).

## MADO Cross Profile Considerations

This section describes optional groupings with other related profiles. It provides general guidance on the implications of such groupings and when needed, it specifies precise requirements on how they are grouped.

### ITI MHD – Mobile Access to Health Documents

ITI MHD document sharing infrastructures can be used to distribute imaging study manifests. In this context:

- A Document Source in the MHD Profile can be grouped with a Content Creator to create and publish an imaging study manifest. In this case, the MHD Document Source will use the MHD Envelope as specified in IHE RAD TF-3: 6.X.4
- A Document Consumer in the MHD profile can be grouped with a Imaging Document Consumer to access imaging study manifests. In this case, the MHD Document Consumer will use the MHD Envelope as specified in IHE RAD TF-3: 6.X.4
- A Document Responder in the MHD Profile responds to the Document Consumers requests for imaging study manifests. In this case, the MHD Document Responder will use the MHD Envelope as specified in IHE RAD TF-3: 6.X.4

When an Imaging Document Consumer is grouped with an MHD Document Consumer, it shall be able to request in the ITI-68 Retrieve Document Transaction the media-type corresponding to the manifest format(s) it supports (i.e., as defined by the MADO DICOM KOS-based Option and/or the MADO FHIR-based Option).

The MHD Document Responder may or may not be able to provide the requested format. The MHD Document Consumer should provide an informative error message to its user when the MHD Document Responder cannot provide the requested format.

- When the MHD Document Responder implements a MADO Manifest Format mapping function it can support environments where the source provides only one manifest format and some consumers require the other.
- When the MHD Document Responder does not implement a MADO Manifest Format mapping function, the manifest format chosen for deployment by the MADO Content Creator must be the same one as the one implemented by the MADO Imaging Document Consumer in the same community (see Note 1 in Section X.1 MADO Actors, Transactions, and Content Modules).

### ITI MHDS – Mobile Health Document Sharing

ITI MHDS document sharing infrastructures can be used to distribute imaging study manifests. In this context:

- A Document Source in the MHD Profile can be grouped with a Content Creator to create and publish an imaging study manifest.
- A Document Consumer in the MHD profile can be grouped with a Imaging Document Consumer to access imaging study manifests.
- A Document Responder in the MHD Profile responds to the Document Consumers requests for imaging study manifests.

Any additional requirements specified in Section X.6.1 for the MHD Profile grouping apply.

### ITI XDS.b – Cross-enterprise Document Sharing

ITI XDS.b document sharing infrastructure can be used to distribute imaging study manifests. In this context:

- A Document Source in the XDS.b Profile can be grouped with a Content Creator to create and publish an imaging study manifest.
- A Document Consumer in the XDS.b profile can be grouped with a Imaging Document Consumer to access imaging study manifests.
- A Document Registry and one or more Document Repositories in the XDS.b Profile respond to the Document Consumers requests for imaging study manifests.

The XDS.b Document Repository may or may not be able to provide imaging study manifests in the requested format. The XDS.b Document Consumer should provide an informative error message to its user when the XDS.b Document Repository cannot provide the requested format.

In an XDS.b deployment, the manifest format chosen for deployment by the MADO Content Creator has to be the same one as the one implemented by the MADO Imaging Document Consumer deployed in the same community (see Note 1 in Section X.1 MADO Actors, Transactions, and Content Modules). The functional search parameters defined by the MADO Profile (RAD TF-3: Section 6.X.6) shall be mapped as specified in the IHE RAD TF: 3 Appendix A – Mapping of MADO Search Parameters to MHD and XDS.b Metadata.

### RAD XDS-I.b – Cross-enterprise Document Sharing for Imaging

RAD XDS-I.b document sharing infrastructures can be used to distribute imaging study manifests. In this context:

- An Imaging Document Source in the XDS-I.b Profile can be grouped with a Content Creator to create and publish an imaging study manifest (MADO DICOM KOS-based).
- An Imaging Document Consumer in the XDS-I.b profile can be grouped with an Imaging Document Consumer to access imaging study manifests (MADO DICOM KOS-based).
- A Document Registry and one or more Document Repositories in the XDS.b Profile respond to the Document Consumers requests for imaging study manifests.

In an XDS-I.b deployment, the manifest format chosen for deployment by the MADO Content Creator must be the MADO DICOM KOS-based which is backward compatible with the XDS-I.b DICOM KOS based imaging study manifest. This constrains the MADO Imaging Document Source deployed in the same community to be configured with the MADO DICOM KOS-based (see Note 1 in Section X.1 MADO Actors, Transactions, and Content Modules).

The functional search parameters defined by the MADO Profile (RAD TF-3: Section 6.X.6) shall be mapped as specified in the IHE RAD TF: 3 Appendix A – Mapping of MADO Search Parameters to MHD and XDS.b Metadata.

XDS-I.b KOS-Based manifests shared with the XDS-I.b profile, may be consumed by MADO Imaging Document Consumers grouped with an XDS-I.b Imaging Document Consumer, but the enhanced features introduced by the MADO imaging study manifest will not be available.

### RAD XC-WADO – Cross-community Web-Based Access to DICOM Objects

An XC-WADO Document Consumer can be grouped with an Imaging Document Consumer (RAD TF-1 XC-WADO Supplement) to retrieve imaging study instances from Imaging Document Sources located in remote communities.

The XC-WADO Imaging Document Consumer when combined with an Imaging Document Consumer:

- Is aware of the endpoint of the XC-WADO Initiating Imaging Gateway and shall obtain, the homeCommunityId from the Cross-community document retrieve response and the Retrieve Location UID & Retrieve URL from the selected imaging study manifest.
- Constructs the WADO-RS retrieve URL based on the above information and issues the Cross-community WADO-RS Retrieve [RAD-160] transaction request to the XC-WADO Initiating Imaging Gateway. See RAD TF-1:X.4.1.3 (Cross-community sharing infrastructure).

Appendix XA – Managing the addresses of the sources of images to retrieve beyond a single community, provides examples of URL addressing when MADO and XC-WADO are grouped.

### RAD IID – Invoke Image Display

The IID Invoke Imaging Display actor (RAD TF-1: 35) can be grouped with an Imaging Document Consumer to invoke a remote viewing application to display remotely the imaging study using the Display URL conveyed in the selected imaging study manifest.

The IID Image Display actor can be grouped with an Imaging Document Source to respond to a request to launch an image viewer based on the Display URL invoked by a remote web browser. Such a Display URL was previously placed in an imaging study manifest by a Content Creator associated with the imaging document source.

Other deployments where the Display URL is not formatted as an IID URL may be considered but are out of scope of the grouping with IID specified by the MADO Profile.

### RAD KIN - Key Image Note

A KIN Evidence Creator, Modality, Image Manager/Archive Actor, when grouped with a Content Creator, shall create imaging study manifests with information resulting from one or more KOS objects that flag significant images (RAD TF-1: 8) in any associated imaging study.

### RAD SWF.b – Scheduled Workflow

A SWF Image Manager/Archive Actor can be grouped with a Content Creator to create imaging study manifests to make available imaging studies.

A SWF Image Manager/Archive Actor can be grouped with an Imaging Document Source to respond to image retrieve requests for imaging studies.

A SWF Image Manager/Archive Actor can be grouped with an Imaging Document Consumer to provide access to remote imaging studies.

Such grouping contributes to enhance the quality and consistency of information content (e.g., study date and time, accession number) in the MADO imaging study manifest and MADO retrieval of DICOM Instances from imaging studies.
