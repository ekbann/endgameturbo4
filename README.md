# Endgame Turbo 4
Syzygy Tablebases from ChessBase Endgame Turbo 4 with an update to obtain Endgame Turbo 5

First and foremost, this github repository does **NOT** host any ChessBase products. Please support them by buying their amazing products especially *Fritz* and *ChessBase* (database).

The script contained here simply downloads all the freely generated DTZ and WDL tablebases from **tablebase.sesse.net** provided by the ever generous Mr. Steinar Gunderson. All the files are downloaded into one directory *syzygy* created where the script is run. This script does not perform multiple simultaneous downloads and therefore does not break any server rules on the usage of *download accelerators*.

The total size of all syzygy files adds up to 18.1 GB (19,009,792 bytes) and should be in 346 DTZ and WDL files. There is also the MD5 checksum file as well. On a fast Internet connection it took less than an hour to download the entire set. Even if your *ChessBase* database program does not directly support syzygy tables (requires *ChessBase 12*+) you can still access them via the *Stockfish* chess engine. Currently, I am using *ChessBase 9* with *Stockfish 12*.

If you insist in using older *ChessBase* database programs without syzygy support, I have the the *Nalimov* version of Endgame Turbo 4 script. Just substitute ```syzygy.sh``` with ```nalimov.sh``` in the commands below. The only difference is that the total size increases to 119.5 GB (125,245,568 bytes) and the files are saved in the *nalimov* directory.

This script was created on a Linux machine and runs on *bash* and *zsh* shells and requires *wget* and *md5sum* commands. macOS users need to install *brew* and then execute:

```brew install md5sha1sum```

for the needed *md5sum* command in order to check the files' integrity. Make sure my script is executable, if not, run:

```chmod +x syzygy.sh```

and then run it with:

```./syzygy.sh```

The main **BENEFIT** of this script is that if the download is interrupted for any reason, re-running the script will **CONTINUE** from where it left off, without downloading again the existing files, and thus save precious time.

### New Update!

I have written a new script that will download the additional 6-pieces syzygy tablebases from Endgame Turbo 5 into the *syzygy* directory. The final size would then be 114.4 GB (119,878,784 bytes). Run the commands below:

```
chmod +x update.sh
./update.sh
```

Enjoy!

### ERRATA:
The existing *3-4-5-6.md5* checksum file dated 2022-01-07 has incorrect signatures for the updated **K[RQP]vK** (3-piece) tables and may display 6 FAILED checksums. You may safely ignore theses errors until Mr. Steinar fixes them.

Sometimes the tablebases themselves have errors and are later re-generated correctly. In that case, periodically download the latest MD5 checksum files and run:

```md5sum -c --ignore-missing 3-4-5-6.md5 | grep -i failed```

## Are Tablebases Beneficial?

Yes they are! Believe it or not, *Stockfish* alone could not win more than one-third of 100 selected winning 6-pieces endgames. Tablebases add roughly 35-40 Elo points to the engine. Given this position (FEN) from Tiviakov-Korsunsky, 1989:

```8/1k6/p7/1pb2K1R/8/P7/1P6/8 w - - 0 45```

For years, theory declared this position a draw and that it was a fortress. Thanks to the endgame tablebases this theory was disproved and a solution was published.  Needless to say, without tablebases the engines fail to see the winning line even after five full minutes on it, whereas with tablebases it is found in seconds. 
