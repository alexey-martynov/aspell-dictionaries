.PHONY: all install install-ruen clean ruen

SHELL := bash

dict_dir := $(shell aspell config dict-dir)

all: ru-computer.rws

install: ru-computer.rws
	cp $< $(dict_dir)
	if ! grep 'ru-computer\.rws' $(dict_dir)/ru.multi > /dev/null ; then \
	cp $(dict_dir)/ru.multi $(dict_dir)/ru.multi.orig-computer \
	&& echo "add ru-computer.rws" >> $(dict_dir)/ru.multi ; fi

clean:
	rm -f *.rws *.tmp ru.dat

ru-computer.rws: ru-computer.words
	aspell --lang=ru --encoding=utf-8 create master ./$@ < $<

ruen: ruen.rws

install-ruen: ruen.rws
	cp $< $(dict_dir)
	cp ruen.rws $(dict_dir)/
	if ! grep 'ruen\.rws' $(dict_dir)/ru.multi > /dev/null ; then \
	cp $(dict_dir)/ru.multi $(dict_dir)/ru.multi.orig-ruen \
	&& grep -v 'ru-y[oe]' $(dict_dir)/ru.multi.orig-ruen > $(dict_dir)/ru.multi \
	&& echo "add ruen.rws" >> $(dict_dir)/ru.multi ; fi

ruen.rws:
	cp $(dict_dir)/ru.dat $(dict_dir)/ru.dat.orig
	cat $(dict_dir)/ru.dat.orig <(grep '^special' $(dict_dir)/en.dat) | uniq > $(dict_dir)/ru.dat
	aspell dump master en > all.tmp
	aspell dump master ru-ye >> all.tmp
	aspell --lang=ru --encoding=utf-8 create master ./ruen.rws < all.tmp
	rm all.tmp
