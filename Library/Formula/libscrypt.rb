require "formula"

class Libscrypt < Formula
  homepage "https://lolware.net/libscrypt.html"
  url "https://github.com/technion/libscrypt/archive/v1.18.tar.gz"
  sha1 "ff6b0cda00afcb582ca57699322b94166e5f3ab6"

  bottle do
    cellar :any
    sha1 "33a1952fb20cb58063c453b9c6b5079bb2250601" => :mavericks
    sha1 "3c953409fab9f06b95d195ef41a24cf660091cfa" => :mountain_lion
    sha1 "09f1b97211d6865a805790b7ea8fbda8590ae7db" => :lion
  end

  def install
    system "make", "install-osx", "PREFIX=#{prefix}", "LDFLAGS=", "CFLAGS_EXTRA="
    system "make", "check", "LDFLAGS=", "CFLAGS_EXTRA="
  end
end
