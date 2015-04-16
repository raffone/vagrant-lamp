#!/bin/bash

mysqldump -u root -pvagrant --single-transaction --quick --all-databases | gzip > "/vagrant/databases/all.sql.gz";
