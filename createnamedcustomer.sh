#!/bin/bash


echo "checking ${1}..."
if [ -d "/srv/vhosts/${1}" ];
then
   echo "${1} exists...checking files...";
   if [ -d "/srv/vhosts/${1}/logs" ];
   then
      echo "${1}/logs exists..."
   else
      echo "creating ${1}/logs"
      mkdir /srv/vhosts/${1}/logs
   fi

   if [ -d "/srv/vhosts/${1}/public_html" ];
   then
      echo "${1}/public_html exists..."
      if [ -e "/srv/vhosts/${1}/public_html/index.html" ];
      then
         echo "${1}/public_html/index.html exists..."
      else
         echo "creating ${1}/public_html/index.html..."
         cp /srv/customertemplate/index.html /srv/vhosts/${1}/public_html/index.html
      fi
   else
      echo "creating ${1}/public_html..."
      mkdir /srv/vhosts/${1}/public_html
      echo "creating ${1}/public_html/index.html..."
      cp -p /srv/customertemplate/index.html /srv/vhosts/${1}/public_html/index.html
   fi
else
   echo "creating ${1}..."
   mkdir /srv/vhosts/${1};
   mkdir /srv/vhosts/${1}/logs;
   mkdir /srv/vhosts/${1}/public_html
   cp -p /srv/customertemplate/index.html /srv/vhosts/${1}/public_html/index.html
fi
echo "${1} finished."
echo "script finished."
