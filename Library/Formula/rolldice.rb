require 'formula'

class Rolldice < Formula
  homepage 'https://github.com/sstrickl/rolldice'
  url 'https://github.com/sstrickl/rolldice/archive/v1.14.tar.gz'
  sha1 '56d1abbf6d84b3392f51c2c5a25c7227c2835c5b'

  bottle do
    cellar :any
    sha1 "e6559a4a7077afa5a6290f37bf18a2b2d7690352" => :mavericks
    sha1 "c04d9853830a70584bf0de657ea23d2ef7b06512" => :mountain_lion
    sha1 "664174ecb2441fbce42e0c5c2df7a0106cef4376" => :lion
  end

  def install
    system "make", "CC=#{ENV.cc}"
    bin.install "rolldice"
    man6.install gzip("rolldice.6")
  end

  test do
    output = `#{bin}/rolldice -s 1x2d6`
    assert output.include?("Roll #1")
    assert_equal 0, $?.exitstatus
  end
end
