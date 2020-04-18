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
 * The type of mixture : mix_clean (only speech) mix_both(speech + noise)
 mix_single (1 speaker + 1 noise)
 
### Installation 

To generate the dataset we recommend 

