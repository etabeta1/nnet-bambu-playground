# NNET Bambu Playground

Repository used to test nnet implenentation compatibility against Bambu.

## Installation

    git clone --recursive https://github.com/etabeta1/nnet-bambu-playground

## Usage

1. Place in `firmwares/` all the `firmware` folders produced by HLS4ML, renaming them accordingly
2. Modify nnet library in `nnet_utils/`
3. Compile all the firmwares with using the modified nnet library with `make` or specify a single target using `make TARGET=<firmware name>` (firmware names are the names of the folder as in point 1)

As an example, the `firmwares/` tree should look like this:

    firmwares/
      MaxPooling1D/
        nnet_utils/
          ...
        myproject.cpp
        ...
      AvgPooling1D/
        nnet_utils/
          ...
        myproject.cpp
        ...
      ...

## TODOs

- make automated simulations, maybe with testbenches
