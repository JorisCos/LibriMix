#!/bin/bash
set -e  # Exit on error

storage_dir=$1
n_src=$2

echo "Download LibiSpeech/dev-clean into $storage_dir"
# If downloading stalls for more than 20s, relaunch from previous state.
wget -c --tries=0 --read-timeout=20 http://www.openslr.org/resources/12/dev-clean.tar.gz -P $storage_dir
tar -xzf $storage_dir/dev-clean.tar.gz -C $storage_dir
rm -rf $storage_dir/dev-clean.tar.gz

echo "Download LibiSpeech/test-clean into $storage_dir"
# If downloading stalls for more than 20s, relaunch from previous state.
wget -c --tries=0 --read-timeout=20 http://www.openslr.org/resources/12/test-clean.tar.gz -P $storage_dir
tar -xzf $storage_dir/test-clean.tar.gz -C $storage_dir
rm -rf $storage_dir/test-clean.tar.gz

echo "Download LibiSpeech/train-clean-100 into $storage_dir"
# If downloading stalls for more than 20s, relaunch from previous state.
wget -c --tries=0 --read-timeout=20 http://www.openslr.org/resources/12/train-clean-100.tar.gz -P $storage_dir
tar -xzf $storage_dir/train-clean-100.tar.gz -C $storage_dir
rm -rf $storage_dir/train-clean-100.tar.gz

echo "Download LibiSpeech/train-clean-360 into $storage_dir"
# If downloading stalls for more than 20s, relaunch from previous state.
wget -c --tries=0 --read-timeout=20 http://www.openslr.org/resources/12/train-clean-360.tar.gz -P $storage_dir
tar -xzf $storage_dir/train-clean-360.tar.gz -C $storage_dir
rm -rf $storage_dir/train-clean-360.tar.gz

echo "Download wham_noise into $storage_dir"
# If downloading stalls for more than 20s, relaunch from previous state.
wget -c --tries=0 --read-timeout=20 https://storage.googleapis.com/whisper-public/wham_noise.zip -P $storage_dir
unzip -qn $storage_dir/wham_noise.zip -d $storage_dir
rm -rf $storage_dir/wham_noise.zip

librispeech_dir=$storage_dir/LibriSpeech
wham_dir=$storage_dir/wham_noise
metadata_dir=metadata/LibriMix
librimix_outdir=$storage_dir/Libri$n_src"Mix"


python scripts/augment_train_noise.py --wham_dir $wham_dir
python scripts/create_librimix_from_metadata.py --librispeech_dir $librispeech_dir \
  --wham_dir $wham_dir \
  --metadata_dir $metadata_dir \
  --librimix_outdir $librimix_outdir \
  --n_src $n_src \
  --freqs 8k 16k \
  --modes min max \
  --types mix_clean mix_both mix_single
