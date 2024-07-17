Aspell Dictionaries
===================

This project contains sources for some special dictionaries for [GNU
Aspell](http://aspell.net/).

The "ru-computer" dictionary contains Computer Science-related words
in Russian. For simplicity it contains also some useful English words
like keywords from C++ and abbrevs. It is not complete. All words
added in case when Aspell misses them in texts.

Building and Installing
-----------------------

To build this dictionaries GNU Aspell must be installed. The Makefile
performs all required tasks.

To install, the files "ru-computer.dat" and "ru-computer.rws" should
be copied to the dictionary directory on system. The file "ru.multi"
should be updated by adding line:

       add ru-computer.rws

The folowing targets supported to simplify compilation and
installation:

* `ruen.rws`

  Generate dual-language (EN + RU) dictionary from currently installed
  EN and RU dictionaries.

* `ruen-computer.rws`

  Always dual language (EN + RU) dictionary with Computer
  Science-related words.

* `en-computer.rws`

  English dictionary with Computer Science-related words.

* `install-ru`

  Install dual language Computer Science dictionary to Russian
  multi-dictionary configuration.

* `install-en`

  Install English Computer Science dictionary to English
  multi-dictionary configuration.

* `install-ruen`

  Replace default Russian dictionary with dual language dictionary.

* `all` (default)

  Build only Computer Science dictionaries (Russian and English).

* `clean`

  Remove all generated files. This *does not* uninstall dictionaries.
