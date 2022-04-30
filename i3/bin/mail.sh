USER=gmail_username
PASS=password

COUNT=`curl -su $USER:$PASS https://mail.google.com/mail/feed/atom || echo "<fullcount>unknown number of</fullcount>"`
COUNT=`echo "$COUNT" | grep -oPm1 "(?<=<fullcount>)[^<]+" `
# subtract 1617 cause shits and giggle
# will be different for different google accounts
echo $COUNT
echo $COUNT

if ($COUNT-1617 -gt 0) {
            print "#FF0000";
            # exit 33;
}
