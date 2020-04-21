### About the dataset
LibriMix is an open source dataset for source separation. 
It's derived from LibriSpeech clean and WHAM noise. It's meant
to offer an alternative or at least a complement to WSJ0 dataset.

### Features
In LibriMix you can choose :
* The number of sources in the mixtures.
* The sample rate  of the dataset from 16 KHz to any frequency below. 
* The mode of mixtures : min (the mixture ends when the shortest source
 ends) or max (the mixtures ends with the longest source)
 * The type of mixture : mix_clean (only speech) mix_both (speech + 
 noise) mix_single (1 speaker + 1 noise)
 
By default, the dataset will be generated with 16Khz 8kHz 
frequencies, min and max modes and mix_clean mix_both mix_single 
types.
 
### How to use ?
Even if we have released the generation scripts, we wish to avoid 
any change to the dataset. Especially to the test subset that is 
meant for benchmarking.

### Installation 

To generate the dataset we recommend that you run the following 
commands (replacing `storage_dir` and `n_src` by elements of 
your choice)


```
git clone https://github.com/JorisCos/LibriMix.git storage_dir/LibriMix
cd storage_dir/LibriMix 
./generate_librimix.sh storage_dir n_src
```
