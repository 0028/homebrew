require 'formula'

class SvtplayDl < Formula
  homepage 'https://github.com/spaam/svtplay-dl'
  url 'https://github.com/spaam/svtplay-dl/archive/0.9.2013.12.11.tar.gz'
  sha1 'd44eee92694b0fc2af1a0ae8a35d0a2ecfb3c09f'

  bottle do
    cellar :any
    sha1 '94f1aac4ab59a51104c6b1459da225099298a21c' => :mavericks
    sha1 '4e053d398435b78d0b84c8ebbfde7540932f23b6' => :mountain_lion
    sha1 'd3aafe29278943ed3c34c180bd90eb8a8f38930d' => :lion
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
