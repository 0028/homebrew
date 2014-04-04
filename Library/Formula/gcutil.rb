require 'formula'

class Gcutil < Formula
  homepage 'https://developers.google.com/compute/docs/gcutil/'
  url 'https://dl.google.com/dl/cloudsdk/release/artifacts/gcutil-1.15.0.zip'
  sha1 '3ef940bda17469e742f77f5c0918613c5377f058'

  bottle do
    cellar :any
    sha1 "30b2578be810f08607d828b9a4e5d7130ccfee66" => :mavericks
    sha1 "b3ecb0ebb9edfe178bdee5f59ce76f3601e8a937" => :mountain_lion
    sha1 "e0ea7539fd6103c5b657b56d97c031e448d3b268" => :lion
  end

  def install
    libexec.install 'gcutil', 'lib'
    bin.install_symlink libexec/"gcutil"
  end

  test do
    system "#{bin}/gcutil", "version"
  end
end
