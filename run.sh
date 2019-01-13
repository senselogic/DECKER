#!/bin/sh
set -x
cd TEST

../decker --output_folder "SPANISH_VERBS/" --dump --verbose "spanish_verbs.apkg"
read key

../decker --output_folder "SPANISH_VOCABULARY/" --dump --verbose "spanish_vocabulary.apkg"
read key

../decker --output_folder "VOCABULAIRE_ESPAGNOL/" --dump --verbose "vocabulaire_espagnol.apkg"
read key

../decker --input_format "<img src=\"{{front_image}}\">§{{front_word}}<br/><i>{{back_word}}</i>" --output_folder "SPANISH_VOCABULARY/" --trim --dump --verbose "spanish_vocabulary.apkg"
read key

../decker --input_folder "<img src=\"{{front_image}}\">§{{front_word}}<br/><i>{{back_word}}</i>" --output_folder "SPANISH_VOCABULARY/" --trim --dump "spanish_vocabulary.apkg" "spanish_vocabulary.lxf"
hexdump -C spanish_vocabulary.lxf > SPANISH_VOCABULARY/dump_lexilize_hexa.txt
cat spanish_vocabulary.lxf | ~/data/WORK/TOOL/PROTOC/bin/protoc --decode_raw >SPANISH_VOCABULARY/dump_lexilize_proto.txt
read key

../decker --input_format "<img src=\"{{front_image}}\">§{{front_word}}<br/><i>{{back_word}}</i>" --output_folder "SPANISH_VOCABULARY/" --output_format "{{front_word}}|{{back_word}}|{{front_image}}" --trim --dump "spanish_vocabulary.apkg" "spanish_vocabulary.csv"
read key

../decker --input_folder "SPANISH_VOCABULARY/" --input_format "{{front_word}}|{{back_word}}|{{front_image}}" --output_folder "SPANISH_VOCABULARY/" --trim --dump "spanish_vocabulary.csv" "spanish_vocabulary.lxf"
hexdump -C spanish_vocabulary.lxf > SPANISH_VOCABULARY/dump_lexilize_hexa.txt
cat spanish_vocabulary.lxf | ~/data/WORK/TOOL/PROTOC/bin/protoc --decode_raw >SPANISH_VOCABULARY/dump_lexilize_proto.txt
read key
