require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'http://youtube-dl.org/downloads/2013.11.17/youtube-dl-2013.11.17.tar.gz'
  sha1 '8590252f03fe31b2057c6d7c7c9b51b72aa06c0d'

  bottle do
    cellar :any
    sha1 'e45ef3676490be1f03a297e666a12c6d31209c57' => :mavericks
    sha1 '48e0c914e10fdc7243defb2d81869aaeb2e1cc96' => :mountain_lion
    sha1 '5d25b778daef7cbce4edceb7399309c29cfb6a52' => :lion
  end

  def install
    system "make", "youtube-dl", "PREFIX=#{prefix}"
    bin.install 'youtube-dl'
    man1.install 'youtube-dl.1'
    bash_completion.install 'youtube-dl.bash-completion'
  end

  def caveats
    "To use post-processing options, `brew install ffmpeg`."
  end
end
