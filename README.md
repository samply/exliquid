# EXLIQUID Dashboard Prototype

## Usage

From the project directory:

* start Blaze with `docker compose up`
* import data with `blazectl upload --server http://localhost:8080/fhir -c1 data` 
* evaluate the measure with the dashboard table as result with `./evaluate.sh`

The table will output as CSV and should look like this:

| Diagnosis | Sample Type | Count |
|:----------|:------------|------:|
| C34.9 | blood-plasma                 | 2 |
| C34.9 | peripheral-blood-cells-vital | 1 |
| C50.9 | blood-plasma                 | 2 |
| C50.9 | peripheral-blood-cells-vital | 2 |

## Relevant Data

### Diagnoses

| Name | Code |
|:-----|:-----|
| Lung | C34.9 |
| Breast | C50.9 |
| Colorectal | C18.9 |
| Brain | |
| Skin | |

### Sample Types

| Code |
|:-----|
| blood-plasma |
| peripheral-blood-cells-vital |
