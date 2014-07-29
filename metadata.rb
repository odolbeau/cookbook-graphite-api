name             'graphite-api'
maintainer       'Olivier Dolbeau'
maintainer_email 'odolbeau@gmail.com'
license          'Apache 2.0'
description      'Installs graphite-api'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.1.0'

recipe 'graphite-api', 'Installs graphite-api.'

supports 'debian'
supports 'ubuntu'

depends 'build-essential'
depends 'python'
depends 'packagecloud'
depends 'python'
