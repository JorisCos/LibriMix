### LibriMix version for many speakers
This is a version of the LibriMix dataset repository that is meant to be used when needing mixtures of many speakers.

This version of the dataset was used in the paper:

[Many-Speakers Single Channel Speech Separation with Optimal Permutation Training](https://arxiv.org/abs/2104.08955)

This is not an implementation of the method in the paper.

### About this version of the dataset
This version is a modified version of the original LibriMix dataset. 
It is used mainly to create LibriMix datasets with many speakers (more than 5), but can be used for any number of speakers.
**The original LibriMix dataset had issues making the data creation too slow or empirically stuck indefinitely for 10-15 speakers or more.** 

This version was used in our paper:

```
S. Dovrat, E. Nachmani, L. Wolf. Many-Speakers Single Channel Speech Separation with Optimal Permutation Training. Annual Conference of the International Speech Communication Association (INTERSPEECH), 2021.
```

To recreate the datasets used there, create your LibriMix datasets using this version.

Visit this 
[GitHub comparison between the two versions](https://github.com/JorisCos/LibriMix/compare/master...ShakedDovrat:master)
to see the exact changes we made in this version.

#### Instructions
To create datasets with 2 or 3 speakers, skip this stage.

To create datasets with more than 3 speakers, you need to create the metadata first.

Run
[`generate_librimix_metadata.sh`](./generate_librimix_metadata.sh) 
and then use the same instructions from the original LibriMix, stated bellow.

This script by the original LibriMix requires you to download Wham! noise dataset in addition to the LibriSpeech dataset, 
even though it is not used in our paper (we only use clean mixtures, without noise).

##### Altered generate_librimix.sh
We altered 
[`generate_librimix.sh`](./generate_librimix.sh)
a bit so it will only create the type of data we used in our paper:
8 Khz sampling, Min mode and clean mixtures. 
We also added `n_src` as an argument to the script.
See this [GitHub generate_librimix.sh comparison](https://github.com/JorisCos/LibriMix/compare/master...ShakedDovrat:master#diff-63659ddd8e646af67a84cb673856273e14852c030e9e34aaf500da71e7a80f2f)
to view the exact changes.

--------------------------------------------

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
./generate_librimix.sh n_src storage_dir
```

Make sure that SoX is installed on your machine.

For windows :
```
conda install -c groakat sox
```

For Linux :
```
conda install -c conda-forge sox
```

You can either change `storage_dir` and `n_src` by hand in 
the script or use the command line.  
By default, LibriMix will be generated for 2 and 3 speakers,
at both 16Khz and 8kHz, 
for min max modes, and all mixture types will be saved (mix_clean, 
mix_both and mix_single). This represents around **430GB** 
of data for Libri2Mix and **332GB** for Libri3Mix. 
You will also need to store LibriSpeech and wham_noise_augmented during
generation for an additional **30GB** and **50GB**.
Please refer to 
[this section](#Features) if you want to generate less data.
You will also find a detailed storage usage description in each metadata folder.


### Features
In LibriMix you can choose :
* The number of sources in the mixtures.
* The sample rate  of the dataset from 16 KHz to any frequency below. 
* The mode of mixtures : min (the mixture ends when the shortest source
 ends) or max (the mixtures ends with the longest source)
 * The type of mixture : mix_clean (utterances only) mix_both (utterances + noise) mix_single (1 utterance + noise)

You can customize the generation by editing ``` generate_librimix.sh ```.
 
### Note on scripts
For the sake of transparency, we have released the metadata generation 
scripts. However, we wish to avoid any changes to the dataset, 
especially to the test subset that shouldn't be changed under any 
circumstance.

### Why use LibriMix
More than just an open source dataset, LibriMix aims towards generalizable speech separation.
You can checkout section 3.3 of our paper [here](https://arxiv.org/pdf/2005.11262.pdf) for more details.

### Related work
If you wish to implement models based on LibriMix you can checkout 
[Asteroid](https://github.com/mpariente/asteroid) and the 
[recipe](https://github.com/mpariente/asteroid/tree/master/egs/librimix/ConvTasNet)
associated to LibriMix for reproducibility.

Along with LibriMix, SparseLibriMix a dataset aiming towards more realistic, conversation-like scenarios
has been released [here](https://github.com/popcornell/SparseLibriMix).

(contributors: [@JorisCos](https://github.com/JorisCos), [@mpariente](https://github.com/mpariente) and [@popcornell](https://github.com/popcornell) )

### Citing Librimix 

```BibTex
@misc{cosentino2020librimix,
    title={LibriMix: An Open-Source Dataset for Generalizable Speech Separation},
    author={Joris Cosentino and Manuel Pariente and Samuele Cornell and Antoine Deleforge and Emmanuel Vincent},
    year={2020},
    eprint={2005.11262},
    archivePrefix={arXiv},
    primaryClass={eess.AS}
}
```
