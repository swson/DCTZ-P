CC=gcc
CFLAGS=-std=c99 -Wall -O3 -Wno-unused -g # -DDEBUG
LDFLAGS=-lm -lfftw3 -lfftw3f -lz -lpthread
LDFLAGS_EXTRA = -lnetcdf

.SECONDEXPANSION:
%.o: $$(basename $$*).c
	$(CC) $(CFLAGS) $(INCFOLDER) $(DEFINES) -c $< -o $@

dctz-ec-test: dctz-test.c dctz-comp-lib.c dctz-decomp-lib.c binning.c util.c dct.c dct-float.c
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) -DUSE_TRUNCATE

dctz-qt-test: dctz-test.c dctz-comp-lib.c dctz-decomp-lib.c binning.c util.c dct.c dct-float.c 

	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) -DUSE_TRUNCATE -DUSE_QTABLE

dctz-ec-zc-test: dctz-test.c dctz-comp-lib.c dctz-decomp-lib.c binning.c util.c dct.c dct-float.c 
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) -DUSE_TRUNCATE -DWITH_Z_CHECKER

dctz-qt-zc-test: dctz-test.c dctz-comp-lib.c dctz-decomp-lib.c binning.c util.c dct.c dct-float.c 

	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) -DUSE_TRUNCATE -DUSE_QTABLE -DWITH_Z_CHECKER

.PHONY: all
.DEFAULT_GOAL:=all

all:	dctz-ec-test dctz-qt-test dctz-ec-zc-test dctz-qt-zc-test


clean:
	rm -f *~ *.o dctz-ec-test dctz-qt-test dctz-ec-zc-test dctz-qt-zc-test
