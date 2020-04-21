### About the dataset
LibriMix is an open source dataset for source separation in noisy 
environments. It is derived from LibriSpeech signals (clean subset) 
and WHAM noise. It offers a free alternative to the WHAM dataset 
and complements it. It will also enable cross-dataset experiments.

### Generating LibriMix
To generate LibriMix, clone the repo and run the main script : 
[`generate_librimix.sh`](./generate_librimix.sh)

```
git clone https://github.com/JorisCos/LibriMix
cd LibriMix 
./generate_librimix.sh storage_dir n_src
```
You can either change `storage_dir` and `n_src` by hand in 
the script or use the command line.  
By default, LibriMix will be generated at both 16Khz and 8kHz, for
min max modes, and all mixture types will be saved (mix_clean, 
mix_both and mix_single). This represents around **430GB** 
of data for Libri2Mix. Please refer to 
[this section](#Features) if you want to generate less data.


### Features
In LibriMix you can choose :
* The number of sources in the mixtures.
* The sample rate  of the dataset from 16 KHz to any frequency below. 
* The mode of mixtures : min (the mixture ends when the shortest source
 ends) or max (the mixtures ends with the longest source)
 * The type of mixture : mix_clean (two speakers) mix_both (two 
 speakers + noise) mix_single (1 speaker + noise)
 
### Note on scripts
For the sake of transparency, we have released the metadata generation 
scripts. However, we wish to avoid any changes to the dataset, 
especially to the test subset that shouldn't be changed under any 
circumstance.

