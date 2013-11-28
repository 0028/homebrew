require 'formula'

class Riemann < Formula
  homepage 'http://riemann.io'
  url 'http://aphyr.com/riemann/riemann-0.2.4.tar.bz2'
  sha1 '465965eb1c82f65872b85e685c44111a9af9f794'

  bottle do
    sha1 '11f9f613fa835b768206efeef35605e3ae22fa09' => :mavericks
    sha1 '3639485f4c7838a3ff83851da43145be73919739' => :mountain_lion
    sha1 '600aa0cd07828f4d6aea7e61f19e5bc38ee36877' => :lion
  end

  def shim_script
    <<-EOS.undent
      #!/bin/bash
      if [ -z "$1" ]
      then
        config="#{etc}/riemann.config"
      else
        config=$@
      fi
      exec "#{libexec}/bin/riemann" "$config"
    EOS
  end

  def install
    if (etc/'riemann.config').exist?
      (prefix/'etc').install 'etc/riemann.config' => 'riemann.config.guide'
    else
      etc.install 'etc/riemann.config'
    end

    # Install jars in libexec to avoid conflicts
    libexec.install Dir['*']

    (bin+'riemann').write shim_script
  end

  def caveats; <<-EOS.undent
    You may also wish to install these Ruby gems:
      riemann-client
      riemann-tools
      riemann-dash
    EOS
  end
end
