#!/bin/sh 

LPINK='\033[38;2;253;197;218m'
DPINK='\033[38;2;250;130;181m'
BLACK='\033[38;2;56;27;10m'
CHEEK='\033[38;2;226;156;161m'
echo -e "$(
cat << EOF
${LPINK}                                    00
                                 00000000
                                0000000000
   000               0000000000  00000000
    x${DPINK}@@@${LPINK}xxx00      0000000000000  000000     000000000
    x${DPINK}@@@@@${LPINK}x00000    00000000000000      000000${DPINK}xx@@@@${LPINK}0
    0${DPINK}@@@@@${LPINK}x000000    0000000000000000000000000${DPINK}x@@@@${LPINK}0
     0${DPINK}@@@@${LPINK}x00000000              000000000000${DPINK}x@@@@${LPINK}0
      0x${DPINK}@${LPINK}x000000000                 000000000x${DPINK}@@@${LPINK}0
      00000000000                    00000000xxx0
         00${BLACK}0@@${LPINK}000                     00${BLACK}x@x${LPINK}0000
  0000000  0${BLACK}@*)${LPINK}(@                    0${BLACK}&((${LPINK}&0
 000000000  000${BLACK}@&)${LPINK}*0               ${BLACK}&)(${LPINK}@0
 000000000  00${BLACK}@*(*${LPINK}@0  ${BLACK}@0      0@   x&(*${LPINK}&x00000
  000000000${CHEEK}x${BLACK}*)(${CHEEK}&0${LPINK}      ${BLACK}*) * x)(       @*((${CHEEK}@xxx${LPINK}
       0${CHEEK}xxxxxxxxx${LPINK}0     ${BLACK}0&*&@*&0     ${CHEEK}0xxxxxxxxxx${LPINK}
         00${CHEEK}xxxxx${LPINK}0000               0000${CHEEK}xxxxx${LPINK}00
           000000000           000000000000
            0000000    0000000000000
            @x000    000000000000  000000
            ${DPINK}@@0${LPINK}      000000000000  000000000
           ${DPINK}0@@${LPINK}          000000     000000000
${DPINK}0@@@@0    0@@0${LPINK}                      0000000
${DPINK}@@       0@@0
${DPINK}x@00  00x@x0
 ${DPINK}0xx@@xx0
EOF
)"
