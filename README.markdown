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
