require 'formula'

class Md5deep < Formula
  homepage 'http://md5deep.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/md5deep/md5deep/md5deep-4.3/md5deep-4.3.tar.gz'
  sha1 'b9dd6444f07c9fc344ebef201baebdf71bda337f'

  bottle do
    cellar :any
    sha1 "1eec0ef8b6c8acf311aac9fc705549d4f5c2476d" => :mavericks
    sha1 "3d01f5de5c467ba6830b88cb5e83b78f1e285909" => :mountain_lion
    sha1 "86239596e42d7d0beb5bcdad563b23b95c62f4cb" => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system bin/"md5deep", "-h"
    system bin/"hashdeep", "-h"
  end
end
