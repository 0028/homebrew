require 'formula'

class Lorem < Formula
  homepage 'http://code.google.com/p/lorem/'
  url 'http://lorem.googlecode.com/svn-history/r4/trunk/lorem', :using => :curl
  version '0.6.1'
  sha1 'aa6ef66e5ee1151397f19b358d772af316cf333b'

  bottle do
    cellar :any
    sha1 "6ea5fa1af4aeb3ae2c7a57326f89efa6192b3cd9" => :mavericks
    sha1 "617896156f683b1acb00eac00c79ea7dc7adea71" => :mountain_lion
    sha1 "decd35d89d870c947197156de22f7ecfc300763c" => :lion
  end

  def install
    inreplace "lorem", "!/usr/bin/python", "!/usr/bin/env python"
    bin.install "lorem"
  end

  test do
    output = `#{bin}/lorem -n 2`
    assert_equal "lorem ipsum\n", output
    assert_equal 0, $?.exitstatus
  end
end
