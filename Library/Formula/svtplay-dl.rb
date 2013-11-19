require 'formula'

class SvtplayDl < Formula
  homepage 'https://github.com/spaam/svtplay-dl'
  url 'https://github.com/spaam/svtplay-dl/archive/0.9.2013.11.15.tar.gz'
  sha1 '62e5d3e9c3fbdf3f27c230500c8790c187b240d5'

  bottle do
    cellar :any
    sha1 '4696dbeb5c6253992c23ae0ff467574d7ac4ffc1' => :mavericks
    sha1 'c5f311e4d12e89d98bca914fda5c35bda51e3eea' => :mountain_lion
    sha1 'c284142084621889e2289d928c3595f765dd8aa7' => :lion
  end

  depends_on 'rtmpdump'

  def install
    bin.install 'svtplay-dl'
  end

  def caveats; <<-EOS.undent
    You need PyCrypto (https://www.dlitz.net/software/pycrypto/) to
    download encrypted HLS streams.
    You need PyAMF (http://www.pyamf.org/) for kanal5play.se.
    EOS
  end
end
