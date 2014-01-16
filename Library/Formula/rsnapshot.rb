require 'formula'

class Rsnapshot < Formula
  homepage 'http://rsnapshot.org'
  url 'http://rsnapshot.org/downloads/rsnapshot-1.3.1.tar.gz'
  sha1 'a3aa3560dc389e1b00155a5869558522c4a29e05'

  head 'cvs://:pserver:anonymous:@rsnapshot.cvs.sourceforge.net:/cvsroot/rsnapshot:rsnapshot'

  bottle do
    sha1 '767de92772a7b1e886f28165c2768eed583bec3c' => :mavericks
    sha1 '82cbc8c852d8dfbc1695475501e1d242797e5f36' => :mountain_lion
    sha1 '2db00af346c37972eb6d73f7bae6320a6b479d03' => :lion
  end

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end
end
