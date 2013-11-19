require 'formula'

class Check < Formula
  homepage 'http://check.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/check/check/0.9.11/check-0.9.11.tar.gz'
  sha1 '84b5af72dd49df4ac837645d117ce9126535d549'

  bottle do
    cellar :any
    sha1 '23ab6d9dc64968722c7b9a901724972a93605643' => :mavericks
    sha1 'bcf3f1fb67390a77f5e4c3e00d82e5ebdd511377' => :mountain_lion
    sha1 '8066831645bc7b98687065436ee254bdaff8f7d4' => :lion
  end

  option :universal

  def install
    ENV.universal_binary if build.universal?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end
end
