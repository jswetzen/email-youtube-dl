egrep '(([^:/?#]+):)?(//([^/?#]*))?([^?#]*)(\?([^#]*))?(#(.*))?' | egrep '(svtplay\.se|tv4play\.se)' | head -1 | while read x ; do $(echo "svtplay-dl ${DL_OPTIONS} ${x##*: }x"); done <&0
