#/bin/bash

cat nld.nouns.txt \
| python cc.py -r ParadigmsDut.gfo --oper mkN \
| gf --run \
| sed -E 's_(.*), (.*), (.*), (.*), ResDut.(.*)_\1:\1<n><\5><sg>#\2:\1<n><\5><sg>+s<gen>#\3:\1<n><\5><pl>#\4:\1<n><\5><pl>+s<gen>_g' \
| tr '#' '\n' \
| diff -u nld.nouns.expanded -