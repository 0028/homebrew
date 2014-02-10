require 'formula'

class Cowsay < Formula
  homepage 'http://www.nog.net/~tony/warez/cowsay.shtml'
  url 'http://ftp.acc.umu.se/mirror/cdimage/snapshot/Debian/pool/main/c/cowsay/cowsay_3.03.orig.tar.gz'
  sha1 'cc65a9b13295c87df94a58caa8a9176ce5ec4a27'

  bottle do
    sha1 "6bc981fc9d151b03d0b6615ada952830f3c83dca" => :mavericks
    sha1 "ee91318fb7c4e951cdbe8c88530717a3f0ba1d82" => :mountain_lion
    sha1 "62d1540fa29aa9089976ba0bd3d065ac476caf97" => :lion
  end

  # Official download is 404:
  # url 'http://www.nog.net/~tony/warez/cowsay-3.03.tar.gz'

  def install
    system "/bin/sh", "install.sh", prefix
    mv prefix/'man', share
  end

  test do
    output = `#{bin}/cowsay moo`
    assert output.include?("moo")  # bubble
    assert output.include?("^__^") # cow
    assert_equal 0, $?.exitstatus
  end
end
