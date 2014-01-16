require 'formula'

class Log4c < Formula
  homepage 'http://log4c.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/log4c/log4c/1.2.4/log4c-1.2.4.tar.gz'
  sha1 'a2795d7fcbdf5e43e1cc644893adfa725046abe8'

  head 'cvs://:pserver:anonymous:@log4c.cvs.sourceforge.net:/cvsroot/log4c:log4c'

  bottle do
    sha1 '160f737ab08affa35345c57d505802822e82d1b0' => :mavericks
    sha1 '8c912063cf7235c051de0fe00c0ec05d4e501add' => :mountain_lion
    sha1 '331107989e48a5c632b728169cefb565fee6a0ea' => :lion
  end

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/log4c-config", "--version"
  end
end
