require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.04.1/youtube-dl-2014.02.04.1.tar.gz'
  sha1 '44224d35b363f8ff33f3d04fe003c9641592ac00'

  bottle do
    cellar :any
    sha1 "37abd3aa98d9c3fee62417313d0545a507bd75aa" => :mavericks
    sha1 "2423d16a00e39add816dd89b7f36ec8fd52c908e" => :mountain_lion
    sha1 "4a8cd3db3f71fd656eec0f34d0dab7940b8cf490" => :lion
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
