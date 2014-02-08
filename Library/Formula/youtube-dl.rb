require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.08/youtube-dl-2014.02.08.tar.gz'
  sha1 '36d7afb26aed0fa1e9cadb62339185e3f1f2dd8f'

  bottle do
    cellar :any
    sha1 "87b9934e5f1b9ce636a6ed55ad8a0497f45ec505" => :mavericks
    sha1 "b44dd66a1103c012f91a8d681234b04f3f78a0a3" => :mountain_lion
    sha1 "d56a896f9497887beb0f2286bf7e19235aadd7ac" => :lion
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
