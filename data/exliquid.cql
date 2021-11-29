library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

context Specimen

define InInitialPopulation:
  exists
    from Specimen.extension E
    where E.url = 'https://fhir.bbmri.de/StructureDefinition/Custodian'
      and (E.value as Reference).reference = 'Organization/exliquid'

define Patient:
  singleton from ([Patient])

define Diagnosis:
  First(from [Patient -> Condition] C
    return C.code.coding.where(system = 'http://fhir.de/CodeSystem/dimdi/icd-10-gm').code.first())

define SampleType:
  First(from Specimen.type.coding C
    where C.system = 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'
    return C.code)
