.PHONY: all clean

all: ru-computer.rws

clean:
	rm -f ru-computer.rws

ru-computer.rws: ru-computer.words
	aspell --lang=ru --encoding=utf-8 create master ./$@ < $<
