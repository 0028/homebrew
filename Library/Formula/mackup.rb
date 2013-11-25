require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.5.3.tar.gz'
  sha1 '85b5d8fd54da99c3dfb13f420b6eedcddfc56b20'

  bottle do
    cellar :any
    sha1 '90ed444f3fffba9c5ffc0555ca0d7486fe6def0a' => :mavericks
    sha1 'f92c070764c610a0f9c1834fdb25d689377e4a5f' => :mountain_lion
    sha1 '2f75e3d45cd137757c34c8645f4e08ba8a979107' => :lion
  end

  def install
    bin.install "mackup.py" => "mackup"
    (share/'mackup').install ".mackup.cfg" => "mackup.cfg.example"
  end
end
