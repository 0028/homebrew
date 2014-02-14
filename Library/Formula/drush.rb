require 'formula'

class Drush < Formula
  homepage 'https://github.com/drush-ops/drush'
  head 'https://github.com/drush-ops/drush.git'
  url 'https://github.com/drush-ops/drush/archive/6.2.0.tar.gz'
  sha1 '7e13d5264f362ec09efbe8218e13dcd646ba75b3'

  bottle do
    sha1 "c3438401ab86080f793323fca11aa8002567e107" => :mavericks
    sha1 "6d8d1248f5a1c81d7ab1f8c8a80b2c6f9febd202" => :mountain_lion
    sha1 "4ccded25e119806c7e8fc7cbca492389d5098bd2" => :lion
  end

  def install
    prefix.install_metafiles
    libexec.install Dir['*'] -['drush.bat']
    (bin+'drush').write <<-EOS.undent
      #!/bin/sh

      export ETC_PREFIX=${ETC_PREFIX:=#{HOMEBREW_PREFIX}}
      export SHARE_PREFIX=${SHARE_PREFIX:=#{HOMEBREW_PREFIX}}

      exec "#{libexec}/drush" "$@"
    EOS
    bash_completion.install libexec/'drush.complete.sh' => 'drush'
  end
end
