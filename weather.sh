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

echo "今天小张也是爱你的一天呦~~~~" >> ./result.html
echo "小张贴心准备了详细的天气情况: https://wttr.in/hanbin " >> result.html
echo "<a href="http://www.baidu.com" title="Baidu">百度</a>" >> result.html
