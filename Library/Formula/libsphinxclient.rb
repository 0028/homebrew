require 'formula'

class Libsphinxclient < Formula
  homepage 'http://www.sphinxsearch.com'
  url 'http://sphinxsearch.com/files/sphinx-2.1.3-release.tar.gz'
  sha1 'f558dd2b96dabf26f533f5982bf1784582bf6f32'

  head 'http://sphinxsearch.googlecode.com/svn/trunk/'

  bottle do
    cellar :any
    sha1 '2fdddcc0e4183f1724fd87ee93664d635ebcff80' => :mavericks
    sha1 '1016bfccfd6ad0e0dad6f6fde0516ca86038ed2e' => :mountain_lion
    sha1 '474c6b36d6e35560d23328679bf3d0ada2a70203' => :lion
  end

  devel do
    url 'http://sphinxsearch.com/files/sphinx-2.2.1-beta.tar.gz'
    sha1 'dccaa7d14f71cec8fe6dfdb059315856c0712885'
  end

  def install
    Dir.chdir "api/libsphinxclient"

    # libsphinxclient doesn't seem to support concurrent jobs:
    #  https://bbs.archlinux.org/viewtopic.php?id=77214
    ENV.j1

    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end
end
