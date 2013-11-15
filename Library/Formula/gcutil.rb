require 'formula'

class Gcutil < Formula
  homepage 'https://developers.google.com/compute/docs/gcutil/'
  url 'https://google-compute-engine-tools.googlecode.com/files/gcutil-1.11.0.tar.gz'
  sha1 'bb68d4bd34731361e6b99f015546016b5d34bf13'

  bottle do
    cellar :any
    sha1 '32d2df096ef2071bdcc6e7cd248c51f5f35f50cc' => :mavericks
    sha1 '2d28271adc1b514943219f55d2e07bf3fcaac33a' => :mountain_lion
    sha1 'c2cd069d37d534eb1933def2f163df906376f003' => :lion
  end

  def install
    libexec.install 'gcutil', 'lib'
    bin.install_symlink libexec/"gcutil"
  end

  def test
    system "#{bin}/gcutil", "version"
  end
end
