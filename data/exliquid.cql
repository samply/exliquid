library Retrieve
using FHIR version '4.0.0'
include FHIRHelpers version '4.0.0'

codesystem SampleMaterialType: 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType'

context Patient

define InInitialPopulation:
  exists
    from [Specimen] S
    where S.identifier.system contains 'https://dktk.dkfz.de/fhir/NamingSystem/exliquid-specimen'

define Diagnosis:
  First(from [Condition] C
    return C.code.coding.where(system = 'http://fhir.de/CodeSystem/dimdi/icd-10-gm').code.first())

define SampleType:
  First(from [Specimen] S
    return S.type.coding.where(system = 'https://fhir.bbmri.de/CodeSystem/SampleMaterialType').code.first())

define PlasmaDiagnosis:
  if exists [Specimen: Code 'blood-plasma' from SampleMaterialType] then Diagnosis else null

define PbmcDiagnosis:
  if exists [Specimen: Code 'peripheral-blood-cells-vital' from SampleMaterialType] then Diagnosis else null
