#!/bin/bash

# Written by: Ellery K. Bann (2022)
#
# Free version of ChessBase Endgame Turbo 5 (bytes or 128GB of Syzygy Tablebases)
#

DVD1='KBNPvKQ KBNPvKR KBNvKBN KBNvKBP KBNvKNN KBNvKNP KBNvKPP KBPPvKP KBPPvKQ KBPvKNN KNNPvKB KNNPvKN KNNPvKP KNNPvKQ KNNPvKR KNNvKNN KNNvKNP KNNvKPP KNPPvKP KNPPvKQ KQBPvKQ KQBvKBP KQBvKNP KQBvKPP KQBvKQB KQBvKQN KQBvKQP KQBvKRP KQBvKRR KQNNvKP'

# KNPPvKB KNPPvKN KNPPvKR KNPvKNP KNPvKPP KPPPvKQ

DVD2='KQNNvKQ KQNPvKQ KQNvKBP KQNvKNN KQNvKNP KQNvKPP KQNvKQN KQNvKQP KQNvKRP KQNvKRR KQPvKBB KQPvKBN KQPvKBP KQPvKNN KQPvKNP KQPvKRB KQPvKRN KQPvKRP KQPvKRR KQQvKQP KQQvKQQ KQQvKQR KQRvKPP KQRvKQB KQRvKQN KQRvKQP KQRvKQR KQRvKRR KRBBvKQ KRBNvKQ'

# KBPPvKB KBPPvKN KBPPvKR KBPvKBP KBPvKNP KBPvKNN

DVD3='KRBPvKQ KRBPvKR KRBvKBB KRBvKBN KRBvKBP KRBvKNN KRBvKNP KRBvKPP KRBvKRB KRBvKRN KRBvKRP KRNNvKP KRNNvKQ KRNNvKR KRNPvKQ KRNPvKR KRNvKBB KRNvKBN KRNvKBP KRNvKNN KRNvKNP KRNvKPP KRNvKRN KRNvKRP KRPvKBB KRPvKBN KRPvKNN KRRBvKQ KRRNvKQ KRRPvKQ'

# KPPPvKB KPPPvKN KPPPvKP KPPPvKR KPPvKPP KQPPvKQ KQPvKQP KRPPvKQ KRPPvKR KRPvKPP

DVD4='KRRvKBB KRRvKBN KRRvKBP KRRvKNN KRRvKNP KRRvKPP KRRvKRB KRRvKRN KRRvKRP KRRvKRR KBBNvKQ KBBPvKQ KBBPvKR KBBvKBB KBBvKBN KBBvKBP KBBvKNN KBBvKNP KBBvKPP KBNNvKB KBNNvKN KBNNvKP KBNNvKQ KBNNvKR KBNPvKB KBNPvKN KBNPvKP'

# KQPPvKP KQPvKPP KRPvKBP KRPvKNP KRPvKRP

#
# Create download directory
#

mkdir -p syzygy

#
# Download 3-4-5 pieces Tablebases
#

#echo "DOWNLOADING 3-4-5 pieces Tablebases:"
#wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ -A rtbw,rtbz http://tablebase.sesse.net/syzygy/3-4-5/

#
# Download 6-pieces Tablebases from Endgame Turbo 5 not in Endgame Turbo 4
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

#wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-DTZ/KRBvKNN.rtbz
#wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/KRBvKNN.rtbw

#
# Download MD5 Checksums for the Tablebases
# and check the downloaded files
#

echo "CHECKING MD5 Checksums:"
wget -c -nc -H -e robots=off -nd -r -l 1 -P syzygy/ http://tablebase.sesse.net/syzygy/6-WDL/3-4-5-6.md5
cd syzygy
md5sum -c --ignore-missing 3-4-5-6.md5 | grep -i failed
