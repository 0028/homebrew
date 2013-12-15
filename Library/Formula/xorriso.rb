require 'formula'

class Xorriso < Formula
  homepage 'http://www.gnu.org/software/xorriso/'
  url 'http://ftpmirror.gnu.org/xorriso/xorriso-1.3.4.tar.gz'
  bottle do
    cellar :any
    sha1 '8eb8a15ec0a240bd65734bed72bc92b914332787' => :mavericks
    sha1 '1ecfd0bbaee2aa330e3eb2e4148fbceffeed22ad' => :mountain_lion
    sha1 '350aa06f5574767b8efbaf29c0437669606ede96' => :lion
  end

  mirror 'http://ftp.gnu.org/gnu/xorriso/xorriso-1.3.4.tar.gz'
  sha1 '2478393074b821c26dbadd294158b858054d5038'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/xorriso", "--help"
  end
end
