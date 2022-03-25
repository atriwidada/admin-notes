#!/bin/bash
# update vagrant boxes

# bug: error when no box installed
#      'There ...'

DEBUG=0

# initial box list
TMPBOXLISTINIT=$(mktemp)
vagrant box list | sort > $TMPBOXLISTINIT
if [ .$DEBUG = .1 ]; then
	echo "box list at start"
	cat $TMPBOXLISTINIT
fi

# handle multiple providers
if [ .$DEBUG = .1 ]; then
	echo "trying to update boxes"
fi
for b in `cat $TMPBOXLISTINIT|grep -v ', 0)'|awk '{print $1i"#"$2}'|sed 's/(//'|sed 's/,//'|sort|uniq`
do 
    date
    #echo "line=" $b
    BOX=`echo $b|cut -f 1 -d '#'`
    PROV=`echo $b|cut -f 2 -d '#'`
    echo $BOX $PROV
    vagrant box update --box $BOX --provider $PROV
done

# remove old version of vagrant boxes
TMPFILE=$(mktemp)
vagrant box list | sort > $TMPFILE 
if [ .$DEBUG = .1 ]; then
	echo "boxes list after update"
	cat $TMPFILE
fi
cat $TMPFILE
echo "remove old boxes"
first='1'
while read -r vname vtype vver || [[ -n "$vver" ]]; do
    vtype=`echo $vtype | sed -e 's/[\(\),]//g'`
    vver=`echo $vver | sed -e 's/[\(\),]//g'`
    # echo cur: $vname $vtype $vver prev: $pname $ptype $pver
    if [ .$first = '.1' ] ; then
        first=0
    else
        if ([ .$pname = .$vname ] && [ .$ptype = .$vtype ]) ; then 
            echo -n "will try to remove older $pname $ptype version $pver and keep newer version $vver: "
            vagrant box remove $pname --provider $ptype --box-version $pver 2>/dev/null
	    ret=$?
	    if [ .$ret != .0 ] ; then
	    # TODO find who use this box
		echo "removal failed, box is in use"
	    else
		echo "success"
	    fi
        fi
    fi
    pname=$vname
    ptype=$vtype
    pver=$vver
done < $TMPFILE

# final box list
TMPBOXLISTFIN=$(mktemp)
vagrant box list | sort > $TMPBOXLISTFIN

# list changes
if [ .$DEBUG = .1 ] ; then
	echo "boxes list before update vs after old removal"
	cat $TMPFILE
	sdiff -s $TMPBOXLISTINIT $TMPBOXLISTFIN
fi

rm $TMPFILE $TMPBOXLISTINIT $TMPBOXLISTFIN
