#!/bin/bash

# Beispiel 1
# Test mit einem String; das Zeilenende wird mit `_` markiert
echo "A,B,C,D_E,F,G,H_I,J,K,L_M,N,O,P_Q,R,S,T_U,V,X,Y" | tr _ '\n' | sed 's/,/<\/td><td>/g' | sed 's/^\(.*\)$/<tr><td>\1<\/td><\/tr>/' | sed '1 s/^/<table>\n/'; echo '</table>'

# Beispiel 2
# Ganzes File lesen
# Immer daran denken, dass sich am Beginn der Datei ein BOM und am Zeilenende ein '\r' verstecken könnte! | sed '1 s/\xEF\xBB\xBF//'

FILE='sample.csv'
cat $FILE | sed 's/\r//' | sed 's/,/<\/td><td>/g' | sed 's/^\(.*\)$/<tr><td>\1<\/td><\/tr>/' | sed 's/"//g' | sed '1 s/\xEF\xBB\xBF//' | sed '1 s/td/th/g' | sed '1 s/^/<table>\n/'; echo '</table>'

# Die einzelnen Schritte:
# cat $FILE | \ # Datei einlesen
#    sed 's/\r//' | \ # CR entfernen
#    sed 's/,/<\/td><td>/g' | \ # Kommas durch `</td><td>` ersetzen
#    sed 's/^\(.*\)$/<tr><td>\1<\/td><\/tr>/' | \ # Die ganze Zeile in `<tr><td> ... </td></tr>` einpacken
#    sed 's/"//g' | \ # Double Quotes ersetzen
#    sed '1 s/\xEF\xBB\xBF//' | \ # BOM eliminieren
#    sed '1 s/td/th/g' | \ # In der ersten Zeile `<td>` durch `<th>` ersetzen
#    sed '1 s/^/<table>\n/'; \ # `<table>` an den Anfang setzen
#    echo '</table>' # `<table>` ans Ende setzen
