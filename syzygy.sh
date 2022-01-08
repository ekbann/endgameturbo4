#!/bin/bash

# Written by: Ellery K. Bann (2022)
#
# Free version of ChessBase Endgame Turbo 4 (18GB of Syzygy Tablebases)
# plus 6-pieces KRBvKNN tables from Endgame Turbo 3 (an extra 1GB)
#

DVD1='KNPPvKB KNPPvKN KNPPvKR KNPvKNP KNPvKPP KPPPvKQ'
DVD2='KBPPvKB KBPPvKN KBPPvKR KBPvKBP KBPvKNP KBPvKNN'
DVD3='KPPPvKB KPPPvKN KPPPvKP KPPPvKR KPPvKPP KQPPvKQ KQPvKQP KRPPvKQ KRPPvKR KRPvKPP'
DVD4='KQPPvKP KQPvKPP KRPvKBP KRPvKNP KRPvKRP'
XTRA='KRBvKNN'

#
# Create download directory
#

mkdir -p syzygy

#
# Download 3-4-5 pieces Tablebases
#

echo "DOWNLOADING 3-4-5 pieces Tablebases:"
wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ -A rtbw,rtbz http://tablebase.sesse.net/syzygy/3-4-5/

#
# Download 6-pieces Tablebases from DVD #1-4
#

echo "DOWNLOADING 6-pieces Tablebases from DVD1:"

for i in $DVD1
do
   echo downloading "$i"...
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-DTZ/"$i".rtbz
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/"$i".rtbw
done

echo "DOWNLOADING 6-pieces Tablebases from DVD2:"

for i in $DVD2
do
   echo downloading "$i"...
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-DTZ/"$i".rtbz
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/"$i".rtbw
done

echo "DOWNLOADING 6-pieces Tablebases from DVD3:"

for i in $DVD3
do
   echo downloading "$i"...
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-DTZ/"$i".rtbz
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/"$i".rtbw
done

echo "DOWNLOADING 6-pieces Tablebases from DVD4:"

for i in $DVD4
do
   echo downloading "$i"...
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-DTZ/"$i".rtbz
   wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/"$i".rtbw
done

#
# Download the extra 6-pieces Tablebase from Endgame Turbo 3
#

wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-DTZ/KRBvKNN.rtbz
wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/KRBvKNN.rtbw

#
# Download MD5 Checksums for the Tablebases
# and check the downloaded files
#

wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/3-4-5-6.md5
cd syzygy
md5sum -c 3-4-5-6.md5
