#!/bin/bash

for i in {1..5}
do
   echo "checking customer${i}..."
   if [ -d "/srv/vhosts/customer${i}" ];
   then
      echo "customer${i} exists...checking files...";
      if [ -d "/srv/vhosts/customer${i}/logs" ];
      then
         echo "customer${i}/logs exists..."
      else
         echo "creating customer${i}/logs"
         mkdir /srv/vhosts/customer${i}/logs
      fi

      if [ -d "/srv/vhosts/customer${i}/public_html" ];
      then
         echo "customer${i}/public_html exists..."
         if [ -e "/srv/vhosts/customer${i}/public_html/index.html" ];
         then
            echo "customer${i}/public_html/index.html exists..."
         else
            echo "creating customer${i}/public_html/index.html..."
            cp /srv/customertemplate/index.html /srv/vhosts/customer${i}/public_html/index.html
         fi
      else
         echo "creating customer${i}/public_html..."
         mkdir /srv/vhosts/customer${i}/public_html
         echo "creating customer${i}/public_html/index.html..."
         cp -p /srv/customertemplate/index.html /srv/vhosts/customer${i}/public_html/index.html
      fi
   else
      echo "creating customer${i}..."
      mkdir /srv/vhosts/customer${i};
      mkdir /srv/vhosts/customer${i}/logs;
      mkdir /srv/vhosts/customer${i}/public_html
      cp -p /srv/customertemplate/index.html /srv/vhosts/customer${i}/public_html/index.html
   fi
   echo "customer${i} finished."
done

echo "script finished."
