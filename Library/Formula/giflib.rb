require 'formula'

class Giflib < Formula
  homepage 'http://giflib.sourceforge.net/'
  # 4.2.0 has breaking API changes; don't update until
  # things in $(brew uses giflib) are compatible
  url 'http://downloads.sourceforge.net/project/giflib/giflib-4.x/giflib-4.1.6/giflib-4.1.6.tar.bz2'
  sha1 '22680f604ec92065f04caf00b1c180ba74fb8562'

  bottle do
    cellar :any
    sha1 "b1b1927ca7e5672202bad281daeac151b7dff3d5" => :mavericks
    sha1 "7e93ba66fabc291234ea41db30b2e7b89cba6ab6" => :mountain_lion
    sha1 "71d03c88012d613269f4bfb35a4765c6701cdc3e" => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
    system "make install"
  end
end
