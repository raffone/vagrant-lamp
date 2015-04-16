#!/bin/bash

gunzip < "/vagrant/databases/all.sql.gz" | mysql -uroot -pvagrant
