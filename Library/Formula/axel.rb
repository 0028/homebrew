require 'formula'

class Axel < Formula
  homepage 'http://packages.debian.org/wheezy/axel'
  url 'http://ftp.de.debian.org/debian/pool/main/a/axel/axel_2.4.orig.tar.gz'
  sha1 '6d89a7ce797ddf4c23a210036d640d013fe843ca'

  bottle do
    sha1 '707f90b9f464c125e7f8a6d72b0ea1e4ec159223' => :mavericks
    sha1 'fcd087634ad07aa5eddf78c3afc420f33dcbb63d' => :mountain_lion
    sha1 '004fbb9410b0962c7c4ce4b7ff3c1400566f2c33' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}", "--debug=0", "--i18n=0"
    system "make"
    system "make install"
  end
end
