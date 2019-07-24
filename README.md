# FindNum v2.1
Scraper and parser to csv for phone numbers and fax numbers

Morris and I (Jason) worked out a method to scrape and parse Google search results for certain information, in this current program incarnation: fax and phone numbers of elected officials. We will work on an option to grab emails or other types of information if requested.

All you need for use of our Linux binary is a file containing all the names for your query. The program has enough wait statements to prevent Google from complaining and blocking your IP. Just only run one occurrence of this program at a time per IP. Otherwise Google will block your IP for about 6 hours where you can't use Google.

Only one or two dependency will need to be installed (these commands work in Debian and Ubuntu):
1) Googler
apt-get install googler 
2) Python
apt-get install build-essential libssl-dev libffi-dev python-dev
3) Unzip
apt-get install unzip

Googler is relatively new package so make sure your distro is recent or you'd have to go at all ends to plug in a repo (we won't go into that here, Google it if you have too.)

The binary program "findnum" will ask for input file, output file (ie output.csv), prefix and search depth.

Input file is the file containing all the names you wish to search. Output file will have all the properly formatted results. Prefix is what criteria you are searching, for example "phone:" for phone numbers and "fax:" for fax numbers. Search depth is how many search results you want the program to scrape and parse data when it finds data that match your criteria.


VER 2.1 Released:

Version 2.1 adds ability to either do a one time search query for numbers or go through a file of names. If a period "." is in the input then the file load protocol is initiated. Also for file loads you have option to include additional query expression such as "Public Relations" for example. Extra query expression however is append to same field as file query string and this will may be updated with version 2.2 to have that in it's own field for output file. However a simple search and delete then replicate it in spreadsheet would be an easy work around. Binary is now available in a gnuzip archive (*.gz)

<img src="https://hand.is/findnum/search.png">
<img src="https://hand.is/findnum/file.png">

VER 2.0 Released:

Version 2.0 adds a 1 in front of each number and for multiple results per name, each result is on it's own row with the associated name. Also trailing rows of white spaces in the input file are deleted.

<img src="https://hand.is/findnum/screenshot2.png">

VER 1.2 and 1.3 were developmental and not released.

VER 1.1 Released:

Version 1.1 will remove all special characters and white spaces from numbers and also remove duplicates before putting them in the CSV. The program will generate a temp.dat file that you are welcome to delete after each run. I am leaving it there for debugging purposes.

<img src="https://hand.is/findnum/screenshot.png">
