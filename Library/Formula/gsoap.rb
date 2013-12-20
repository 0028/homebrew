require 'formula'

class Gsoap < Formula
  homepage 'http://www.cs.fsu.edu/~engelen/soap.html'
  url 'http://downloads.sourceforge.net/project/gsoap2/gSOAP/gsoap_2.8.17.zip'
  sha1 'd6c483ea2eabade138d71d005300be909be9a274'

  bottle do
    cellar :any
    sha1 '7aa2c42af0f60e5f7598adc43b9bd1031760647e' => :mavericks
    sha1 '9ac1b0bc4cc4f9285ad28439a7429f9e9663c93b' => :mountain_lion
    sha1 '5381a17b0b135f29186618c0dd1998150249ab68' => :lion
  end

  def install
    ENV.deparallelize
    system './configure', "--prefix=#{prefix}"
    system 'make install'
  end

  def test
    system "#{bin}/soapcpp2", "-v"
  end
end
