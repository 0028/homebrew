require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.06.2/youtube-dl-2014.02.06.2.tar.gz'
  sha1 '87c5fabdf3e2913aa69c62ea15df00e71c116bfc'

  bottle do
    cellar :any
    sha1 "8b7c303b82b48a89a767b76e15058d690d1d999e" => :mavericks
    sha1 "000263fdf00c9fe0fddbf104099a6e2d6d29b76a" => :mountain_lion
    sha1 "b7ad1cdc631b46d8904b6dbf74b584c5e02b2267" => :lion
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
