require 'formula'

class Sqlcipher < Formula
  homepage "http://sqlcipher.net"
  url 'https://github.com/sqlcipher/sqlcipher/archive/v3.0.0.tar.gz'
  sha1 '7069b9ff8136de053693e018a58f59f118fcfe77'

  bottle do
    cellar :any
    sha1 'ea44a38183fe01a5ea3a0c0877bca298e3ec7c64' => :mavericks
    sha1 '379cc440e2eb67f7f245639b6adac799f0b03909' => :mountain_lion
    sha1 'bdab66aa918180985bb42cc70d1beb8a79099658' => :lion
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
