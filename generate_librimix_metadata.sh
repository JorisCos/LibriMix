#!/bin/bash
set -eu  # Exit on error

n_src=$1
storage_dir=$2
librispeech_dir=$storage_dir/LibriSpeech
wham_dir=$storage_dir/wham_noise
metadata_dir=./metadata
librispeech_md_dir=$metadata_dir/LibriSpeech
wham_md_dir=$metadata_dir/Wham_noise
metadata_outdir=$metadata_dir/Libri$n_src"Mix"

./download_librispeech_and_wham.sh $storage_dir

python scripts/create_librimix_metadata.py --librispeech_dir $librispeech_dir \
  --librispeech_md_dir $librispeech_md_dir \
  --wham_dir $wham_dir \
  --wham_md_dir $wham_md_dir \
  --metadata_outdir $metadata_outdir \
  --n_src $n_src \
