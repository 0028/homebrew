require 'formula'

class Mussh < Formula
  homepage 'http://mussh.sourceforge.net/'
  url 'http://downloads.sourceforge.net/project/mussh/mussh/1.0/mussh-1.0.tgz'
  sha1 'cbb11c1a846c0d92bcae0de0d12376e401aa1846'

  bottle do
    cellar :any
    sha1 '25461e8616baaa3ae4077a7140a784a0ee58faf9' => :mavericks
    sha1 'f31926179d406346f6dfdc9441a25ec35353b60c' => :mountain_lion
    sha1 '9faaa923eb15e6a2927fd87b17d0bcf93a098bf8' => :lion
  end

  def install
    bin.install 'mussh'
    man1.install 'mussh.1'
  end
end
