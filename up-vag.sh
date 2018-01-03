#!/bin/bash
# update vagrant boxes
# bug: error when no box installed
#      'There ...'

# handle multiple providers
for b in `vagrant box list |grep -v ', 0)'|awk '{print $1i"_"$2}'|sed 's/(//'|sed 's/,//'|sort|uniq`
do 
    date
    #echo "line=" $b
    BOX=`echo $b|cut -f 1 -d '_'`
    PROV=`echo $b|cut -f 2 -d '_'`
    echo $BOX $PROV
    vagrant box update --box $BOX --provider $PROV
done


# remove old version of vagrant boxes
TMPFILE=`tempfile`
vagrant box list | sort > $TMPFILE 
first='1'
while read -r vname vtype vver || [[ -n "$vver" ]]; do
    vtype=`echo $vtype | sed -e 's/[\(\),]//g'`
    vver=`echo $vver | sed -e 's/[\(\),]//g'`
    #echo cur: $vname $vtype $vver prev: $pname $ptype $pver
    if [ .$first = '.1' ] ; then
        first=0
    else
        if ([ .$pname = .$vname ] && [ .$ptype = .$vtype ]) ; then 
            echo will try to remove older $pname $ptype version $pver and keep newer version $vver
            vagrant box remove $pname --provider $ptype --box-version $pver
        fi
    fi
    pname=$vname
    ptype=$vtype
    pver=$vver
done < $TMPFILE
rm $TMPFILE
