#!/usr/bin/env bash

# edit this list
BASE_SITES="reddit.com forums.somethingawful.com somethingawful.com digg.com break.com news.ycombinator.com bebo.com twitter.com facebook.com blip.com delicious.com flickr.com friendster.com hi5.com linkedin.com livejournal.com meetup.com myspace.com plurk.com stickam.com stumbleupon.com yelp.com slashdot.com vk.com lj.rossia.org afisha.ru feedly.com alpha.app.net rusplt.ru lenta.ru npr.org aljazeera.com lb.ua indiestatik.com steampowered.com steamcommunity.com"

SITES="$BASE_SITES"

HOSTFILE="/etc/hosts"

if [ ! -w $HOSTFILE ]; then
    echo "cannot write to $HOSTFILE, try running with sudo"
    exit 1
fi

# clean up previous entries from /etc/hosts
sed -i -e '/#gsd$/d' $HOSTFILE

# write hosts file if 'work' mode
if [ "$1" != "play" ]
then
    for SITE in $SITES; do
	    echo -e "127.0.0.1\t$SITE\t#gsd" >> $HOSTFILE
	    echo -e "127.0.0.1\twww.$SITE\t#gsd" >> $HOSTFILE
    done
    echo "work mode enabled, run with 'play' to disable"
else
    echo "enjoy your play time!"
fi

dscacheutil -flushcache
