require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.1.4.tar.gz'
  sha1 '103571338e9bbbc8fe4acb3f0b474691a591ddf4'

  bottle do
    cellar :any
    sha1 '8640452db9399bf8d81aaee87a09cb154b8d12ad' => :mavericks
    sha1 '3f2948d897c54510ade90b521581b7eacb689d88' => :mountain_lion
    sha1 '9518b9f01fd12c476c64900f6468065970d1db8a' => :lion
  end

  def install
    bin.install 'q'
  end
end

