#!/bin/sh
#for b in `vagrant box list|grep -v ', 0)'|awk '{print $1}'|sort|uniq`
# handle multiple providers
for b in `vagrant box list |grep -v ', 0)'|awk '{print $1i"_"$2}'|sed 's/(//'|sed 's/,//'|sort|uniq`
do 
    date
#    echo "line=" $b
    BOX=`echo $b|cut -f 1 -d '_'`
    PROV=`echo $b|cut -f 2 -d '_'`
    echo $BOX $PROV
    #vagrant box update --box $b
    vagrant box update --box $BOX --provider $PROV
done

