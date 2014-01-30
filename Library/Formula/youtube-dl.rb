require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.01.30.1/youtube-dl-2014.01.30.1.tar.gz'
  sha1 'ed4f5eb45e3d8f4d305cffa749fa62247e48cd24'

  bottle do
    cellar :any
    sha1 "5a95ee346164b28434f991672849db29a5216877" => :mavericks
    sha1 "b693a45aea35aca316e8b1597d186ed9d73f09b3" => :mountain_lion
    sha1 "ebf850391a6a42304edcdcf41f633b27c2ae9eba" => :lion
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
