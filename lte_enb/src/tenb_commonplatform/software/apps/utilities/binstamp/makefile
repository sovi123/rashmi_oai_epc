###############################################################################
#
# $Id: makefile 15917 2009-07-20 13:27:01Z mrenwick $
#
# Copyright � Radisys Ltd
#
###############################################################################
#
#  Binary file stamper
#
###############################################################################

TOP = $(shell pwd)/../../..

CC=gcc
CPPFLAGS=-DVERSION="\"0.2\""
CFLAGS=-Wall -Wshadow -O3
OBJS=binstamp.o

all: binstamp testbin

binstamp: $(OBJS)
	$(CC) -o $@ $^ -static
	strip -x $@

testbin: version.o
	$(CC) -o $@ $^

install: binstamp
	cp -fv binstamp $(TOP)/makefrags

clean:
	rm -f $(OBJS) version.o

.PHONY: clean install


# END OF FILE
