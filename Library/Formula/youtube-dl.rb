require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.01.20/youtube-dl-2014.01.20.tar.gz'
  sha1 '73e98cc1788dd8c2fca8b253fdf5061c9bc1425a'

  bottle do
    cellar :any
    sha1 "06b80b213220625ecfcfd8f906be2bcbf468cb0a" => :mavericks
    sha1 "100b422230aa7fc08417818660054d771575763e" => :mountain_lion
    sha1 "0c3e6ff50180be988291b4400990a827244a696b" => :lion
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
