CC=gcc
CFLAGS=-std=c99 -Wall -O3 -Wno-unused -g $(shell pkg-config fftw3 fftw3f --cflags) # -DDEBUG
LDFLAGS=-lm $(shell pkg-config fftw3 fftw3f --libs) -lz -lpthread 
LDFLAGS_EXTRA = -lnetcdf

.SECONDEXPANSION:
%.o: $$(basename $$*).c
	$(CC) $(CFLAGS) $(INCFOLDER) $(DEFINES) -c $< -o $@

dctz-ec-test: dctz-test.c dctz-comp-lib.c dctz-decomp-lib.c binning.c util.c dct.c dct-float.c
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) -DUSE_TRUNCATE

dctz-qt-test: dctz-test.c dctz-comp-lib.c dctz-decomp-lib.c binning.c util.c dct.c dct-float.c 

	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) -DUSE_TRUNCATE -DUSE_QTABLE

.PHONY: all
.DEFAULT_GOAL:=all

all:	dctz-ec-test dctz-qt-test 


clean:
	rm -f *~ *.o dctz-ec-test dctz-qt-test
