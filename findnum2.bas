rem lang: "qb"
randomize timer
cls
shell "ls"
color 14,1
print "FindNum v2.1 by Page Telegram 1/20/2019 :: pagetelegram.com"
color 7,0
input "Input File or Search Term (or 'exit')>", fil$
if lcase$(fil$)="exit" then end
for i=1 to len(fil$)
if mid$(fil$,i,1)="." then f=1
next i
if f=1 then
input "Provided any extra search terms?>",trm$
print "Processing and removing all special characters from your database file ";fil$
shell "sed 's/[-_()"+chr$(34)+"&*{}]//g' "+fil$+" > 0t1"
shell "sed -e :a -e '/[^[:blank:]]/,$!d; /^[[:space:]]*$/{ $d; N; ba' -e '}' 0t1 > 0t2"
open "0t2" for input as #7
total = 0
do
if not (eof(7)) then input #7,cunt$
total=total+1
loop until eof(7)
close #7
color 14
print "File Total Lines="; total
color 7
end if
input "Output File>", fout$
input "prefix>",px$
if f=1 then input "skip to line#>",skp
input "Search result depth (ie 10)?>",rs
if skp=0 then shell "echo  > "+fout$
if rs=0 then rs=10

if f=1 then open "0t2" for input as #1
c=0
open fout$ for append as #2
print #2, "NAME "+ucase$(trm$)+","+ucase$(px$)
close #2
do
c=c+1
if f = 1 then if not (eof(1)) then input #1, name$
if c>skp then
open fout$ for append as #2
close #2
if f=0 then name$=fil$
if len(trm$)>1 then name$=name$+" "+trm$
shell "googler --np -x -n "+str$(rs)+" "+px$+" "+name$+" | grep -o -i '"+px$+"\W\(([0-9]\{3\})\|[0-9]\{3\}\)[ -]\?[0-9]\{3\}[ -]\?[0-9]\{4\}' | grep -o '\(([0-9]\{3\})\|[0-9]\{3\}\)[ -]\?[0-9]\{3\}[ -]\?[0-9]\{4\}' > temp.dat"
shell "sed 's/[-_() ]//g' temp.dat > temp2.dat"
shell "awk '!seen[$0]++' temp2.dat > temp3.dat"
shell "rm temp.dat"
shell "rm temp2.dat"
shell "mv temp3.dat temp.dat"
open "temp.dat" for input as #3
do
if not(eof(3)) then input #3,ot$
if len(ot$)<5 then no=1
color 11
if no=0 then
ot$="1"+ot$
print ot$;
t$=t$+name$+","+ot$+chr$(10)
end if
no=0
color 4
print " // ";
loop until eof(3)
close #3
open fout$ for append as #2
rem t$=name$+","+ot$
print #2,t$
a$=t$
t$=""
ot$=""
close #2
if f=1 then tim=int(rnd*30)+20
print
color 7
print c;"-";
color 10
print name$;
color 7
print " completed! timer set for ";tim; " seconds."
color 9
print a$
color 7
if f=1 and c<total then sleep tim
end if
loop until eof(1) or f=0
close #1
close #2
if f = 1 then 
shell "rm 0t1"
shell "rm 0t2"
end if
end
