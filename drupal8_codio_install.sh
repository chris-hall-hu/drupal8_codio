
# Install all the parts packages required
parts install php5 php5-apache2 php5-pdo-mysql php5-gd mysql composer

# Ensure that Mysql and Apache are running
parts start mysql apache2

# Run everything for the Data base
mysql -u root < ./create_database.sql

# Fetch Drupal
cd /home/codio/workspace
git remote add drupal8 http://git.drupal.org/project/drupal.git
git fetch drupal8 8.x
git checkout -b 8.x
git pull drupal8 8.x

# Install drush
cd /home/codio
git clone https://github.com/drush-ops/drush.git
cd drush
composer install

# Make drush globally available
cd /home/codio/.parts/bin 
ln -s /home/codio/drush/drush drush

cd /home/codio/workspace

# Install Drupal
drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal --site-name=drupal8.codio --account-name=admin --account-pass=admin --account-mail=admin@drupal8.codio

