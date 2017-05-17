## Synopsis

The goal of this project is to use Machine Learning to transform police sketches to realistic images.

## Motivation

The overall motivation is to help the police better identify and catch the bad guys faster.

## Requirements
* [imagemagick] (https://imagemagick.org/script/index.php) 

## Creating Datasets
1. Create a folder in `sketch2pix/dataset`
	*	ie. `face-edge-1`
2. Within that folder create 3 folders `edge`, `face`, `face2edge`
3. Within each of those 3 folders create 2 folders `test`, `train`
4. Put your output images in the `face` folder and split them however you want into the `test` and `train` folders. It's recommended you train on 70% of your images and test the other 30%
5. Use the `convert.sh` script to generate the edge versions (aka inputs) of your `face` images
	* in the `sketch2pix/dataset` run `./convert.sh --path faces-edge1 --edge 1`
6. Use the `combine.sh` script to generate the combination images needed for pix2pix to train and test


## Training Model
```bash
DATA_ROOT=/path/to/data/ name=expt_name which_direction=AtoB th train.lua
```
Switch `AtoB` to `BtoA` to train translation in opposite direction.

Models are saved to `./checkpoints/expt_name` (can be changed by passing `checkpoint_dir=your_dir` in train.lua).

See `opt` in train.lua for additional training options.

## Testing Model
```bash
DATA_ROOT=/path/to/data/ name=expt_name which_direction=AtoB phase=val th test.lua
```

This will run the model named `expt_name` in direction `AtoB` on all images in `/path/to/data/val`.

Result images, and a webpage to view them, are saved to `./results/expt_name` (can be changed by passing `results_dir=your_dir` in test.lua).

See `opt` in test.lua for additional testing options.

## Acknowledgements

* [pix2pix](https://github.com/phillipi/pix2pix)

## Contributors

**User1m**

## License

MIT