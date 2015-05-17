# Import the version ($version) and tag ($tag).
. drupal_version.txt

# Install all the parts packages required
parts install php5 php5-apache2 php5-pdo-mysql php5-gd php5-zlib php5-pcntl mysql composer

# Get the latest version of composer
composer selfupdate

# Put the Codio startup script in place to make sure apache and mysql are
# started each time the box is accessed.
cp -pr ./startup.sh ../workspace/

# Ensure that Mysql and Apache are running
parts start mysql apache2

# Run everything for the Database
mysql -u root < ./create_database.sql

# Check to see if there is any code in workspace yet

if [ ! -f /home/codio/test/index.php ]; then
  # Fetch Drupal, get 8.x and create a master branch
  cd /home/codio/workspace
  git remote add drupal http://git.drupal.org/project/drupal.git

  if [ "" == "$tag" ]; then
    git fetch drupal $branch
    git checkout $branch
    git pull drupal $branch
    git checkout -b master
  else
    git fetch drupal -t
    git checkout $tag                                                                                     
  fi              

  # Pull in the standard git ignores 
  cp -p example.gitignore .gitignore
fi

# Install drush
cd /home/codio
git clone https://github.com/drush-ops/drush.git
cd drush
composer install

# Make drush globally available
# Todo: it woud be nicer if drush could be installed with composer global install
#   but that doesn't appear to work on Codio
cd /home/codio/.parts/bin 
ln -s /home/codio/drush/drush drush

cd /home/codio/workspace

# Install Drupal
drush -y si standard --db-url=mysql://drupal:drupal@localhost/drupal --site-name=drupal.codio --account-name=admin --account-pass=admin --account-mail=admin@drupal8.codio


