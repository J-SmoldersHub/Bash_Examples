#!/usr/bin/bash

: '
HOW TO USE
	Plaats het script op een locatie naar keuze
	Vervang in dit bestand het pad naar wens, op regel t/m kan bash_user vervangen worden.
	Kopieer het 
	Voeg een alias toe, voor snelle toegang.
	
'

echo -e ""
echo "Insert filename for testcase: "
read varname
echo -e ""

mkdir -p /c/Users/joris/Tickets
cd /c/Users/joris/Tickets/

touch $varname.txt

_j="j"
_y="y"
_n="n"
_nvt="nvt"
_dev="d"
_test="t"
_stg="s"

_yes="Ja"
_no="Nee"
_efDev="EFDEV"
_efTest="EFTEST"
_efStg="EFSTAGE"

testcaseQuestions=(
"Testbaar op dev?"
"Webservice aangepast?"
)

for ((i = 0; i < ${#testcaseQuestions[@]}; i++)) do
echo -e "${testcaseQuestions[$i]}"
read response
echo -e ""

case $response in
"$_y") _response="$_yes";;
"$_j") _response="$_yes";;
"$_n") _response="$_no";;
"$_dev") _response="$_efDev";;
"$_test") _response="$_efTest";;
"$_stg") _response="$_efStg";;
"$_nvt") _response="$_nvt";;
*) _response="$response";;
esac
  
echo -e  "${testcaseQuestions[$i]}
$_response\n" >> $varname.txt
done

echo "De testcase is aangemaakt en zal zo openen.
Druk op Enter en controleer de testcase en vul aan waar nodig."
read not_used

start $varname.txt

