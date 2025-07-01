#!/bin/bash

declare -a country_codes=("AE" "AG" "AI" "AR" "AT" "AU" "AW" "BB" "BE" "BG" "BO" "BR" "BS" "BZ" "CA" "CH" "CL" "CO" "CR" "CY" "CZ" "DE" "DK" "DM" "DO" "EC" "EE" "ES" "FI" "FR" "GB" "GD" "GF" "GP" "GR" "GT" "GY" "HK" "HN" "HR" "HT" "IE" "IT" "JM" "JP" "KN" "KR" "KY" "LC" "LT" "LU" "LV" "MQ" "MS" "MT" "MX" "MY" "NI" "NL" "NO" "NZ" "PA" "PE" "PL" "PT" "PY" "RO" "RU" "SA" "SE" "SG" "SI" "SK" "SR" "SV" "TC" "TR" "TT" "TW" "US" "UY" "VC" "VE" "VG" "VI")

for shit in "${country_codes[@]}"; do
	diff -q "titles${shit}.xml" "!Old/titles${shit}.xml"
done
