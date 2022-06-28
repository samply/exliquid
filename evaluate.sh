#!/bin/sh

BASE="http://localhost:8080/fhir"

curl -s "$BASE/Measure/exliquid/\$evaluate-measure?periodStart=1900&periodEnd=2100"
