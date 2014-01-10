require 'formula'

class Q < Formula
  homepage 'https://github.com/harelba/q'
  url 'https://github.com/harelba/q/archive/1.1.2.tar.gz'
  sha1 '35fbae09322602abf0fd6da26406f0f6bbc7871a'

  bottle do
    cellar :any
    sha1 'b1487a722c5a5afbfcf989e550e69eaadd643060' => :mavericks
    sha1 'c73a9f1cacb056685cd2f9edaf2c8273f31e8dc8' => :mountain_lion
    sha1 'f60259a039a5f17a5e976ad3c383f5ba380518f8' => :lion
  end

  def install
    bin.install 'q'
  end
end

