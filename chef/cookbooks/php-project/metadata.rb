name             'php-project'
maintainer       'Stephen C. Van Dahm'
maintainer_email 'code@vandahm.com'
license          'Drive it like you stole it.'
description      'Installs a working PHP environment for young Wyatt'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "apache2"
depends "mysql"
depends "php"
depends "database"