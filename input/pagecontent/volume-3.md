{% include aliases.md %}

<style>
table.madotable { border-collapse: collapse; margin-bottom: 1em; }
table.madotable caption { caption-side: top; text-align: center; font-weight: bold; padding: 4px 0; }
table.madotable th, table.madotable td { border: 1px solid #7f7f7f; padding: 4px 8px; vertical-align: top; text-align: left; }
table.madotable th { background-color: #d9d9d9; font-weight: bold; }
</style>

## IHE Namespaces, Concept Domains and Vocabularies

Add to Section 4 IHE Namespaces, Concept Domains and Vocabularies, Section 4.3.1, the following two lines in Table 4.3.1-1 Format Codes for IHE Radiology Profiles.

### Format Codes and Vocabularies

#### IHE Format Codes

<table class="madotable">
  <caption>Table 4.3.1-1: Format Codes for IHE Radiology Profiles</caption>
  <thead>
    <tr><th>Profile</th><th>Format Code</th><th>Coding Scheme</th><th>Description</th><th>Reference</th></tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">Manifest Based Access to DICOM Objects (MADO)</td>
      <td>1.2.840.10008.5.1.4.1.1.88.59<br>(same as XDS-I assigned Format Code)</td>
      <td>1.2.840.10008.2.6.1</td>
      <td>DICOM KOS-Based Imaging Study Manifest</td>
      <td>6.X.2</td>
    </tr>
    <tr>
      <td>urn:ihe:rad:MADO:fhir-manifest:2026</td>
      <td>1.3.6.1.4.1.19376.1.2.7.1</td>
      <td>FHIR-based Imaging Study Manifest</td>
      <td>6.X.3</td>
    </tr>
  </tbody>
</table>

## MADO Imaging Study Manifest

### Scope

An imaging study manifest is a document listing key information about the content of a single imaging study. In addition to study and series metadata, it documents each series in the study, the instances (e.g., images) in each series, and includes pointers to where instances can be retrieved. MADO defines two formats for the imaging study manifest:

1. DICOM KOS-Based (see TF-3: 6.X.2)
2. HL7 FHIR-Based (see TF-3: 6.X.3)

A bi-directional mapping between the two formats for transformation purposes is specified in Section 6.X.5.

An MHD Envelope Content is specified in Section 6.X.4 for use when IHE MHD Document Consumer Actors and Document Source Actors of the document sharing infrastructure are grouped with MADO (see TF-1: X.6).

Finally, a set of imaging study manifest search parameters, is specified in Section 6.X.6 for use when Document Consumer Actors of the document sharing infrastructure are grouped with MADO (see TF-1: X.6).

### DICOM KOS-Based Imaging Study Content Definition

This section specifies the structure and format of an Imaging Study Manifest using the DICOM standards. It is based on the DICOM Key Object Selection (KOS) as specified in DICOM PS3.3 Section A.35.4 Key Object Selection Document IOD (Information Object Definition).

A Creator shall be able to create a DICOM KOS-based Imaging Study Manifest as specified in this section.

A Consumer shall process a DICOM KOS-based Imaging Study Manifest as specified in this section.

#### Conventions

IHE Profiles may constrain the use of instances of specific DICOM IODs (also referred to as DICOM objects). This typically means placing requirements on the creators of those instances, although requirements may also be placed on the receivers and users. These profiling conventions on DICOM IOD are defined in Appendix E Section E.2 of the IHE Technical Frameworks General Introduction. These conventions are copied in this section (as extracted from section E.2 of CP-RAD-562 which is not yet approved at the time of issuing this Trial Implementation).

- The IHE Technical Framework uses the following legend to specify requirements for DICOM IOD module encoding:

<table class="madotable">
  <caption>Table 6.X.2.1-1: Usage of DICOM Modules in IHE</caption>
  <tbody>
    <tr><td>M/C/U</td><td>As defined in DICOM PS 3.3</td></tr>
    <tr><td>R</td><td>The Module is defined as Conditional (C) or User Option (U) in DICOM. The Requirement is an IHE extension of the DICOM requirements, and the module shall be present.</td></tr>
    <tr><td>RC</td><td>The Module is defined as Conditional (C) or User Option (U) in DICOM. The Requirement is an IHE extension of the DICOM requirements, and the module shall be present when the specified conditions apply.</td></tr>
  </tbody>
</table>

- The IHE Technical Framework uses the following legend to specify requirements for DICOM attribute encoding:

<table class="madotable">
  <caption>Table 6.X.2.1-2: Usage of DICOM Attributes in IHE</caption>
  <tbody>
    <tr><td>O</td><td>The attribute or its value is optional, i.e., in DICOM it is Type 2 or 3.</td></tr>
    <tr><td>O+*</td><td>The attribute is optional, but additional constraints have been added. Note: The specification approach does not force a Type 2 or Type 3 value to become a Type 1 by stating O+.</td></tr>
    <tr><td>R</td><td>The attribute shall be present with a value, and is not an IHE extension of the DICOM requirements, i.e., it is already Type 1 in DICOM, but additional constraints are placed by IHE, for example on the value set that may be used for the attribute.</td></tr>
    <tr><td>R+</td><td>The Requirement is an IHE extension of the DICOM requirements, and the attribute shall be present with a value, i.e., is Type 1, whereas the DICOM requirement may be Type 2 or 3.</td></tr>
    <tr><td>RC+</td><td>The Requirement is an IHE extension of the DICOM requirements, and the attribute shall be present when the condition is satisfied, i.e., is Type 1C, whereas the DICOM requirement may be Type 2 or 3. If the condition is not fulfilled, the DICOM definitions apply. Note, that this means that the attribute may be present / have a value also in case the condition does not apply.</td></tr>
    <tr><td>D</td><td>The requirements of DICOM apply unchanged, but the attribute needs to be displayed.</td></tr>
    <tr><td>-</td><td>No IHE extension of the DICOM requirements is defined. The attribute is listed for better readability or similar purpose.</td></tr>
    <tr><td>X+</td><td>The attribute information is required to be absent. DICOM Type 2 attributes shall be present with no value. DICOM Type 3 attributes shall be absent.</td></tr>
  </tbody>
</table>

Specifications for constraining instances of DICOM Structured Reports follow the conventions in the tables above. In many cases, requiring the use of a specific DICOM SR Template may be sufficient.

#### General Definitions

Study Instance UID (0020,000D) in the Imaging Study Manifest shall use the same value as the referenced instances. Since the Imaging study manifest instance is not considered to be "shared" with the MADO specified mechanisms, it will not include itself in the list of shared instances. When shared with MHD, MHDS, XDS.b, XDS-I.b document sharing profiles, the Imaging Study Manifest, shall be encoded as a DICOM Part 10 File format having a MIME type of "application/dicom".

<table class="madotable">
  <caption>Table 6.X.2.2: Imaging Study Manifest Format Code</caption>
  <thead>
    <tr><th>Format Code</th><th>Coding Scheme</th><th>Description</th></tr>
  </thead>
  <tbody>
    <tr><td>1.2.840.10008.5.1.4.1.1.88.59<br>(same as XDS-I assigned Format Code)</td><td>1.2.840.10008.2.6.1</td><td>MADO DICOM KOS-Based Imaging Study Manifest</td></tr>
  </tbody>
</table>

#### Referenced Standards

- DICOM PS 3.3: A.35.4 Key Object Selection Document IOD

#### IOD Definition

This section builds upon the DICOM IOD specification of a Key Object Selection SOP Class (1.2.840.10008.5.1.4.1.1.88.59) as specified by the DICOM Standard. It focusses on constraints and additions specific to the KOS-Based MADO Imaging Study Manifest.

<table class="madotable">
  <caption>Table 6.X.2.4-1: Usage of DICOM Modules in MADO Imaging Study Manifest</caption>
  <thead>
    <tr><th>IE</th><th>Module</th><th>Reference</th><th>Usage</th><th>IHE Usage</th></tr>
  </thead>
  <tbody>
    <tr><td>Patient</td><td>Patient</td><td>C.7.1.1</td><td>M</td><td>M<br>See Section 6.X.2.5</td></tr>
    <tr><td>Study</td><td>General Study</td><td>C.7.2.1</td><td>M</td><td>M<br>See Section 6.X.2.6</td></tr>
    <tr><td>Series</td><td>Key Object Document Series</td><td>C.17.6.1</td><td>M</td><td>M</td></tr>
    <tr><td>Equipment</td><td>General Equipment</td><td>C.7.5.1</td><td>M</td><td>M<br>See Section 6.X.2.7</td></tr>
    <tr><td rowspan="3">SR Document</td><td>Key Object Document</td><td>C.17.6.2</td><td>M</td><td>M<br>See Section 6.X.2.8</td></tr>
    <tr><td>SR Document Content</td><td>C.17.3</td><td>M</td><td>M<br>See Section 6.X.2.9</td></tr>
    <tr><td>SOP Common</td><td>C.12.1</td><td>M</td><td>M<br>See Section 6.X.2.10</td></tr>
  </tbody>
</table>

In the modules specified below only the DICOM attributes profiled by MADO are listed. The DICOM standard applies for all other attributes.

#### Patient Module

<table class="madotable">
  <caption>Table 6.X.2.5.1-1: Usage of DICOM Attributes in Patient Module</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.7-1 Patient Module</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Patient ID</td><td>(0010,0020)</td><td>R+</td><td>Primary identifier for the patient.<br>See Section 6.X.2.5.1.</td></tr>
    <tr><td colspan="4">Include Table 6.X.2.5.1.3-1 "Issuer of Patient ID Macro Attributes" - see section 6.X.2.5.3 Issuer of Patient ID Macro</td></tr>
    <tr><td>Other Patient IDs Sequence</td><td>(0010,1002)</td><td>R+</td><td>A Sequence of identification numbers or codes used to identify the Patient, which may or may not be human readable, and may or may not have been obtained from an implanted or attached device such as an RFID or barcode.<br>One or more Items shall be included in this Sequence.<br>See Section 6.X.2.5.2.</td></tr>
    <tr><td>&gt;Patient ID</td><td>(0010,0020)</td><td>R+</td><td>An identifier for the Patient.</td></tr>
    <tr><td colspan="4">&gt;Include Table 6.X.2.5.1.3-1 "Issuer of Patient ID Macro Attributes" - see section 6.X.2.5.3 Issuer of Patient ID Macro</td></tr>
  </tbody>
</table>

##### Patient ID (0010,0020)

The Patient ID (0010,0020), Issuer of Patient ID (0010,0021), and Issuer of Patient ID Qualifiers Sequence (0010,0024) shall all be present and populated (i.e., they are not permitted to be absent or empty).

This ensures that the patient identifier is fully qualified and globally unique so it can be properly recognized beyond the originating organization.

##### Other Patient IDs Sequence (0010,1002)

The Other Patient IDs Sequence (0010,1002) shall contain the patient identifier also present in the Patient ID attribute (0010,0020). In addition, it may contain other known patient identifiers such as national, regional and local ones.

This allows an importing system that prefers one of these identifiers for local use to select that item from the Other Patient IDs sequence and copy that data into the primary Patient ID (0010,0020), Issuer of Patient ID (0010,0021), and Issuer of Patient ID Qualifiers Sequence (0010,0024) without needing to make any changes to the Other Patient IDs Sequence.

##### Issuer of Patient ID Macro

<table class="madotable">
  <caption>Table 6.X.2.5.3-1: Usage of DICOM Attributes in Issuer of Patient ID Macro</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table 10-18 Issuer of Patient ID Macro Attributes</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Issuer of Patient ID</td><td>(0010,0021)</td><td>R+</td><td>Identifier of the Assigning Authority (system, organization, agency, or department) that issued the Patient ID.<br>This label corresponds to the authority identified by the Universal Entity ID (0010,0032) in the Issuer of Patient ID Qualifiers Sequence (0010,0024).</td></tr>
    <tr><td>Issuer of Patient ID Qualifiers Sequence</td><td>(0010,0024)</td><td>R+</td><td>Attributes specifying or qualifying the identity of the Issuer of the Patient ID (0010,0021) or scoping the Patient ID (0010,0020).<br>Only a single Item shall be included in this Sequence.</td></tr>
    <tr><td>&gt;Universal Entity ID</td><td>(0040,0032)</td><td>R+</td><td>Globally unique identifier for the Patient ID Assigning Authority.<br>The authority identified by this attribute shall be the same as that labelled by the Issuer of Patient ID (0010,0021).</td></tr>
    <tr><td>&gt;Universal Entity ID Type</td><td>(0040,0033)</td><td>R+</td><td>Standard defining the format of the Universal Entity ID.</td></tr>
  </tbody>
</table>

#### General Study Module

<table class="madotable">
  <caption>Table 6.X.2.6-1: Usage of DICOM Attributes in General Study Module</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.7-3 General Study Module</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Study Date</td><td>(0008,0020)</td><td>R+</td><td>Date the Study started.<br>See Section 6.X.2.6.2.</td></tr>
    <tr><td>Study Time</td><td>(0008,0030)</td><td>R+</td><td>Time the Study started.<br>See Section 6.X.2.6.2.</td></tr>
    <tr><td>Accession Number</td><td>(0008,0050)</td><td>O+</td><td>A departmental Information System generated number that identifies the Imaging Service Request.<br>See also Section 6.X.2.6.1 Accession Number.</td></tr>
    <tr><td>Issuer of Accession Number Sequence</td><td>(0008,0051)</td><td>RC+</td><td>Identifier of the Assigning Authority that issued the Accession Number (0008,0050).<br>Required if Accession Number (0008,0050) is not empty.<br>Only a single Item shall be included in this Sequence.</td></tr>
    <tr><td colspan="4">&gt;Include Table 6.X.2.12-1 "HL7v2 Hierarchic Designator Macro Attributes" – see section 6.X.2.12 HL7v2 Hierarchic Designator Macro</td></tr>
    <tr><td>Study Description</td><td>(0008,1030)</td><td>RC+</td><td>Institution-generated description or classification of the Study performed.<br>Required if Study Description (0008,1030) is populated in any instance(s) referenced by this KOS manifest.</td></tr>
  </tbody>
</table>

##### Accession Number

Three cases shall be supported:

1. Simple Case: An imaging study is related to a single Accession Number (IHE Scheduled Workflow Profile, see RAD TF2: 4.6.4.1.2.3.1 Simple Case). The General Study Module conveys the single accession number in Accession Number (0008,0050).
2. Group Case: An imaging study is related to more than one Accession Number (IHE Scheduled Workflow Profile, see RAD TF2: 4.6.4.1.2.3.4 Group Case). The Referenced Request Sequence 6.X.2.8.1 conveys these multiple Accession Numbers. The Accession Number (0008,0050) attribute from the General Study Module shall be present and empty.
3. Absent Case: An imaging study is not locally stored with an Accession Number. One or more unique Accession Number(s) shall be generated by the Content Creator. If a single accession number is generated, it is conveyed in the General Study Module (Simple Case), otherwise the Referenced Request Sequence is used (Group Case). If Imaging Reports exist and are associated with the shared imaging study, they are expected to contain the appropriate generated Accession Number(s).

##### Study Date and Time

In DICOM, the Study Date (0008,0020) and Study Time (0008,0030) are Type 2 but become required in this content definition because they are critical search parameters (RAD TF-3: 6.X.5 Imaging Study Manifest Search Metadata). While they are widely present in imaging studies, if they are absent in the study instances, the imaging manifest Content Creator shall populate them with appropriate values based on other datetime values in the instances or external information.

The Study Date (0008,0020) and Study Time (0008,0030) in the imaging study manifest are required by the MADO Profile. They are Type 2 attributes in DICOM and are widely present in imaging studies. These attributes are among the critical search parameters (RAD TF-3: 6.X.5 Imaging Study Manifest Search Metadata) and need to be present in the imaging study manifest.

Time zones become particularly relevant in a document sharing context. It is strongly recommended that instances include the Timezone Offset From UTC (0008,0201). DateTime attribute values may also encode the timezone directly. See also the IHE CT Profile Timezone Offset Option introduced by IHE CP-ITI-1329 and CP-RAD-565.

#### General Equipment Module

<table class="madotable">
  <caption>Table 6.X.2.7-1: Usage of DICOM Attributes in General Equipment</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.7-8 General Equipment Module</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Manufacturer</td><td>(0008,0070)</td><td>R+</td><td>Manufacturer of the equipment that produced the KOS manifest.<br>This attribute is required to facilitate trace back of creation errors in KOS Manifests.</td></tr>
    <tr><td>Institution Name</td><td>(0008,0080)</td><td>R+</td><td>Institution that created the KOS manifest. This attribute is required to facilitate trace back of content errors in KOS Manifests.<br>Fixed value configured onsite at install time of the software that created the KOS Manifests.<br><em>Note: It is recommended to format this attribute according to the HL7 V2.5 XON data type so that it contains, in addition to the institution name, its globally unique identifier. This format is identical to the format of the authorInstitution Attribute of the MHD, XDS and XCA metadata.</em></td></tr>
  </tbody>
</table>

#### Key Object Document Module

<table class="madotable">
  <caption>Table 6.X.2.8-1: Usage of DICOM Attributes in Key Object Document Module</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.17.6-2 Key Object Document Module</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Referenced Request Sequence</td><td>(0040,A370)</td><td>R+</td><td>Identifies Requested Procedures to which this Document pertains.<br>One or more Items shall be included in this Sequence.<br>See Section 6.X.2.8.1.</td></tr>
    <tr><td colspan="4">&gt;Include Table 6.X.2.8.1-1 "Referenced Request Macro Attributes" – see section 6.X.2.8.1 Referenced Request Macro</td></tr>
    <tr><td>Current Requested Procedure Evidence Sequence</td><td>(0040,A375)</td><td>R</td><td>List of all Composite SOP Instances references in Content Sequence (0040,A730), including all presentation states, real world value maps and other accompanying composite instances that are referenced from the content items.</td></tr>
    <tr><td colspan="4">&gt; Include Table 6.X.2.13-1 "Hierarchical SOP Instance Reference Macro" – see section 6.X.2.13 Hierarchical SOP Instance Reference Macro</td></tr>
  </tbody>
</table>

##### Referenced Request Sequence

Identifies Requested Procedures that are being fulfilled (completely or partially) in the imaging study referenced by the manifest.

Figure 6.X.2.8.1-1 shows the many to many relationships between the workflow entities Clinical Order and Imaging Procedure Request (called Scheduled Procedure Request by DICOM) and the Imaging Study. The MADO Profile is designed to handle all of these relationships to ensure interoperability even between the broadest number of existing and future Imaging Document Consumers and Sources.

{% include mado-entities-linkages.svg %}

*Figure 6.X.2.8.1-1: Entities Identifiers and their linkages*

The Referenced Request Sequence (0040,A370) contains the same number of items as the number of unique combinations of Accession Numbers and Placer Order Numbers associated with the Imaging Study.

The following examples illustrate some possible combinations:

1. An intensive care physician orders a series of six portable chest x-rays for a patient, every 12 hours over 72 hours.
   - 1 Clinical Order
   - 6 Imaging Procedure Requests
   - 6 Imaging Studies

   When the imaging manifest is created for each one of these 6 Imaging Studies, the Accession Number in the Study Module contains the Accession Number (corresponding to one of the Imaging Procedure Requests). In addition, if the Placer Order Number is known, the Referenced Request Sequence (0040,A370) contains one item for the unique combination of the Accession Number (corresponding to one of the Imaging Procedure Requests) and the Placer Order Number (corresponding to the clinical order).
2. An ED physician orders a chest CT and an abdominal CT for a patient in a tertiary care center. A single combined chest/abdominal CT is carried out and read by a single radiologist.
   - 2 Clinical Orders
   - 1 Imaging Procedure Request
   - 1 Imaging Study

   When the imaging manifest is created for the grouped imaging study, the Referenced Request Sequence (0040,A370) contains two items, one for the first Placer Order Number with the Accession Number and the second item for the second Placer Order Number with the same Accession Number.
3. An angiography procedure is ordered by a vascular surgeon. During the course of this radiology intervention, an ultrasound exam is performed in the Angio room.
   - 1 Clinical Order
   - 1 Imaging Procedure Request
   - 2 Imaging Studies

   When the two imaging manifests are created, each manifest contains the same Accession Number in the Study Module. In addition, if the Placer Order Number is known, the Referenced Request Sequence (0040,A370) contains a single Item (Accession Number and Order Placer Number).

#### SR Document Content Module

The SR Document Content Module shall be constructed from TID 2010 "Key Object Selection" invoked at the root node.

The TID 2010 "Key Object Selection" Template may include one or more Content Items of Value Type CODE and identified by EV (121023, DCM "Procedure Code").

The TID 2010 "Key Object Selection" Template shall include the TID 1600 "Image Library" Template. CID 7010 "Key Object Selection Document Title shall be set to: (131560, DCM, "Manifest with Description").

The TID 1600 "Image Library" Content Items shall be present as specified in Table 6.X.2.9-1: TID 1600 Template for SR Document Content Module of Manifest.

<table class="madotable">
  <caption>Table 6.X.2.9-1: TID 1600 Template for SR Document Content Module of Manifest</caption>
  <thead>
    <tr><th>Rel with Parent</th><th>VT</th><th>Concept Name</th><th>VM</th><th>Req Type</th><th>Condition</th><th>Value Set Constraint</th></tr>
  </thead>
  <tbody>
    <tr><td>HAS ACQ CONTEXT</td><td>CODE</td><td>EV (121139, DCM, "Modality")</td><td>1-n</td><td>R+</td><td></td><td>DCID 29 "Acquisition Modality"<br>Non-acquisition Modality from DCID 32 "Non-Acquisition Modality" may be included.</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>CODE</td><td>EV (123014, DCM, "Target Region")</td><td>1-n</td><td>R+</td><td></td><td>Code value for target region selected. See 6.X.6.4.1 High-Level Anatomic Regions and Systems Value Set (See Note below).</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>NUM</td><td>EV (131565, DCM, "Number of Study Related Series")</td><td>1</td><td>R+</td><td></td><td>UNITS = EV ({series}, UCUM, "series")<br>This value shall reflect the number of series in the study as referenced by the Current Requested Procedure Evidence Sequence (0040,A375).</td></tr>
  </tbody>
</table>

*Note: The High-level anatomic regions and systems value set defined in Section 6.X.6.4.1 High-Level Anatomic Regions and Systems Value Set is intended to be used for the metadata search parameter (See section 6.X.6.2 Imaging-Specific Search Request Parameters) used to support filtering queries.*

Within the TID 1600 Image Library, each shared Series in the Manifest shall be represented by a distinct Image Library Group container. Within this container, the TID 1602 "Image Library Entry Descriptors" Content Items shall be present as specified in Table 6.X.2.9-2: TID 1602 Image Library Group Template for SR Document Content Module of Manifest.

<table class="madotable">
  <caption>Table 6.X.2.9-2: TID 1602 Image Library Group Template for SR Document Content Module of Manifest</caption>
  <thead>
    <tr><th>Rel with Parent</th><th>VT</th><th>Concept Name</th><th>VM</th><th>Req Type</th><th>Condition</th><th>Value Set Constraint</th></tr>
  </thead>
  <tbody>
    <tr><td>HAS ACQ CONTEXT</td><td>CODE</td><td>EV (121139, DCM, "Modality")</td><td>1</td><td>R+</td><td></td><td>DCID 33 "Modality"</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>DATE</td><td>EV (131561, DCM, "Series Date")</td><td>1</td><td>RC+</td><td>Shall be populated if the corresponding attribute is populated in the relevant instance(s).</td><td></td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>TIME</td><td>EV (131562, DCM, "Series Time")</td><td>1</td><td>RC+</td><td>Shall be populated if the corresponding attribute is populated in the relevant instance(s).</td><td></td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>TEXT</td><td>EV (131563, DCM, "Series Description")</td><td>1</td><td>RC+</td><td>Shall be populated if the corresponding attribute is populated in the relevant instance(s).</td><td></td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>TEXT</td><td>EV (113607, DCM, "Series Number")</td><td>1</td><td>RC+</td><td>Shall be populated if the corresponding attribute is populated in the relevant instance(s).</td><td>The text string shall be consistent with the value of Series Number (0020,0011) of the referenced series.</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>UIDREF</td><td>EV (112002, DCM, "Series Instance UID")</td><td>1</td><td>R+</td><td></td><td></td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>CODE</td><td>EV (123014, DCM, "Target Region")</td><td>1</td><td>RC+</td><td>Shall be populated if the corresponding attribute is populated with coded information in the relevant instance(s).</td><td>This is a fine-grained series level anatomical region recommended to use DCID 4031 or CID4</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>TEXT</td><td>EV (123014, DCM, "Target Region")</td><td>1</td><td>RC+</td><td>Shall be populated if the corresponding attribute is populated with only textual information in the relevant instance(s).</td><td>This is a fine-grained series level anatomical region</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>NUM</td><td>EV (131564, DCM, "Number of Series Related instances")</td><td>1</td><td>R+</td><td></td><td>UNITS = EV ({instances}, UCUM, "instances")<br>This value shall reflect the number of instances in the series of the study as referenced in the Current Requested Procedure Evidence Sequence (0040,A375).</td></tr>
  </tbody>
</table>

Within the Image Library Group container, each shared Instance shall be represented by a distinct invocation of the TID 1601 Image Library Entry Template. Within each TID 1601 invocation, the Template TID 1602 is included.

The TID 1602 "Image Library Entry Descriptors" Content Items shall be present as specified in Table 6.X.2.9-3: TID 1602 Image Library Entry Template for SR Document Content Module of Manifest.

<table class="madotable">
  <caption>Table 6.X.2.9-3: TID 1602 Image Library Entry Template for SR Document Content Module of Manifest</caption>
  <thead>
    <tr><th>Rel with Parent</th><th>VT</th><th>Concept Name</th><th>VM</th><th>Req Type</th><th>Condition</th><th>Addtl Value Set Constraint</th></tr>
  </thead>
  <tbody>
    <tr><td>HAS ACQ CONTEXT</td><td>NUM</td><td>EV (121140, DCM, "Number of Frames")</td><td>1</td><td>RC+</td><td>Required when the SOP Class is multiframe</td><td></td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>TEXT</td><td>EV (113609, DCM, "Instance Number")</td><td>1</td><td>RC+</td><td>Required when present in the referenced SOP Instance</td><td>The text string shall be consistent with the value of Instance Number (0020,0013) of the referenced instance (See Note).</td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>INCLUDE</td><td>DTID 1609 Image Library Entry Descriptors for Key Object Selection</td><td>1</td><td>RC+</td><td>Present if this instance is a KOS Object</td><td></td></tr>
  </tbody>
</table>

*Note: It is important to note that no instance ordering semantics may be assumed from:*

- *The ordering of Sequence Items in Referenced SOP Sequence (0008,1199),*
- *The ordering of SOP Instances in Content Items of the SR Document Module under template TID 2010,*
- *The ordering of SOP Instances in Content Items of the SR Document Module under template TID 1600*
- *The order in which DICOM instances are received by the Imaging Document Consumer.*

*Instance number(s), when present in the referenced SOP Instance of the imaging study manifest, offer a basic way to order images when displayed without actually having retrieved all instances to gain access to image orientation and image position attributes in the image headers.*

When a Key Object Selection instance is referenced, the TID 1609 "Image Library Entry Descriptors for Key Object Selection" Content Items shall be present as specified in Table 6.X.2.9-4: TID 1609 Key Object Reference Template for SR Document Content Module of Manifest.

The Content Items contain information from the referenced KOS instance that allows the user of any Imaging Document Consumer to determine:

- The presence of flagged significant images by a KOS instance (in a series of modality KO).
- If a KOS flagging significant images, is relevant using the KOS Title code and if present, an associated description. For each KOS selected as relevant, retrieve the KOS instance to identify the flagged images and retrieve them.

<table class="madotable">
  <caption>Table 6.X.2.9-4: TID 1609 Key Object Reference Template for SR Document Content Module of Manifest</caption>
  <thead>
    <tr><th>Rel with Parent</th><th>VT</th><th>Concept Name</th><th>VM</th><th>Req Type</th><th>Condition</th><th>Addtl Value Set Constraint</th></tr>
  </thead>
  <tbody>
    <tr><td>HAS ACQ CONTEXT</td><td>CODE</td><td>EV (121144, DCM, "Document Title")</td><td>1</td><td>R+</td><td></td><td></td></tr>
    <tr><td>HAS ACQ CONTEXT</td><td>TEXT</td><td>EV (113012, DCM, "Key Object Description")</td><td>1</td><td>RC+</td><td>Required when present in the referenced KOS instance</td><td></td></tr>
  </tbody>
</table>

The information allows retrieval of key images flagged as significant without first having to retrieve the list of KOS instances within the imaging study.

#### SOP Common Module

<table class="madotable">
  <caption>Table 6.X.2.10-1: Usage of DICOM Attributes in SOP Common Module</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.12-1 SOP Common Module</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Timezone Offset From UTC</td><td>(0008,0201)</td><td>R+</td><td>Contains the offset from UTC for the timezone in which the manifest was created. It applies to all DA and TM Attributes of the Manifest.</td></tr>
  </tbody>
</table>

#### Referenced Request Macro

<table class="madotable">
  <caption>Table 6.X.2.11-1: Usage of DICOM Attributes in Referenced Request Macro</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.17-3c Referenced Request Macro Attributes</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Study Instance UID</td><td>(0020,000D)</td><td>R+</td><td>Unique Identifier for the Study.<br>Copy of the referenced study's Study Instance UID (0020,000D).<br><em>Note: There is a 1 to 1 relationship between this KOS manifest and the study that this KOS manifest references.</em></td></tr>
    <tr><td>Accession Number</td><td>(0008,0050)</td><td>R+</td><td>A departmental IS generated number that identifies the imaging order for the Study. Shall contain a value associated with the Placer Order Number (0040,2016) in the sequence item.</td></tr>
    <tr><td>Issuer of Accession Number Sequence</td><td>(0008,0051)</td><td>R+</td><td>Identifier of the Assigning Authority that issued the Accession Number (0008,0050). A value shall be present.<br>Only a single Item shall be included in this Sequence.</td></tr>
    <tr><td colspan="4">&gt;Include Table 6.X.2.12-1 "HL7v2 Hierarchic Designator Macro Attributes" – see section 6.X.2.12 HL7v2 Hierarchic Designator Macro</td></tr>
    <tr><td>Placer Order Number / Imaging Service Request</td><td>(0040,2016)</td><td>R+</td><td>The order number assigned to the Imaging Service Request by the party placing the order.<br>Shall contain a value associated with the Accession Number (0008,0050) in the sequence item.</td></tr>
    <tr><td>Order Placer Identifier Sequence</td><td>(0040,0026)</td><td>RC+</td><td>Identifier of the Assigning Authority that issued the Placer Order Number (0040,2016).<br>Required if Placer Order Number / Imaging Service Request (0040,2016) is not empty.<br>Only a single Item shall be included in this Sequence.</td></tr>
    <tr><td colspan="4">&gt;Include Table 6.X.2.12-1 "HL7v2 Hierarchic Designator Macro Attributes" – see section 6.X.2.12 HL7v2 Hierarchic Designator Macro</td></tr>
  </tbody>
</table>

#### HL7v2 Hierarchic Designator Macro

<table class="madotable">
  <caption>Table 6.X.2.12-1: Usage of DICOM Attributes in HL7v2 Hierarchic Designator Macro</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table 10-17 HL7v2 Hierarchic Designator Macro Attributes</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Universal Entity ID</td><td>(0040,0032)</td><td>R+</td><td>Globally unique identifier for the Assigning Authority.</td></tr>
    <tr><td>Universal Entity ID Type</td><td>(0040,0033)</td><td>RC+</td><td>Standard defining the format of the Universal Entity ID.<br>(e.g., value: "ISO" for an OID format)<br>Required if Universal Entity ID (0010,0032) is present.</td></tr>
  </tbody>
</table>

#### Hierarchical SOP Instance Reference Macro

<table class="madotable">
  <caption>Table 6.X.2.13-1: Usage of DICOM Attributes in Hierarchical SOP Instance Reference Macro</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.17-3 Hierarchical SOP Instance Reference Macro Attributes</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Study Instance UID</td><td>(0020,000D)</td><td>R</td><td>Unique identifier for the Study.<br>Copy of the referenced study's Study Instance UID (0020,000D).<br><em>Note: There is a 1 to 1 relationship between this KOS manifest and the study that this KOS manifest references.</em></td></tr>
    <tr><td>Display URI</td><td>(0040,E012)</td><td>O+</td><td>URI specifying an access path to invoke a remote image display service for the Study (See the concepts described in section X.4.1.7 Launching a Remote Image Display).<br>Shall include the fully specified scheme, authority, path, and query components in accordance with [RFC3986]. The URI shall identify the Study to be displayed.<br><em>Note: The display invoked at this URI may or may not be able to display the entire Study, depending on what instances it has access to, but it is expected to at least be able to display the instance referenced by this Key Object instance.</em><br>There is no requirement that the URI remain usable for any specified period of time after the creation of this instance.</td></tr>
    <tr><td>Referenced Series Sequence</td><td>(0008,1115)</td><td>R</td><td>Sequence of Items where each item includes the Attributes of a Series containing referenced Composite Object(s)</td></tr>
    <tr><td colspan="4">&gt; Include Table 6.X.2.14-1: Usage of DICOM Attributes in Hierarchical Series Reference Macro - see section 6.X.2.14: Hierarchical Series Reference Macro</td></tr>
  </tbody>
</table>

#### Hierarchical Series Reference Macro

<table class="madotable">
  <caption>Table 6.X.2.14-1: Usage of DICOM Attributes in Hierarchical Series Reference Macro</caption>
  <thead>
    <tr><th colspan="4">Attributes from Table C.17-3a Hierarchical Series Reference Macro Attributes</th></tr>
    <tr><th>Attribute Name</th><th>Tag</th><th>IHE Usage</th><th>Attribute Description</th></tr>
  </thead>
  <tbody>
    <tr><td>Retrieve Location UID</td><td>(0040,E011)</td><td>R+</td><td>Unique identifier of the system where the Composite Object(s) may be retrieved on the network.<br>The value of this attribute is an OID that may be used as a reference to obtain the endpoint of the corresponding WADO-RS service returned as a Base URI (See concept section X.4.1.2 Intra-community sharing infrastructure).<br>WADO-RS retrieval URLs can be composed by the consumer using this Base URI and the study/series/instance UIDs from this manifest.</td></tr>
    <tr><td>Retrieve URL</td><td>(0008,1190)</td><td>O</td><td>URL specifying the location of the referenced Instance(s).<br>The value of this attribute is a Base URI representing the endpoint for the corresponding WADO-RS service (See concept section X.4.1.2 Intra-community sharing infrastructure).<br>WADO-RS retrieval URL can be composed by the consumer using this Base URI and the study/series/instance UIDs from this manifest.<br><em>Note: The definition of this Retrieve URL being a Base URI aligns with its use in the IHE XDS-I.b profile (DICOM Retrieve by WADO-RS option) and the IHE XC-WADO profile.</em></td></tr>
  </tbody>
</table>

### HL7 FHIR Based Imaging Study Manifest Content Definitions

This section specifies the structure and format of an Imaging Study Manifest using the HL7 FHIR standard. It is based on the FHIR R4 ImagingStudy resource and related FHIR R4 resources.

A Creator shall be able to create a FHIR-based Imaging Study Manifest as specified in the [FHIR Imaging Manifest](fhir-imaging-manifest.html) page.

A Consumer shall process the FHIR-based Imaging Study Manifest as specified in the [FHIR Imaging Manifest](fhir-imaging-manifest.html) page.

When shared with MHD, MHDS, or XDS.b document sharing profiles, the Imaging Study Manifest shall use the following Format Code.

<table class="madotable">
  <thead>
    <tr><th>Format Code</th><th>Coding Scheme</th><th>Description</th></tr>
  </thead>
  <tbody>
    <tr><td>urn:ihe:rad:MADO:fhir-manifest:2026</td><td>1.3.6.1.4.1.19376.1.2.7.1</td><td>MADO FHIR-based Imaging Study Manifest</td></tr>
  </tbody>
</table>

### MHD Envelope Content Definitions

This section specifies the format of a FHIR R4 DocumentReference resource used as an MHD envelope for a MADO Imaging Study Manifest.

A Creator grouped with an MHD Document Source shall be able to create an MHD Manifest Envelope as specified in the [Manifest Envelopes for IHE-MHD](manifest-envelope.html) page. The MHD Manifest Envelope applies to both the FHIR-based format or the DICOM KOS-based format (see Sections X.6.3 and X.6.2).

A Consumer grouped with an MHD Document Consumer shall be able to process an MHD Manifest Envelope as specified in the [Manifest Envelopes for IHE-MHD](manifest-envelope.html) page.

### DICOM – FHIR Format Mapping Specification

This section specifies the mapping between the content of the two Imaging Study Manifest formats defined in Sections 6.X.2 and 6.X.3.

Its use ensures that bridging between infrastructures that deploy different Imaging Study Manifest formats can be performed without semantic loss.

The mapping specification is available on the [Mappings between MADO FHIR and MADO DICOM KOS](mapping.html) page.

Support for this mapping is not a conformance requirement for actors in the MADO Profile. It is provided for actors that choose to optionally support such mappings.

### Imaging Study Manifest Search Metadata

A set of search parameters is defined in this section for the search of imaging study manifests. These functional requirements ensure a uniform access to imaging study manifest irrespective of the document sharing infrastructure used.

It is expected that the search Document Consumer Actors of the document sharing infrastructure grouped with MADO, will support these search parameters.

These parameters have been selected based on the experience with deployments of XDS-I.b and MHD (Comprehensive Metadata option). They are directly supported by the XDS.b, XDS-I.b, XCA, XCA-I, MHD and MHDS profiles. Any given query might use only a subset of these search parameters.

#### Generic Search Request Parameters

The following search request parameters are generic (not specific to imaging):

- Patient Business Identifier – patient id
- Period – the time of service. As a search parameter, it matches when the requested interval overlaps with the period or time of service.

  *Note: The time of service for an Imaging Manifest Doc is the Study Date and Time.*
- Document Creation Date/Time - date/time the imaging study manifest was created. This is intended to facilitate finding manifest published or revised after a certain date and time.
- Category – class of document (e.g., images or reports)
- Practice Setting – specialty where care was performed/provided (e.g., radiology, cardiology, surgery, endoscopy for imaging study manifest)

#### Imaging-Specific Search Request Parameters

The following search request parameters are specific to imaging:

- Modality
- Anatomical Region - body part
- Study Instance UID
- Accession Number (include Issuer of Accession Number to ensure uniqueness)
- Placer Order Number

#### Return Response Parameters

For each matching entry, a response will be returned to the consumer. It is expected that this response contains not only the values of the search parameters conveyed by the query request, but the complete list of values for all supported search parameters, plus some additional parameters that are returned. These returned parameter values may be used by the Health Professional or an application to select any relevant imaging study manifest of interest which can then be retrieved through the document sharing infrastructure. The list of returned parameters are:

- Repository Location Unique Identifier - The document repository from which the document can be retrieved.
- Document Identifier
- Document Creation Date/Time
- Document Type
- Document Format
- Document Mime Type
- Document Author(s)
- Document Organization Name and ID
- Document Category (high-level type)
- Practice Setting (high-level specialty)
- Order identifier(s)
- Procedure code(s)
- Modality type(s)
- Anatomical Regions (high-level value set)
- Study Instance UID
- Accession Number(s) (include Issuer of Accession Number to ensure uniqueness)
- Placer Order Number(s)

#### Anatomical Region Value Set

The Anatomical Region Value Set is defined as a short set of anatomical region values optimized for use as a search parameter, to facilitate a coarse grain filtering among large numbers of imaging studies, performed across a wide range of treatment specialties and imaging modalities. Coarse grain filtering on anatomical regions needs to rely on a short classification set, meaning:

- Typically, only one or two values, rarely more, are needed to identify, at a high-level, the anatomies associated with most imaging procedures, thus making the mapping of imaging procedure to such high-level anatomy easy and simple to check for correctness when deployed across many sites.
- When expressing a query filter, one should avoid a long pull-down menu of 20, 30 or more values to be presented to the Health Professional to scroll through, to set the filter in a query.
- Deploying such a shared short set is simple even with large numbers of local imaging procedures (point 1 above) and it lends itself to a robust selection process (point 2 above) by the requester, resulting in avoiding false negative query matches

Example of mapping process: A possible way to select the right value(s) of anatomical regions is to automate the mapping at the time the imaging order is processed by the imaging department:

1. Today, it is typical that when processing incoming clinical orders, one or more imaging procedure request(s) are created with a corresponding imaging procedure code selected. Such an imaging procedure code comes from a value set (typically around a thousand values) that may be locally defined or nationally standardized, based on ad-hoc or international terminologies.
2. This variety of terminologies used for imaging procedure codes is not a barrier to define a mapping for each imaging procedure codes used locally to one or more anatomical region(s) from the high-level Anatomical Regions and Systems value set defined in Table 6.X.6.4-1: CID IHE-MADO1 High-Level Anatomic Regions and Systems.
3. This process could be automated by the order processing application at the departmental level. The imaging modalities may continue to manage anatomical codes as they do today.

<table class="madotable">
  <caption>Table 6.X.6.4-1: CID IHE-MADO1 High-Level Anatomic Regions and Systems</caption>
  <tbody>
    <tr><th>Type:</th><td>Extensible</td></tr>
    <tr><th>FHIR Keyword:</th><td>IHE-MADO1-HighLevelAnatomicRegionsAndSystems</td></tr>
    <tr><th>Keyword:</th><td>HighLevelAnatomicRegionsAndSystems</td></tr>
    <tr><th>Version:</th><td>20260227</td></tr>
    <tr><th>UID:</th><td>1.3.6.1.4.1.19376.1.1.86.1</td></tr>
    <tr><th>Context Group ID:</th><td>CID IHE-MADO1</td></tr>
  </tbody>
</table>

<table class="madotable">
  <thead>
    <tr><th>Coding Scheme Designator</th><th>Code Value</th><th>Code Meaning</th><th>Corresponding DICOM Body Part Examined</th></tr>
  </thead>
  <tbody>
    <tr><td>SCT</td><td>63337009</td><td>Lower trunk</td><td>LOWERTRUNK</td></tr>
    <tr><td>SCT</td><td>38266002</td><td>Entire body</td><td>WHOLEBODY</td></tr>
    <tr><td>SCT</td><td>53120007</td><td>Upper limb</td><td>UPPERLIMB</td></tr>
    <tr><td>SCT</td><td>61685007</td><td>Lower limb</td><td>LOWERLIMB</td></tr>
    <tr><td>SCT</td><td>67734004</td><td>Upper trunk</td><td>UPPERTRUNK</td></tr>
    <tr><td>SCT</td><td>774007</td><td>Head and neck</td><td>HEADNECK</td></tr>
    <tr><td>SCT</td><td>113257007</td><td>Cardiovascular system</td><td>CARDIOVASCSYS</td></tr>
    <tr><td>SCT</td><td>80891009</td><td>Heart</td><td>HEART</td></tr>
    <tr><td>SCT</td><td>76752008</td><td>Breast</td><td>BREAST</td></tr>
    <tr><td>SCT</td><td>1141981001</td><td>Vertebral Column</td><td>SPINE</td></tr>
  </tbody>
</table>

*Note: The above codes and associated definitions are an extract from DICOM CID-4031, except (1141981001, SCT, "Vertebral Column") which is defined as a region in SNOMED CT replaces (421060004, SCT, "Spine") which technically only covers the bony structure of the spine. The DICOM Body Part Examined retains the value of SPINE because it is common usage.*
