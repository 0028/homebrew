require 'formula'

class Chruby < Formula
  homepage 'https://github.com/postmodern/chruby#readme'
  url 'https://github.com/postmodern/chruby/archive/v0.3.8.tar.gz'
  sha1 '320d13bacafeae72631093dba1cd5526147d03cc'

  head 'https://github.com/postmodern/chruby.git'

  bottle do
    cellar :any
    sha1 'c0f97bdcf7b1455d1ab7426c4669d8070544e8b8' => :mavericks
    sha1 '897aa01cb69df2852d509dde77107bdfb94628c0' => :mountain_lion
    sha1 'cbdfc3104942e6b30021e6c56480cff4d2408905' => :lion
  end

  def install
    system 'make', 'install', "PREFIX=#{prefix}"
  end

  def caveats; <<-EOS.undent
    Add the following to the ~/.bashrc or ~/.zshrc file:

      source #{opt_prefix}/share/chruby/chruby.sh

    By default chruby will search for Rubies installed into /opt/rubies/ or
    ~/.rubies/. For non-standard installation locations, simply set the RUBIES
    variable after loading chruby.sh:

      RUBIES=(
        /opt/jruby-1.7.0
        $HOME/src/rubinius
      )

    If you are migrating from another Ruby manager, set `RUBIES` accordingly:

      RVM:   RUBIES=(~/.rvm/rubies/*)
      rbenv: RUBIES=(~/.rbenv/versions/*)
      rbfu:  RUBIES=(~/.rbfu/rubies/*)

    To enable auto-switching of Rubies specified by .ruby-version files,
    add the following to ~/.bashrc or ~/.zshrc:

      source #{opt_prefix}/share/chruby/auto.sh
    EOS
  end
end
