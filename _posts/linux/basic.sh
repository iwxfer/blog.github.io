__DIR__=/home/user/tmp/
__USER__=user
__REMOTE__=fer44.com
__FILE__=bkp

### Compression

# Compress bzip2 and gz+gpg
tar -c  __DIR__ | bzip2 > __FILE__.tar.bz2
tar -cz __DIR__ | gpg -c -o $__FILE__.tgz.gpg

# DeCompress bzip2 and gz+gpg
bzip2 -dc __FILE__.tar.bz2 | tar -x
gpg -d __FILE__.tgz.gpg | tar -xz

# Compress multiple files and dirs
tar -cf   __TAR__.tar    file1 file2 ... dir1 dir2 ...
tar -zcvf __TAR__.tar.gz file1 file2 ... dir1 dir2 ...

tar --exclude=**/.gradle/* --exclude=**/build/* -cf __TAR__.tar dir
tar --exclude={*.png,.git,node_modules} -cf __TAR__.tar dir

# Make encrypted archive on remote machine
tar -c $__DIR__/ | gzip | gpg -c | ssh $__USER__@$__REMOTE__ "dd of=$__FILE__.tar.gz.gpg"

# Compress 7z
alias zzip=7za
zzip a -r __ZIP__.7z __DIR__/
zzip a -t7z -p -r __ZIP__.7z __DIR__/
zzip e __ZIP__.7z

### Permissions

# Permissions chmod [ugoa...][[+-=][rwxXst]
chmod -R g=u /opt/*  # same permissions to group

# Run backgrouind task
nohup /path/script.sh > /dev/null 2>&1 &

# add shared library
vi /etc/ld.so.conf
vi /etc/ld.so.conf.d/libc.conf
sudo ldconfig

# delete files with size == 0
find /tmp -size 0 -print0 | xargs -0 rm
find . -size 0 -delete

### calendar

cal -3         # Display a calendar
cal 9 1752     # Display a calendar for a particular month year
date -d fri    # What date is it this friday. See also day

date --date='25 Dec' +%A # What day does xmas fall on, this year
date --date='@2147483647' # Convert seconds since the epoch (1970-01-01 UTC) to date
TZ='America/Los_Angeles' date # What time is it on west coast of US (use tzselect to find TZ)
date --date='TZ="America/Los_Angeles" 09:00 next Fri' # The local time for 9AM next Friday on west coast US

### mail and scheduler
echo "mail -s 'get the train' P@draigBrady.com < /dev/null" | at 17:45 # Email reminder
echo "DISPLAY=$DISPLAY xmessage cooker" | at "NOW + 30 minutes"        # Popup reminder

##########################################
### recode (iconv, dos2unix, unix2dos) ###
##########################################
recode -l | less               # Show available conversions (aliases on each line)
recode windows-1252.. __FILE__ # Windows "ansi" to local charset (with CRLF conversion)
recode utf-8/CRLF.. __FILE__                   # Windows utf8 to local charset
recode iso-8859-15..utf8 file_to_change.txt    # Latin9 (western europe) to utf8 
recode ../b64 __FILE__ __FILE_Base64__         # Base64 encode
recode -lf windows-1252 | grep euro            # Lookup table of characters

### images
# mount the cdrom image at /mnt/dir (read only) 
mount -o loop cdrom.iso /mnt/dir

# Create cdrom image from contents of dir 
mkisofs -V LABEL -r dir | gzip > cdrom.iso.gz

# Search for text in files 
grep --color -rnw '/path' -e 'pattern'
grep --color --include=\*.{c,h} -rnw '/path' -e "pattern"
grep --exclude=\*.o -rnw '/path/to/somewhere/' -e "pattern"
grep --exclude-dir={dir1,dir2,*.dst} -rnw '/path/to/somewhere/' -e "pattern"
rg 

find -name '*.[ch]' | xargs grep -E 'expr'		# Search 'expr' in this dir and below. See also findrepo
find -type f -print0 | xargs -r0 grep -F 'example'	# .. regular files for 'example' in this dir and below
find -maxdepth 1 -type f | xargs grep -F 'example'	# .. regular files for 'example' in this dir
find -maxdepth 1 -type d | while read dir; do echo $dir; echo cmd2; done	Process each item with multiple commands (in while loop)
locate -r 'file[^/]*\.txt'		Search cached index for names. This re is like glob *file*.txt
grep --color reference /usr/share/dict/words		Highlight occurances of regular expression in dictionary

find dir/ -name '*.txt' | tar -c --files-from=- | bzip2 > dir_txt.tar.bz2	Make archive of subset of dir/ and below
find dir/ -name '*.txt' | xargs cp -a --target-directory=dir_txt/ --parents	Make copy of subset of dir/ and below

###############
### Replace ###
###############

sed 's/string1/string2/g' in > out  # Modify anystring1 to anystring2
sed s/\(.*\)1/\12/g in > out      # Remove comments and blank lines
sed 's/[ \t]*$//' __FILE__       # Remove trailing spaces from lines
sed -i 's/xx/yy/g' __FILE__                  # replace file
sed "s/ones/one's/"               # single quote

cat file | sed -n '1000{p;q}'	# Print 1000th line of file
sed -n '10,20p;20q'				# Print lines 10 to 20
sed 42d in    # Delete a particular line

