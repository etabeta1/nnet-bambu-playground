#include <iostream>

#include "myproject.h"
#include "parameters.h"


void myproject(
    input_t input_layer_2[4*4*1],
    result_t layer2_out[2*2*1]
) {

    // hls-fpga-machine-learning insert IO
    #pragma HLS ARRAY_RESHAPE variable=input_layer_2 complete dim=0
    #pragma HLS ARRAY_PARTITION variable=layer2_out complete dim=0
    #pragma HLS INTERFACE ap_vld port=input_layer_2,layer2_out 
    #pragma HLS PIPELINE

    // hls-fpga-machine-learning insert load weights
#ifndef __SYNTHESIS__
    static bool loaded_weights = false;
    if (!loaded_weights) {
        loaded_weights = true;    }
#endif
    // ****************************************
    // NETWORK INSTANTIATION
    // ****************************************

    // hls-fpga-machine-learning insert layers

    nnet::pooling2d_cl<input_t, result_t, config2>(input_layer_2, layer2_out); // max_pooling2d

}

