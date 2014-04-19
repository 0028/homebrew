require 'formula'

class SvtplayDl < Formula
  homepage 'https://github.com/spaam/svtplay-dl'
  url 'https://github.com/spaam/svtplay-dl/archive/0.9.2014.04.01.tar.gz'
  sha1 '817a7c60abfb0a32a00e7e3ffe16fae3cc59d49f'

  bottle do
    cellar :any
    sha1 "fee8203b4910e28deff482151e6e392fd72071c0" => :mavericks
    sha1 "5ba41604583566c64b3f01b8c59ab139a9fbb045" => :mountain_lion
    sha1 "a7098e199ea55888aeda7d00d72f7b950f37bbb9" => :lion
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
