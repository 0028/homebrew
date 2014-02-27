require 'formula'

class PltRacket < Formula
  homepage 'http://racket-lang.org/'
  url 'https://github.com/plt/racket/archive/v6.0.tar.gz'
  sha1 'b37c26e292ac28ec5cd07ac2752ceb6698989f34'

  bottle do
    sha1 "74910d72a1937d0c25218e45d2635f86deaca63f" => :mavericks
    sha1 "4c843f89492bc64b0144d2c64fd4359e3b1fee75" => :mountain_lion
    sha1 "6e94ed444eb0f00c5a492a1348c1581d0b244929" => :lion
  end

  def install
    cd 'racket/src' do
      args = ["--disable-debug", "--disable-dependency-tracking",
              "--enable-xonx",
              "--prefix=#{prefix}" ]

      args << '--disable-mac64' if not MacOS.prefer_64_bit?

      system "./configure", *args
      system "make"
      system "make install"
    end
  end

  def caveats; <<-EOS.undent
    This is a minimal Racket distribution.
    If you want to use the DrRacket IDE, we recommend that you use
    the PLT-provided packages from http://racket-lang.org/download/.
    EOS
  end
end
