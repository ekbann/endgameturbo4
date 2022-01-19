#!/bin/bash

# Written by: Ellery K. Bann (2022)
#
# Free version of ChessBase Endgame Turbo 4 (119GB of Nalimov Tablebases)
# including one 6-pieces KRBvKNN table from Endgame Turbo 3
#

filelist=()
grandtotal=0
res=0

#
# Create download directory
#

mkdir -p nalimov

# Download the MD5 checksum files for the required tablebases
#
wget -c -nc -H -e robots=off -nd -r -l 1 -P nalimov/ http://tablebase.sesse.net/3-4-5/3-4-5.md5
wget -c -nc -H -e robots=off -nd -r -l 1 -P nalimov/ http://tablebase.sesse.net/3+3/all-33.md5
wget -c -nc -H -e robots=off -nd -r -l 1 -P nalimov/ http://tablebase.sesse.net/3+3-with-pawns/all-33p.md5
wget -c -nc -H -e robots=off -nd -r -l 1 -P nalimov/ http://tablebase.sesse.net/4+2-with-pawns/all-42p.md5

# N33 = Nalimov 3+3
#
# (310) KRBvKNN = 0.001% 

N33='krbknn'

echo "Nalimov 3+3 Tablebases:"

for i in $N33
do
	echo -e "\tchecking download size for: $i"
#	res=`grep "$i" all-33.md5 | awk '{print "http://tablebase.sesse.net/3+3/"$2}' | xargs wget --spider -O - 2>&1 | grep "Length:" | awk '{sum+=$2;} END {print int(sum/1024/1024);}'`
	echo -e "\t\t$res MB" 
	grandtotal=$(($grandtotal + $res))

	filelist+=$(grep "$i" all-33.md5 | awk '{print "http://tablebase.sesse.net/3+3/"$2}')
	filelist+=$'\n' 
done

# N33P = Nalimov 3+3 with pawns
#
# (18) KNPvKNP = 1.463%
# ( 7) KNPvKPP = 3.262%
# (20) KBPvKBP = 1.270%
# ( 8) KBPvKNP = 2.710%
# (154)KBPvKNN = 0.017%
# ( 3) KPPvKPP = 9.629%
# (19) KQPvKQP = 1.419%
# ( 6) KRPvKPP = 3.503%
# (10) KQPvKPP = 2.328%
# ( 9) KRPvKBP = 2.337%
# (16) KRPvKNP = 1.556%
# ( 2) KRPvKRP =12.962%

N33P='knpknp knpkpp kbpkbp kbpknp kbpknn kppkpp kqpkqp krpkpp kqpkpp krpkbp krpknp krpkrp'

echo "Nalimov 3+3 with pawns Tablebases:"

for i in $N33P
do
	echo -e "\tchecking download size for: $i"
#	res=`grep "$i" all-33p.md5 | awk '{print "http://tablebase.sesse.net/3+3-with-pawns/"$2}' | xargs wget --spider -O - 2>&1 | grep "Length:" | awk '{sum+=$2;} END {print int(sum/1024/1024);}'`
	echo -e "\t\t$res MB"
	grandtotal=$(($grandtotal + $res))

	filelist+=$(grep "$i" all-33p.md5 | awk '{print "http://tablebase.sesse.net/3+3-with-pawns/"$2}')
	filelist+=$'\n' 
done

# 4+2 with pawns
#
# (17) KNPPvKB = 1.550%
# (13) KNPPvKN = 1.774%
# (33) KNPPvKR = 0.607%
# (35) KPPPvKQ = 0.516%
# (11) KBPPvKB = 1.850%
# (21) KBPPvKN = 1.264%
# (29) KBPPvKR = 0.827%
# (34) KPPPvKB = 0.565% 
# (32) KPPPvKN = 0.625% 
# ( 4) KPPPvKP = 4.261%
# (25) KPPPvKR = 1.090%
# (22) KQPPvKQ = 1.157%
# (37) KRPPvKQ = 0.397%
# ( 1) KRPPvKR =14.029% 
# (23) KQPPvKP = 1.126%

N42P='knppkb knppkn knppkr kpppkq kbppkb kbppkn kbppkr kpppkb kpppkn kpppkp kpppkr kqppkq krppkq krppkr kqppkp'

echo "Nalimov 4+2 with pawns Tablebases:"

for i in $N42P
do
	echo -e "\tchecking download size for: $i"
#	res=`grep "$i" all-42p.md5 | awk '{print "http://tablebase.sesse.net/4+2-with-pawns/"$2}' | xargs wget --spider -O - 2>&1 | grep "Length:" | awk '{sum+=$2;} END {print int(sum/1024/1024);}'`
	echo -e "\t\t$res MB"
	grandtotal=$(($grandtotal + $res))

	filelist+=$(grep "$i" all-42p.md5 | awk '{print "http://tablebase.sesse.net/4+2-with-pawns/"$2}')
	filelist+=$'\n' 
done

grandtotal=$(($grandtotal / 1024))
echo -e "\nGRAND TOTAL:\t$grandtotal GB"

#
# Download 3-4-5 pieces Tablebases
#

echo "DOWNLOADING 3-4-5 pieces Tablebases:"
wget -c -nc -H -e robots=off -nd -r -l 1 -P nalimov/ -A emd http://tablebase.sesse.net/3-4-5/

#
# Download 6-pieces Tablebases from 3+3, 3+3-with-pawns, and 4+2-with-pawns
#

echo "DOWNLOADING 6-pieces Tablebases:"

for i in $filelist
do
   echo downloading "$i"...
   wget -c -nc -H -e robots=off -nd -r -l 1 -P nalimov/ "$i"
done

#
# Verify the MD5 Checksums for the Tablebases
#

echo "CHECKING MD5 Checksums:"
cd nalimov
md5sum -c --ignore-missing 3-4-5.md5 | grep -i failed
md5sum -c --ignore-missing all-33.md5 | grep -i failed
md5sum -c --ignore-missing all-33p.md5 | grep -i failed
md5sum -c --ignore-missing all-42p.md5 | grep -i failed
echo "Done. Exiting..."
