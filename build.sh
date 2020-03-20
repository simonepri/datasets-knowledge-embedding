#!/usr/bin/env bash

function download_edgelist_mapper() {
  if [ ! -d downloads/edgelist-mapper ]; then
    mkdir -p downloads
    git clone -q https://github.com/simonepri/edgelist-mapper downloads/edgelist-mapper
  fi
}

function compute_frequency() {
  env PYTHONPATH=downloads/edgelist-mapper/src \
    python3 -B -m main.bin.compute_frequency $1 -ef $2 -rf $3
}

function generate_mapping() {
  env PYTHONPATH=downloads/edgelist-mapper/src \
    python3 -B -m main.bin.generate_mapping -ef $1 -rf $2 -em $3 -rm $4
}

function map_edgelist() {
  env PYTHONPATH=downloads/edgelist-mapper/src \
    python3 -B -m main.bin.map_edgelist $1 -em $2 -rm $3 -me $4
}

function run() {
  in_test=$1
  in_valid=$2
  in_train=$3
  out_folder=$4

  mkdir -p $out_folder

  edges_text_all="$out_folder/edges_as_text_all.tsv"
  edges_text_train="$out_folder/edges_as_text_train.tsv"
  edges_text_valid="$out_folder/edges_as_text_valid.tsv"
  edges_text_test="$out_folder/edges_as_text_test.tsv"

  edges_id_all="$out_folder/edges_as_id_all.tsv"
  edges_id_train="$out_folder/edges_as_id_train.tsv"
  edges_id_valid="$out_folder/edges_as_id_valid.tsv"
  edges_id_test="$out_folder/edges_as_id_test.tsv"

  freq_ent_all="$out_folder/frequency_entities_all.tsv"
  freq_ent_train="$out_folder/frequency_entities_train.tsv"
  freq_ent_valid="$out_folder/frequency_entities_valid.tsv"
  freq_ent_test="$out_folder/frequency_entities_test.tsv"

  freq_rel_all="$out_folder/frequency_relations_all.tsv"
  freq_rel_train="$out_folder/frequency_relations_train.tsv"
  freq_rel_valid="$out_folder/frequency_relations_valid.tsv"
  freq_rel_test="$out_folder/frequency_relations_test.tsv"

  map_ent="$out_folder/map_entity_id_to_text.tsv"
  map_rel="$out_folder/map_relation_id_to_text.tsv"

  mv $in_train $edges_text_train
  mv $in_valid $edges_text_valid
  mv $in_test $edges_text_test

  cat $edges_text_train $edges_text_valid $edges_text_test >> $edges_text_all

  download_edgelist_mapper

  compute_frequency $edges_text_all $freq_ent_all $freq_rel_all
  compute_frequency $edges_text_all $freq_ent_all $freq_rel_all
  compute_frequency $edges_text_train $freq_ent_train $freq_rel_train
  compute_frequency $edges_text_valid $freq_ent_valid $freq_rel_valid
  compute_frequency $edges_text_test $freq_ent_test $freq_rel_test

  generate_mapping $freq_ent_all $freq_rel_all $map_ent $map_rel

  map_edgelist $edges_text_all $map_ent $map_rel $edges_id_all
  map_edgelist $edges_text_train $map_ent $map_rel $edges_id_train
  map_edgelist $edges_text_valid $map_ent $map_rel $edges_id_valid
  map_edgelist $edges_text_test $map_ent $map_rel $edges_id_test
}

run "$@"
