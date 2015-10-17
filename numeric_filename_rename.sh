#!/bin/bash
# rename a bunch of files to match an incremental numeric pattern

steve@Quark:~/Desktop/gif/crops/dropframes_fwd/tmp$ ls
00000186.jpg  00000190.jpg  00000194.jpg  00000198.jpg  00000202.jpg  00000206.jpg          copy of 00000188.jpg  copy of 00000192.jpg  copy of 00000196.jpg  copy of 00000200.jpg  copy of 00000204.jpg
00000187.jpg  00000191.jpg  00000195.jpg  00000199.jpg  00000203.jpg  00000207.jpg          copy of 00000189.jpg  copy of 00000193.jpg  copy of 00000197.jpg  copy of 00000201.jpg  copy of 00000205.jpg
00000188.jpg  00000192.jpg  00000196.jpg  00000200.jpg  00000204.jpg  copy of 00000186.jpg  copy of 00000190.jpg  copy of 00000194.jpg  copy of 00000198.jpg  copy of 00000202.jpg  copy of 00000206.jpg
00000189.jpg  00000193.jpg  00000197.jpg  00000201.jpg  00000205.jpg  copy of 00000187.jpg  copy of 00000191.jpg  copy of 00000195.jpg  copy of 00000199.jpg  copy of 00000203.jpg  copy of 00000207.jpg


A=208
for i in copy*.jpg; do new=$(printf "%08d.jpg" "$A"); mv -- "$i" "$new"; let A=A+1; done

steve@Quark:~/Desktop/gif/crops/dropframes_fwd/tmp$ ls
00000186.jpg  00000189.jpg  00000192.jpg  00000195.jpg  00000198.jpg  00000201.jpg  00000204.jpg  00000207.jpg  00000210.jpg  00000213.jpg  00000216.jpg  00000219.jpg  00000222.jpg  00000225.jpg  00000228.jpg
00000187.jpg  00000190.jpg  00000193.jpg  00000196.jpg  00000199.jpg  00000202.jpg  00000205.jpg  00000208.jpg  00000211.jpg  00000214.jpg  00000217.jpg  00000220.jpg  00000223.jpg  00000226.jpg  00000229.jpg
00000188.jpg  00000191.jpg  00000194.jpg  00000197.jpg  00000200.jpg  00000203.jpg  00000206.jpg  00000209.jpg  00000212.jpg  00000215.jpg  00000218.jpg  00000221.jpg  00000224.jpg  00000227.jpg
