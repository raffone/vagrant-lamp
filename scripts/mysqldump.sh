#!/bin/bash

arr=['tannico','formazioneturismo_forum','formazioneturismo','formazioneturismo_backup','pintereddit'];

for I in $(mysql -u root -pvagrant -e 'show databases' -s --skip-column-names);
do

  if [[ "${arr[@]}" =~ "${I}" || "${arr[${#arr[@]}-1]}" == "${I}" ]]; then
    echo "skipped $I";
  else
    echo "saved $I";
    mysqldump -u root -pvagrant --single-transaction --quick $I | gzip > "/vagrant/databases/$I.sql.gz";
  fi

done

#mysqldump -u root -pvagrant --single-transaction --quick --all-databases | gzip > "/vagrant/databases/all.sql.gz";
