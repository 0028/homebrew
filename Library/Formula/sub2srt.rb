require 'formula'

class Sub2srt < Formula
  homepage 'https://github.com/robelix/sub2srt'
  url 'https://github.com/robelix/sub2srt/archive/0.5.4.tar.gz'
  sha1 '2aaaae905223b924a05978b3c52cad73d06828cc'

  bottle do
    cellar :any
    sha1 'cee7d25b7a6c85dd7adc9fbf6a469e7b75737690' => :mavericks
    sha1 '518e8d63eb98e03501e416d11f23266445e5f780' => :mountain_lion
    sha1 '9023f1edbabaa8b4517c1af3bd1b8187cbb47ca1' => :lion
  end

  def install
    bin.install 'sub2srt'
  end
end
