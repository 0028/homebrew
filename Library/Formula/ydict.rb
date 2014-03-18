require 'formula'

class Ydict < Formula
  homepage 'https://github.com/chenpc/ydict'
  url 'https://github.com/chenpc/ydict/archive/1.3.4.tar.gz'
  sha1 'e88030060d752dc5486cf0f156d3f6ec41d84a55'

  bottle do
    cellar :any
    sha1 "ba1feee2aa358c736a4525aaa23c60e731e37258" => :mavericks
    sha1 "01ecf8059f4f3d8ee2626d19dacd3838a0d13d08" => :mountain_lion
    sha1 "7c601ab8c1e721fe73029522a77dd242487d98c1" => :lion
  end

  def ydict_wrapper; <<-EOS.undent
    #!/bin/sh
    LC_ALL=en_US.UTF-8 "#{bin}/ydict.py" "$@"
    EOS
  end

  def install
    bin.install 'ydict' => 'ydict.py'
    (bin/'ydict').write(ydict_wrapper)
  end
end
