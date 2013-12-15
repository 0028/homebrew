require 'formula'

class Mackup < Formula
  homepage 'https://github.com/lra/mackup'
  url 'https://github.com/lra/mackup/archive/0.5.4.tar.gz'
  sha1 'd194fd76f2ecfab5628104952fbca0f39ee66766'

  bottle do
    cellar :any
    sha1 '126f3e5799b1f51414f8a63f0d9f38d168916166' => :mavericks
    sha1 '7489387e29dfe603c0b11ea64a54546556d54445' => :mountain_lion
    sha1 '89d748983551bd3ec735d691ed3bae999d3b9be8' => :lion
  end

  def install
    bin.install "mackup.py" => "mackup"
    (share/'mackup').install ".mackup.cfg" => "mackup.cfg.example"
  end
end
