require 'formula'

class Libtomcrypt < Formula
  homepage 'http://libtom.org/?page=features&whatfile=crypt'
  url 'http://libtom.org/files/crypt-1.17.tar.bz2'
  sha256 'e33b47d77a495091c8703175a25c8228aff043140b2554c08a3c3cd71f79d116'

  bottle do
    cellar :any
    sha1 "155eb3c1e06a60c4e7eee8459fdccf48a5d3fd7e" => :mavericks
    sha1 "4af2323b18d2da7a6e572001fd6c2f31c9c11cf5" => :mountain_lion
    sha1 "58dc6ebe031a967bd191c51067b3ed759071e6ee" => :lion
  end

  depends_on 'libtommath'

  def install
    ENV['DESTDIR'] = prefix
    ENV['CFLAGS'] += "-DLTM_DESC -DUSE_LTM"
    ENV['EXTRALIBS'] = "-ltommath"

    system "make library"
    include.install Dir['src/headers/*']
    lib.install 'libtomcrypt.a'

  end
end
