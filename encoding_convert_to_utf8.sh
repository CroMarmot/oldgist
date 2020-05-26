#!/bin/bash
# By yexiaorain
# converts different encoding to utf8 recursively. 
# this is for chinese lrc file, u can change the GBK to your language listed below from "enca--list languages" when u get 'unkown-8bit' with 'file --mime-encoding *'.
#
# helpers:
# > file --mime-encoding *.lrc
# enca - apt-get install enca 
# > enca --list languages
# belarusian: CP1251 IBM866 ISO-8859-5 KOI8-UNI maccyr IBM855 KOI8-U
#  bulgarian: CP1251 ISO-8859-5 IBM855 maccyr ECMA-113
#      czech: ISO-8859-2 CP1250 IBM852 KEYBCS2 macce KOI-8_CS_2 CORK
#   estonian: ISO-8859-4 CP1257 IBM775 ISO-8859-13 macce baltic
#   croatian: CP1250 ISO-8859-2 IBM852 macce CORK
#  hungarian: ISO-8859-2 CP1250 IBM852 macce CORK
# lithuanian: CP1257 ISO-8859-4 IBM775 ISO-8859-13 macce baltic
#    latvian: CP1257 ISO-8859-4 IBM775 ISO-8859-13 macce baltic
#     polish: ISO-8859-2 CP1250 IBM852 macce ISO-8859-13 ISO-8859-16 baltic CORK
#    russian: KOI8-R CP1251 ISO-8859-5 IBM866 maccyr
#     slovak: CP1250 ISO-8859-2 IBM852 KEYBCS2 macce KOI-8_CS_2 CORK
#    slovene: ISO-8859-2 CP1250 IBM852 macce CORK
#  ukrainian: CP1251 IBM855 ISO-8859-5 CP1125 KOI8-U maccyr
#    chinese: GBK BIG5 HZ
#       none:


file --mime-encoding *.lrc| grep "\(iso-8859-1\)\|\(unknown-8bit\)" |awk '{print $1}' |sed 's/:$//' | while read filename
do
  newname=${filename}.utf8
  iconv -c -f GBK -t utf-8 "$filename" > "$newname"
done
