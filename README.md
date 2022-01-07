# Endgame Turbo 4
Syzygy Tablebases from ChessBase Endgame Turbo 4

First and foremost, this github repository does NOT host any ChessBase products. Please support them by buying their amazing products especially Fritz and ChessBase (database).

The script contained here simply downloads all the freely generated DTZ and WDL tablebases from **tablebase.sesse.net** provided by the ever generous Mr. Steinar Gunderson. All the files are downloaded into one directory *syzygy* created where the script is run. This script does not perform multiple simultaneous downloads and therefore does not break any server rules on the usage of *download accelerators*.

The total size of all files adds up to 19GB and should be in 346 DTZ and WDL files. There is also the MD5 checksum file as well. On a fast Internet connection it took less than an hour to download the entire set. Even if your ChessBase database program does not directly support syzygy tables (requires ChessBase 13+) you can still access them via the *Stockfish* chess engine. Currently, I am using ChessBase 9 with Stockfish 12.

This script was created on a Linux machine and runs on *bash* and *zsh* shells. macOS users need to install **brew** and then execute **brew install md5sha1sum** for the needed **md5sum** command in order to check the files' integrity. Make sure the script is executable, if not, run **chmod +x syzygy.sh** and now run it with **./syzygy.sh**

The main ***BENEFIT*** of this script is that if the download is interrupted for any reason, re-running the script again will CONTINUE from where it left off, without re-downloading existing files, and thus save precious time.

Enjoy!

ERRATA: The existing *3-4-5-6.md5* checksum file dated 2022-01-07 has incorrect signatures for the updated K[RQP]vK (3-piece) tables and may display 6 FAILED checksums. You may safely ignore theses errors until Mr. Steinar fixes them.
