#!/bin/bash
set -e  # Exit on error

# If you haven't downloaded and extracted the LibriSpeech dataset start from stage 0
# and specify storage_dir (only)
# Main storage directory. You'll need disk space to store LibriSpeech and LibriMix
storage_dir=

# If you have downloaded and extracted the LibriSpeech dataset (stage 0) start from stage 1
# and specify both librispeech_dir and storage_dir.
# Directory where LibriSpeech is stored.
librispeech_dir=

# If you have generated LibriMix metadata (stage 1) but you haven't generated the dataset start from stage 2
# and specify  librispeech_dir, metadata_dir (where LibriMix metadata are) and librimix_outdir where the dataset will
# be stored
metadata_dir=
librimix_outdir=

# After running the recipe a first time, you can run it from stage 3 directly to train new models.

# Path to the python you'll use for the experiment. Defaults to the current python
# You can run ./utils/prepare_python_env.sh to create a suitable python environment, paste the output here.
#python_path=${storage_dir}/asteroid_conda/miniconda3/bin/python
python_path=python

stage=0  # Controls from which stage to start

. utils/parse_options.sh

# Example usage
# ./run.sh --stage 0 storage_dir /home
echo $stage
if [[ $stage -le  0 ]]; then
	echo "Stage 0: Downloading LibriSpeech"
  . local/prepare_data.sh --storage_dir $storage_dir
	librispeech_dir=$storage_dir/LibriSpeech
fi

if [[ $stage -le  1 ]]; then
	$python_path -m pip install pyloudnorm
	echo "Stage 1: Generating metadata "
	$python_path local/create_librispeech_metadata.py --librispeech_dir $librispeech_dir
  $python_path local/create_librimix_metadata.py --librispeech_dir $librispeech_dir \
  --n_src 2
fi

if [[ -z ${metadata_dir} ]]; then
	metadata_dir=$librispeech_dir/../LibriMix/metadata
fi
if [[ -z ${librimix_outdir} ]]; then
	librimix_outdir=$librispeech_dir/../LibriMix/
fi


if [[ $stage -le  2 ]]; then
	echo "Stage 2: Generating Librimix dataset"
  $python_path local/create_librimix_from_metadata.py \
  --librispeech_dir $librispeech_dir \
  --metadata_dir $metadata_dir \
  --librimix_outdir $librimix_outdir \
  --n_src 2 \
  --freqs 8k \
  --modes min
fi
