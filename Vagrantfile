VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"

  config.vm.provision 'shell', :inline => <<-SCRIPT, :privileged => false
    set -e
    set -x
    # apt-get stuff, all together to perform only one "update".
    PACKAGES="curl git ruby-dev libxml2-dev libxslt1-dev g++ zlib1g-dev"
    dpkg -s $PACKAGES >/dev/null || {
      sudo apt-get -y update
      sudo apt-get -y install $PACKAGES
    }
    set +x # rvm vomits a ton of output with set -x, so we silence it.
    command -v rvm >/dev/null || {
      gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
      curl -sSL https://get.rvm.io | bash -s stable
    }
    . ~/.bashrc
    . ~/.profile
    rvm --default use 2.1.5 >/dev/null || {
      rvm install 2.1.5
      rvm --default use 2.1.5
    };
    set -x
    command -v bundle >/dev/null || {
      gem install bundler
    }
    command -v beaker >/dev/null || {
      gem install beaker
    }
  SCRIPT
end
