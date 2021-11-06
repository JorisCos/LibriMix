#!/bin/bash
set -eu  # Exit on error

n_src=$1
storage_dir=$2
librispeech_dir=$storage_dir/LibriSpeech
wham_dir=$storage_dir/wham_noise
librispeech_md_dir=$librispeech_dir/metadata
metadata_dir=./metadata  # Assuming you run this script from the LibriMix root dir.
wham_md_dir=.$metadata_dir/Wham_noise
metadata_outdir=$metadata_dir/Libri$n_src"Mix"

python scripts/create_librimix_metadata.py --librispeech_dir $librispeech_dir \
  --librispeech_md_dir $librispeech_md_dir \
  --wham_dir $wham_dir \
  --wham_md_dir $wham_md_dir \
  --metadata_outdir $metadata_outdir \
  --n_src $n_src \
