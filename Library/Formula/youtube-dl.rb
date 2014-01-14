require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.01.08/youtube-dl-2014.01.08.tar.gz'
  sha1 'f4506b544b583268fc220c71aaa6359b8a712e09'

  bottle do
    cellar :any
    sha1 'af1b8c70bc3c4cb958f3f5a05977abcf683dcf13' => :mavericks
    sha1 'be995a1ea33c228f7f65a957c72690cc4c3c83c6' => :mountain_lion
    sha1 '6c504cd44469d97b37a0125e763b3dda2a096f29' => :lion
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

  def test
    system "#{bin}/youtube-dl", '--simulate', 'http://www.youtube.com/watch?v=he2a4xK8ctk'
  end
end
