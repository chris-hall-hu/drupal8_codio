# Introduction

A simple script and sql to install the latest version of Drupal 8 code via Drush on a Codio box.

Really it is just performing all the steps on [This blog post](http://running-on-drupal8.co.uk/node/20) with few minor improvements eg:

 - create a master branch for local development
 - copy example.gitignore to .gitignore
 
Aiming to save a few mins, mostly for me but might help others to get started quickly as there are a few minor elements that make developing on a Codio box a little different from a regular server.

## Instructions 

Start a new codio project as empty template (NOT the default HTML Boilerplate).

Open a terminal via ```Tools -> Terminal```

Move outside your regular project workspace ```cd /home/codio```

Clone this project ```git clone https://github.com/chris-hall-hu/drupal8_codio```

Move into the new directory and run the script: 

```
cd drupal8_codio
./drupal8_codio_install.sh
```

You can either watch all the scrolly bits or you may almost have time to make a quick coffee. 

Hopefully when finished you will have all the Drupal files in the file browser on the left (works against your /home/codio/workspace directory where Drupal has been installed). You can also play with the Drupal site by selecting Box URL from the most right hand menu.

##TODO

 - Make this a bit smarter, actually check you are on a codio box etc. etc.
 - Add some options for alternative git repos of Drupal code.
 - Add a reset script to write a new install of Drupal over the existing one.


