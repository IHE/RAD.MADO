Andries,

Thank you for your input. If you want to capture the content of an ImagingStudy within a Composition, then this is certainly not a bad option for doing so.

Before moving in that direction, we first need to take a step back and decide whether this is what we actually want. From the perspective that everything is a document, and that therefore a Bundle.type = document is required, I understand this approach.

We discussed something similar during the WGM, where the main resource was DiagnosticReport. The guidance given in that discussion is that DiagnosticReport does not have the header fields Composition has, so it is not a replacement. So document Bundles with only a DiagnosticReport need to have a placeholder Composition that has those fields. This placeholder would then (from the Narrative) point to the DiagnosticReport and possibly to the rendered form contained in it.

The same guidance could be used for MADO as well, where a placeholder Composition presents the document header fields. If we choose to go in that direction, we have multiple options:
1. Minimalistic - We could then include a rendered overview of the imaging-study data in Composition.meta.text and leave the sections empty
2. Define a section structure (as you propose) that reflects the contents of the ImagingStudy. This might include including rendered content of the ImagingStudy in this description.

I find this an intriguing option that might very well add a lot of value.

If we choose to move in this direction, we do need to address and another related topic. Such a move will make the FHIR manifest easier to render and understand and potentially richer in content that its KOS counterpart. This will make translation difficult. Is this an issue? Does this block including the option or something that we can live with.

**===> Not an issue if it is fully specified - one can mechanically produce it.**

I do not have a clear preference, but we need to make a this a choice taking that viewpoint into account as well. We could also decide on allowing both document and collection. Indicate that in the of document, a Composition is required and its Narrative must reflect the content of the study. State that we will explore in future versions of this specification what the structure and content of this Composition will be.

Bas

1. Not do now - discuss for next release
2. Allow it now - minimally specify and add note further work will be here
	header field
	minimal 
		- has to reflect the content of the resources in the bundle.
		- alternatively - SHALL render these 5 points (Charles)
		- alternatively - SHALL render the required fields (Andries)
3. Allow it now - fully specify

----
time window - before DICOM CP closure (June 15)
----
advantage - all FHIR thingies exchanged are FHIR documents so can be treated/rendered in the same way.
----
Agreement to go in this direction with the following comments:
- done before Jun 15th
- represents study info (i mean i don't want the individual instances to be displayed, just the info on the series level)
-------

----------------------------

What needs to be done:
1. Create description of what the content (sections, narrative will be)
2. Determine the content of the Composition header fields (status, type, category, subject, date, author, title, attester, custodian, relatesTo, event)
3. Decide whether Composition.author will make Provenance obsolete -> Yes
4. Create profile and update spec text.

Comp.text
    study level info (include author, patient, ...)
    overall modalities
    anatomical region
    accession number
Comp.section (optional) on the webviewer
Comp.section on the study - listing the series
    optional - section per series

work with the mandated fields (leave out requirements on the optional ones)

----

field defineitions:
* Study Date and Time
* Patient ID, Patient Name, Study Date Time, Modality in Studies, Anatomical regions, Number of Series in Study.
* Patient ID, Patient Name, Study Date Time, Modality in Studies, Anatomical regions, Number of Series in Study, Institution Name.
 