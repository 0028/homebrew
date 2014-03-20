require 'formula'

class SshCopyId < Formula
  homepage 'http://www.openssh.com/'
  url 'http://ftp.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.6p1.tar.gz'
  bottle do
    cellar :any
    sha1 "0398cac14679dcd85df538b1e1d8a1009ede1d83" => :mavericks
    sha1 "2709f5d81e42585a938436ece61022253fed329c" => :mountain_lion
    sha1 "be3468711827d5f76dd3dc4ec319559b599555c3" => :lion
  end

  mirror 'http://ftp3.usa.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-6.6p1.tar.gz'
  version '6.6p1'
  sha1 'b850fd1af704942d9b3c2eff7ef6b3a59b6a6b6e'

  def install
    bin.install 'contrib/ssh-copy-id'
    man1.install 'contrib/ssh-copy-id.1'
  end
end
