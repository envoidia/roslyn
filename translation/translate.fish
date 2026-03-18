#!/usr/bin/env fish

set -l prev_lang "en"
set -l keywords $(cat keywords.txt)
set -l translated_keywords

for i in $(seq 1 $(count $keywords))
    set -l langs "ja" "ko" "pt" "zh" "ar" "tr" "tk" "ru" "nl" "az" "en"
    set -l translation "$keywords[$i]"
    set -l prev_translation "$translation"

    for lang in $langs
        set translation $(translate-cli -f $prev_lang -t $lang $prev_translation -o)
        echo "$prev_lang -> $lang: $prev_translation -> $translation"
        set prev_lang "$lang"
        set prev_translation "$translation"
    end

    set -a translated_keywords "$translation"
    echo "$keywords[$i] -> $translated_keywords[$i]"
end

printf '%s\n' $translated_keywords > translated_keywords.txt
notify-send translate.fish done!