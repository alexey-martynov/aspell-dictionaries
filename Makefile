.PHONY: all install install-ruen clean ruen

SHELL := bash

dict_dir := $(shell aspell config dict-dir)

all: ru-computer.rws en-computer.rws

install: install-ru install-en

install-ru: ru-computer.rws
	cp $< $(dict_dir)
	if ! grep 'ru-computer\.rws' $(dict_dir)/ru.multi > /dev/null ; then \
	cp $(dict_dir)/ru.multi $(dict_dir)/ru.multi.orig-computer \
	&& echo "add ru-computer.rws" >> $(dict_dir)/ru.multi ; fi

install-en: en-computer.rws
	cp $< $(dict_dir)
	if test -f $(dict_dir)/en.multi ; then \
	if ! grep 'en-computer\.rws' $(dict_dir)/en.multi > /dev/null ; then \
	cp $(dict_dir)/en.multi $(dict_dir)/en.multi.orig-computer \
	&& echo "add en-computer.rws" >> $(dict_dir)/en.multi ; fi \
	fi
	if test -f $(dict_dir)/ru.multi ; then \
	if ! grep 'en-computer\.rws' $(dict_dir)/ru.multi > /dev/null ; then \
	cp $(dict_dir)/ru.multi $(dict_dir)/ru.multi.orig-computer \
	&& echo "add en-computer.rws" >> $(dict_dir)/ru.multi ; fi \
	fi

clean:
	rm -f *.rws *.tmp ru.dat

%-computer.rws: %-computer.words
	aspell --lang=$(patsubst %-computer.words,%,$<) --encoding=utf-8 create master ./$@ < $<

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
