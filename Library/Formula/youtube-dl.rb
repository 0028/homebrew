require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.06.3/youtube-dl-2014.02.06.3.tar.gz'
  sha1 '4f33aebcbf184184f8baf34ac01964b3344c1062'

  bottle do
    cellar :any
    sha1 "ecc3da75407734ad2015fe5967f9738da2db0e19" => :mavericks
    sha1 "5103614a9148ca49d9f62fb24650b171e756d813" => :mountain_lion
    sha1 "fa9f0780b915f8399b825a144cca7abb2a7ca243" => :lion
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
