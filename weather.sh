#!/bin/sh

set -eux

CITY=Ankang
LANGUAGE="zh-CN"
UNIT=m
UA="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36"

curl \
  -H "Accept-Language: $LANGUAGE" \
  -H "User-Agent: $UA" \
  -o result.html \
  https://wttr.in/$CITY?format=4\&$UNIT

echo "<p>今天小张也是爱你的一天呦~~~~ </p>" >> ./result.html
echo "<p>小张贴心准备了详细的天气情况:</p> <a href="https://wttr.in/hanbin" title="Baidu">小熊同学专属汉滨区天气详情</a> " >> result.html
echo "" >> result.html
