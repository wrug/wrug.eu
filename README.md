# WRUG Website

Jekyll-powered website of [Warsaw Ruby Users Group](http://wrug.eu).

## Testing with Vagrant box 

If You're familiar with Vagrant & have it installed on your computer, then You can use preconfigured vagrant box 
for development/site changes without necessity of taking care about installing jekyll and all it's dependencies 
(Vagrant will do it for You). 

All you need to do in that case is:

    git clone https://github.com/wrug/wrug.eu.git
    # OR: git clone https://github.com/#{your_fork}/wrug.eu.git
    cd wrug.eu
    vagrant up
    vagrant ssh
    # Now You're on Vagrant Box
    cd /vagrant
    # Run this website
    jekyll serve --detach --host=0.0.0.0
 
Now You can go to [http://localhost:4000](http://localhost:4000) with your favourite webbrowser on your favourite OS :)

----