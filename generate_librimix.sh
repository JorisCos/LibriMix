#!/bin/bash
set -eu  # Exit on error

n_src=$1
storage_dir=$2
librispeech_dir=$storage_dir/LibriSpeech
wham_dir=$storage_dir/wham_noise
librimix_outdir=$storage_dir/

./download_librispeech_and_wham.sh $storage_dir

# Path to python
python_path=python

# If you wish to rerun this script in the future please comment this line out.
$python_path scripts/augment_train_noise.py --wham_dir $wham_dir


metadata_dir=metadata/Libri$n_src"Mix"
$python_path scripts/create_librimix_from_metadata.py --librispeech_dir $librispeech_dir \
  --wham_dir $wham_dir \
  --metadata_dir $metadata_dir \
  --librimix_outdir $librimix_outdir \
  --n_src $n_src \
  --freqs 8k \
  --modes min \
  --types mix_clean
