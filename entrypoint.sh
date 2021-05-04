#!/bin/bash
sed -i "s|localhost|$MYSQLIP|g" /var/www/public/config.php
apache2-foreground
