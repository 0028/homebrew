require 'formula'

class SshCopyId < Formula
  homepage 'http://www.openssh.com/'
  url 'http://ftp5.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.4p1.tar.gz'
  bottle do
    cellar :any
    sha1 '36c7801014df3f4aea5e8f82a1f9d3bd4cedaf14' => :mavericks
    sha1 '819d03ac434001736b4b72c7c4b9a72932c40dbd' => :mountain_lion
    sha1 'a201c94fca12531b8fed9cba96a791a6fc591215' => :lion
  end

  mirror 'http://ftp3.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.4p1.tar.gz'
  version '6.4p1'
  sha1 'cf5fe0eb118d7e4f9296fbc5d6884965885fc55d'

  def install
    bin.install 'contrib/ssh-copy-id'
    man1.install 'contrib/ssh-copy-id.1'
  end
end
