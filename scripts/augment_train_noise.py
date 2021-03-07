import os
import argparse
import soundfile as sf
import glob
import tqdm.contrib.concurrent
import functools
from pysndfx import AudioEffectsChain

# Command line arguments
parser = argparse.ArgumentParser()
parser.add_argument('--wham_dir', type=str, required=True,
                    help='Path to wham_noise root directory')


def main(args):
    wham_noise_dir = args.wham_dir
    # Get train dir
    subdir = os.path.join(wham_noise_dir, 'tr')
    # List files in that dir
    sound_paths = glob.glob(os.path.join(subdir, '**/*.wav'),
                            recursive=True)
    print(f'Augmenting {subdir} files')
    # Transform audio speed
    augment_noise(sound_paths, 0.8)
    augment_noise(sound_paths, 1.2)


def augment_noise(sound_paths, speed):
    print(f"Change speed with factor {speed}")
    tqdm.contrib.concurrent.process_map(
        functools.partial(apply_fx, speed=speed),
        sound_paths,
        chunksize=10
    )


def apply_fx(sound_path, speed):
    # Get the effect
    fx = (AudioEffectsChain().speed(speed))
    s, rate = sf.read(sound_path)
    if len(s.shape) > 1:
        # Get 1st channel
        s = s[:, 0]
    # Apply effect
    s = fx(s)
    # Write the file
    sf.write(f"""{sound_path.replace(
        '.wav',f"sp{str(speed).replace('.','')}" +'.wav')}""", s, rate)


if __name__ == "__main__":
    args = parser.parse_args()
    main(args)
