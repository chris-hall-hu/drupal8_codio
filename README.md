# Introduction

A simple script and sql to install a chosen version of Drupal code via Drush on a Codio box, along with all the software they require. A Codio startup.sh is also copied into the workspace so that mysql and apache are started each time the Codio box is accessed.

By default the 8.0.x development branch is installed but a different tag or branch can be setup by editing the file drupal_version.txt; by entering a value for tag you can install a specific version, including older varieties of Drupal such as '7.28'.

If installing a tag version the workspace git will have a detached HEAD, when branches are installed a master branch is then created, you should be able to adapt to your own way of working with Git and Drupal.

Really it is just performing all the steps on [This blog post](http://running-on-drupal8.co.uk/node/20) with few minor improvements eg:

 - create a master branch for local development
 - copy example.gitignore to .gitignore
 - allow option to override the version tag installed in a .txt file

Aiming to save a few mins, mostly for me but might help others to get started quickly as there are a few minor elements that make developing on a Codio box a little different from a regular server.

## Instructions 

Start a new codio project as empty template (NOT the default HTML Boilerplate). **Note** Codio has made a number of changes recently, this script was last tested on the ```codio-certified / Codio Base Stack``` and worked well.

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

**NOTE**: A master branch is created, and is the branch that will be checked out initially, I prefer this approach as I can still pull in and merge changes for the Drupal dev branch if I am working against dev, but I get to choose when and if to merge that with my master (D8 changes can still break things on a daily basis). Your remote is called drupal and if you did not change the drupal_version.txt you will also have an 8.0.x branch you can switch to locally. 

##TODO

 - Make this a bit smarter, actually check you are on a codio box etc. etc.
 - Add a reset script to write a new install of Drupal over the existing one.
 - Improve messaging
 - Consider other tools that may be useful to install.



