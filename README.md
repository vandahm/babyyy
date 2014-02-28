# Sample Chef and Vagrant setup #

This is a tiny project to demonstrate Chef and Vagrant to Wyatt, and possibly others at CaringBridge. This way, Wyatt won't have to squander what's left of his youth in a futile effort to get OS X's Apache to work like it does on every other Unix system.

## Installation ##

    git clone https://github.com/vandahm/babyyy.git
    cd babyyy
    php composer.phar install
    vagrant up
    echo '192.168.90.131 wyatt.dev' | sudo tee -a /etc/hosts

Now, visit [http://wyatt.dev/][1] in your browser.

[1]: http://wyatt.dev/



