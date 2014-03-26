require 'formula'

class Sbuild < Formula
  homepage 'http://sbuild.org'
  url 'http://sbuild.org/uploads/sbuild/0.7.4/sbuild-0.7.4-dist.zip'
  sha1 '698306c8bad5aa32f42b9df6db30f06dba5ea5be'

  bottle do
    cellar :any
    sha1 "c80a42cfe21985cf52603e31d2175c46237b4807" => :mavericks
    sha1 "963e88f35eec84f8ee374dc41f829aaa01e8f3e5" => :mountain_lion
    sha1 "5788eca0fe9c0c6a7f6bdab18bfb381734b72276" => :lion
  end

  def install
    libexec.install Dir['*']
    system "chmod +x #{libexec}/bin/sbuild"
    bin.install_symlink libexec/"bin/sbuild"
  end

  test do
    system "#{bin}/sbuild", "--help"
  end
end
