require 'formula'

class Tin < Formula
  homepage 'http://www.tin.org'
  url 'ftp://ftp.tin.org/pub/news/clients/tin/v2.2/tin-2.2.0.tar.gz'
  sha1 '91293a529ae454f0506fc756325b4cfb9c5c235d'

  bottle do
    sha1 'b6bc547916d5677f888d25c0705f5b479df5040f' => :mavericks
    sha1 '59c6d27e43f722fd21123819ab8b61c775ac0f27' => :mountain_lion
    sha1 'a566c8a701238a2412410dce16efdea775838139' => :lion
  end

  conflicts_with 'mutt',
    :because => 'both install mmdf.5 and mbox.5 man pages'

  def install
    ENV.enable_warnings
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}", "--mandir=#{man}"
    system "make build"
    system "make install"
  end
end
