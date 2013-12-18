require 'formula'

class Yeti < Formula
  homepage 'http://mth.github.io/yeti/'
  url 'https://github.com/mth/yeti/archive/v0.9.9.tar.gz'
  sha1 'd4b3fee9e9e1c117f1a73b147695a24a217c2658'

  head 'https://github.com/mth/yeti.git'

  bottle do
    sha1 'dfd9684dcb7e3d2e9d4fd40869e8ca72dbfddb75' => :mavericks
    sha1 'ea90a842712ae212fcc1266ac41c042c1f97e95a' => :mountain_lion
    sha1 '81800424e54c73ab12473c599906824b9ccddda7' => :lion
  end

  depends_on :ant

  def install
    system "ant jar"
    libexec.install "yeti.jar"
    bin.write_jar_script libexec/"yeti.jar", "yeti", "-server"
  end
end
