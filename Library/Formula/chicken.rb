require 'formula'

class Chicken < Formula
  homepage 'http://www.call-cc.org/'
  url 'http://code.call-cc.org/releases/4.8.0/chicken-4.8.0.5.tar.gz'
  sha1 'fb393e49433c183d6a97da9b1ca48cb09ed51d72'

  head 'git://code.call-cc.org/chicken-core'

  bottle do
    sha1 "67d77684aa5f328310fb4e84b156d2283b1f7fcc" => :mavericks
    sha1 "6efcb7861952b13c3dcb61f4de4afe3065a4f3cc" => :mountain_lion
    sha1 "b1cf974f74ee09d18c52f7d09eaad9634f4dc3c4" => :lion
  end

  def install
    ENV.deparallelize
    # Chicken uses a non-standard var. for this
    args = ["PREFIX=#{prefix}", "PLATFORM=macosx", "C_COMPILER=#{ENV.cc}"]
    args << "ARCH=x86-64" if MacOS.prefer_64_bit?
    system "make", *args
    system "make", "install", *args
  end

  test do
    output = `'#{bin}/csi' -e '(print (* 5 5))'`
    assert_equal "25", output.strip
    assert $?.success?
  end
end
