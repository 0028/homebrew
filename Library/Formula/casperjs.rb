require 'formula'

class Casperjs < Formula
  homepage 'http://www.casperjs.org/'
  url 'https://github.com/n1k0/casperjs/archive/1.0.4.tar.gz'
  sha1 '4e1bdbf2ce93506b6c0d193c90a6f9bcd58c6254'

  bottle do
    cellar :any
    sha1 '961f9fbd6be5e173197c3ed45503f274e4b8caed' => :mavericks
    sha1 '47ecd50baf77a1e790404b40bedb9d903334f843' => :mountain_lion
    sha1 'd245f47572e9665512a28814ce9ad205c796a4c5' => :lion
  end

  devel do
    url 'https://github.com/n1k0/casperjs/archive/1.1-beta2.tar.gz'
    sha1 'bb45f98c0196b1e6d47bd9969436abd2e888cd96'
    version '1.1-beta2'
  end

  head 'https://github.com/n1k0/casperjs.git'

  depends_on 'phantomjs'

  def install
    libexec.install Dir['*']
    bin.install_symlink libexec+'bin/casperjs'
  end
end
