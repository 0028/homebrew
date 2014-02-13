require 'formula'

class Vimpager < Formula
  homepage 'https://github.com/rkitover/vimpager'
  url 'https://github.com/rkitover/vimpager/archive/1.8.5.tar.gz'
  sha1 '63b6895791dd7263bfb67c574d974d9dda017b1b'
  head 'https://github.com/rkitover/vimpager.git'

  bottle do
    cellar :any
    sha1 "518cb596b9f9aa842c4fc701692392e0470265c5" => :mavericks
    sha1 "cab21e544f86908fed81ff0232afbb001e958b8c" => :mountain_lion
    sha1 "15cb93ac734d0f3b1c4de7ed39ee381e6995199a" => :lion
  end

  def install
    inreplace 'vimpager.1', '~/bin/', ''

    bin.install 'vimcat'
    bin.install 'vimpager'
    man1.install gzip('vimpager.1')
  end

  def caveats; <<-EOS.undent
    To use vimpager as your default pager, add `export PAGER=vimpager` to your
    shell configuration.
    EOS
  end
end
