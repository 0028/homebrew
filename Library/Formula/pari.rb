require 'formula'

class Pari < Formula
  homepage 'http://pari.math.u-bordeaux.fr/'
  url 'http://pari.math.u-bordeaux.fr/pub/pari/unix/pari-2.5.5.tar.gz'
  sha1 '77637f935ee4a3b78e7015cef00146bd2f7e96bc'

  bottle do
    sha1 "e6a1b6f23ff8a26056772ef38242c5b68d81de55" => :mavericks
    sha1 "9fc54badf087b8a26f001cdc990da37eda57a8c2" => :mountain_lion
    sha1 "fe15d38c6eb910cdd5e2ed58cc61f3429f8458f2" => :lion
  end

  depends_on 'readline'
  depends_on :x11

  def install
    readline = Formula["readline"].opt_prefix
    system "./Configure", "--prefix=#{prefix}",
                          "--without-gmp",
                          "--with-readline=#{readline}"
    # make needs to be done in two steps
    system "make all"
    system "make install"
  end
end
