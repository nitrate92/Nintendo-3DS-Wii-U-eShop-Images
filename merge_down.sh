#!/bin/bash

# <3 MSYS2

declare -a folders_process=("ctr" "ctr/Old" "wup")
for folder in "${folders_process[@]}"; do

	# Make sure we can process the "Old" folder properly
	if [[ $folder =~ "ctr" ]]; then
		site_sub="ctr"
	else
		site_sub=$folder
	fi

	if [[ ! -d "$(pwd)/$folder/kanzashi-$site_sub.cdn.nintendo.net/i" ]]; then
		mkdir -p "$(pwd)/$folder/kanzashi-$site_sub.cdn.nintendo.net/i"
	fi

	echo "Processing '$folder'"

	declare -a country_codes=("AE" "AG" "AI" "AR" "AT" "AU" "AW" "BB" "BE" "BG" "BO" "BR" "BS" "BZ" "CA" "CH" "CL" "CO" "CR" "CY" "CZ" "DE" "DK" "DM" "DO" "EC" "EE" "ES" "FI" "FR" "GB" "GD" "GF" "GP" "GR" "GT" "GY" "HK" "HN" "HR" "HT" "IE" "IT" "JM" "JP" "KN" "KR" "KY" "LC" "LT" "LU" "LV" "MQ" "MS" "MT" "MX" "MY" "NI" "NL" "NO" "NZ" "PA" "PE" "PL" "PT" "PY" "RO" "RU" "SA" "SE" "SG" "SI" "SK" "SR" "SV" "TC" "TR" "TT" "TW" "US" "UY" "VC" "VE" "VG" "VI")

	for shit in "${country_codes[@]}"; do
		files_before="$(pwd)/$folder/$shit/kanzashi-$site_sub.cdn.nintendo.net/i"
		if [[ -d "$files_before" ]]; then
			printf "\tProcessing country '%s'\n" "$shit"
			rsync -a "$files_before" "$folder" && rm -r "$files_before"
		else
			printf "\tNo data found for country '%s'!\n" "$shit"
		fi
	done

	archive="$(pwd)/$folder/kanzashi-$site_sub.cdn.nintendo.net.tar.gz"
	archive_src="$(pwd)/$folder/kanzashi-$site_sub.cdn.nintendo.net"
	printf "\tCreating '%s'\n" "$archive"
	if [[ -n "$(ls -A "$archive_src/i")" ]]; then
		tar -czf "$archive" -C "$archive_src" "$(ls -A "$archive_src")"
	fi
	# Unused in favor of gitignore:
	# rm -r "$archive_src"
done

echo "All done!"
exit 0
