#!/bin/sh
  if [-z $LANG_SET ]; then
	  apt-get install -y locales;
	  echo "LANG=$LANG_SET" >> /etc/default/locale;
	  echo "LC_MESSAGES=$LANG_SET" >> /etc/default/locale;
	  echo "LC_COLLATE=$LANG_SET" >> /etc/default/locale;
	  echo "LC_CTYPE=$LANG_SET" >> /etc/default/locale;
	  echo "LANGUAGE=$LANG_SET" >> /etc/default/locale;
	  echo $LANG_SET|awk -F \. "{print \$0, \$2}" >> /etc/locale.gen;
	  dpkg-reconfigure -f noninteractive locales;
	fi;
	
