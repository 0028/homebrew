require 'formula'

class Storm < Formula
  homepage 'https://github.com/nathanmarz/storm/wiki'
  url 'https://dl.dropboxusercontent.com/s/dj86w8ojecgsam7/storm-0.9.0.1.zip'
  sha1 '230abcc15a9e1358442429fd1c856dc12a3be920'

  bottle do
    cellar :any
    sha1 '4c9b26d5798f06c152438a514231505503b21b16' => :mavericks
    sha1 '07c34670842e8b27e6bec725e20571676d50802f' => :mountain_lion
    sha1 'e6ea006bb7749090c9fc135ffd2572dd17b2aa59' => :lion
  end

  def install
    libexec.install Dir['*']
    bin.install_symlink libexec/"bin/storm"
  end
end
