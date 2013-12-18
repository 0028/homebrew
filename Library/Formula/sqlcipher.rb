require 'formula'

class Sqlcipher < Formula
  homepage "http://sqlcipher.net"
  url 'https://github.com/sqlcipher/sqlcipher/archive/v3.0.1.tar.gz'
  sha1 '9cec88e5a6e59058e675d37bbd4b0899689f9956'

  bottle do
    cellar :any
    sha1 '0b3331ee381a45372667394af1c666017e6c8987' => :mavericks
    sha1 '2f0479591573da397e972216454cbedfd45000d3' => :mountain_lion
    sha1 'a5741ff811d8a789b9abd8e112451701e1379d15' => :lion
  end

  head "https://github.com/sqlcipher/sqlcipher.git"

  keg_only "SQLCipher conflicts with the system and Homebrew SQLites."

  def install
    system "./configure", "--prefix=#{prefix}", "--enable-tempstore=yes",
                          "CFLAGS=-DSQLITE_HAS_CODEC", "LDFLAGS=-lcrypto",
                          "--disable-tcl"
    system "make"
    system "make install"
  end
end
