require 'formula'

class Libpcl < Formula
  homepage 'http://xmailserver.org/libpcl.html'
  url 'http://xmailserver.org/pcl-1.12.tar.gz'
  sha1 'a206c8fb5a96e65005f414ac46aeccd4b3603c8d'

  bottle do
    cellar :any
    sha1 '860270f121d6232f5693155c79192d8343854bd7' => :mavericks
    sha1 'b5abdb8db37bbf9951c116e76f213236a2e81d6e' => :mountain_lion
    sha1 '200f39fdcd00117a022f5009eab526d7bbe57aca' => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
