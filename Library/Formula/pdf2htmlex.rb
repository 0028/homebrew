require 'formula'

class Pdf2htmlex < Formula
  homepage 'http://coolwanglu.github.io/pdf2htmlEX/'
  url 'https://github.com/coolwanglu/pdf2htmlEX/archive/v0.11.tar.gz'
  sha256 'eca83144daf298b25c5b9bedb59d8e21ba65eb5e246d61f897447bc917ec0cba'

  head 'https://github.com/coolwanglu/pdf2htmlEX.git'

  bottle do
    sha1 "0f75b115e145b7d226c687b879b020fb1a153779" => :mavericks
    sha1 "62f49ebe04ea98afdcb72e76f1d5b69c00439dbb" => :mountain_lion
    sha1 "300e914837647d803875878b753deafb789185a3" => :lion
  end

  depends_on :macos => :lion
  depends_on 'cmake' => :build
  depends_on 'pkg-config' => :build
  depends_on 'fontforge'
  depends_on 'poppler'
  depends_on 'ttfautohint' => :recommended if MacOS.version > :snow_leopard

  def install
    system "cmake", ".", *std_cmake_args
    system "make"
    system "make install"
  end

  test do
    curl "-O", "http://partners.adobe.com/public/developer/en/xml/AdobeXMLFormsSamples.pdf"
    system "#{bin}/pdf2htmlEX", "AdobeXMLFormsSamples.pdf"
  end
end
