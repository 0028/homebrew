require 'formula'

class SvtplayDl < Formula
  homepage 'https://github.com/spaam/svtplay-dl'
  url 'https://github.com/spaam/svtplay-dl/archive/0.9.2014.02.15.tar.gz'
  sha1 '5fc82a5894ee4d24c6496b4b34db28c185f72dd2'

  bottle do
    cellar :any
    sha1 "f3d4f6165bf58ab79d3b9d65a0efa21cb44a1ddb" => :mavericks
    sha1 "10abc41b00990721534c258bd26ca9ac67ed4f3d" => :mountain_lion
    sha1 "1753814b45720eccea3bf629a1217e860096adbb" => :lion
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
