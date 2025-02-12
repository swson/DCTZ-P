## DCTZ

DCTZ is a lossy compression software for numeric datasets in double (or single) precision. It is based on a block decomposition mechanism combined with well-known discrete cosine transformation (DCT) on floating-point datasets. It also uses an adaptive quantization with two specific task-oriented quantizers: guaranteed user-defined error bounds and higher compression ratios. DCTZ is written in C and is an implementation of the overall idea described in the following paper.

````
Jialing Zhang, Xiaoyan Zhuo, Aekyeung Moon, Hang Liu, Seung Woo Son
"Efficient Encoding and Reconstruction of HPC Datasets for Checkpoint/Restart"
International Conference on Massive Storage Systems and Technology (MSST), May 2019.
````
BibTeX citation entry:
````
@INPROCEEDINGS{DCTZ-MSST19,  
  author    = {Zhang, Jialing and Zhuo, Xiaoyan and Moon, Aekyeung and Liu, Hang and Son, Seung Woo},  
  booktitle = {2019 35th Symposium on Mass Storage Systems and Technologies (MSST)},   
  title     = {{Efficient Encoding and Reconstruction of HPC Datasets for Checkpoint/Restart}},   
  year      = {2019},  
  pages     = {79-91},  
  doi       = {10.1109/MSST.2019.00-14}
}
````

## Depencencies

DCTZ requires the following libraries to build:
- [FFTW](http://www.fftw.org/): DCT (including inverse DCT) routines in DCTZ are currently based on Fourier transform (DFT) routines in FFTW.
  - When you install FFTW from the source, enable single-precision during configuration using `--enable-float` separately:
  ````
  $ wget http://www.fftw.org/fftw-3.3.10.tar.gz
  $ tar -zxvf fftw-3.3.10.tar.gz
  $ cd fftw-3.3.10
  $ ./configure  ### this will configure double-precision library
  $ make 
  $ make install  ## this line requires sudo
  $ make clean && ./configure --enable-float   ## this will configure single-precision library
  $ make
  $ make install  ## this line requires sudo
  ````
  - If you want to install FFTW3 on Linux, run the following:
  ````
   On Ubuntu:
   $ sudo apt-get update -y
   $ sudo apt-get install libfftw3-dev libfftw3-doc -y
  
   On RHEL:
   $ sudo yum install fftw-devel -y
  ````
- [zlib](https://www.zlib.net/): compressing bin indices and AC coefficients that need to be saved as it is.

## Building 
Retrieve the source code of DCTZ by either git cloning (shown below) or downloading.
````
$ git clone https://github.com/swson/DCTZ
````

Then, make:
```
$ cd DCTZ
$ make
```

The above command will generate `dctz-ec-test` and `dctz-qt-test`. 


## Testing

To test the compiled DCTZ is working properly, download the test datasets from [here](https://sites.uml.edu/seungwoo-son/files/2019/07/dctz-test-data.zip) and run the following command:
````
$ cd tests
$ wget https://sites.uml.edu/seungwoo-son/files/2019/07/dctz-test-data.zip
$ unzip dctz-test-data.zip
$ ./test-dctz.sh
````
