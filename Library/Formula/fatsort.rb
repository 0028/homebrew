require 'formula'

class Fatsort < Formula
  homepage 'http://fatsort.sourceforge.net/'
  url 'https://downloads.sourceforge.net/project/fatsort/fatsort-1.3.365.tar.gz'
  sha1 '9ae5d1ab5e4c91e6725237fab1271f881c3edb59'

  bottle do
    cellar :any
    sha1 "01357625ea9b4ad727847b6001ab00e114ede782" => :mavericks
    sha1 "21dd91ffa523f58b4420eec34b6f0834d0aab273" => :mountain_lion
    sha1 "1f9b15bb79eae31e1e7572cc08f9db75884a55c4" => :lion
  end

  depends_on 'help2man'

  def install
    system "make", "CC=#{ENV.cc}"
    bin.install 'src/fatsort'
    man1.install 'man/fatsort.1'
  end
end
