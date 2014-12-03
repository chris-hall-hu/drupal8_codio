# Introduction

A simple script and sql to install a chosen version of Drupal code via Drush on a Codio box.

By default the 8.0.0.x development branch is installed but a different tag or branch can be setup by editing the file drupal_version.txt; by entering a value for tag you can install a specific version, including older varieties of Drupal such as '7.28'.

If installing a tag version the workspace git will have a detached HEAD, when branches are installed a master branch is then created, you should be able to adapt to your own way of working with Git and Drupal.

Really it is just performing all the steps on [This blog post](http://running-on-drupal8.co.uk/node/20) with few minor improvements eg:

 - create a master branch for local development
 - copy example.gitignore to .gitignore
 - allow option to override the version tag installed in a .txt file

There is also a [public project](https://codio.com/chris-hall-hu-cheng/Drupal-8-starter-box) on Codio.com which is the results of running this script this can be forked and woud be the quickest way to working on a Drupal 8 box on Codio. 
 
Aiming to save a few mins, mostly for me but might help others to get started quickly as there are a few minor elements that make developing on a Codio box a little different from a regular server.

## Instructions 

Start a new codio project as empty template (NOT the default HTML Boilerplate).

Open a terminal via ```Tools -> Terminal```

Move outside your regular project workspace ```cd /home/codio```

Clone this project ```git clone https://github.com/chris-hall-hu/drupal8_codio```

Move into the new directory and run the script: 

```
cd drupal8_codio
./drupal_codio_install.sh
```

You can either watch all the scrolly bits or you may almost have time to make a quick coffee. 

Hopefully when finished you will have all the Drupal files in the file browser on the left (works against your /home/codio/workspace directory where Drupal has been installed). You can also play with the Drupal site by selecting Box URL from the most right hand menu.

##TODO

 - Make this a bit smarter, actually check you are on a codio box etc. etc.
 - Add a reset script to write a new install of Drupal over the existing one.
 - Create the Codio startup script, to ensure that all required services are running.
 - Improve messaging
 - Consider other tools that may be useful to install.



