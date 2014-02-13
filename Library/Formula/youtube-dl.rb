require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.13/youtube-dl-2014.02.13.tar.gz'
  sha1 '774223160452ef2a1a21fd6432872991eac74abc'

  bottle do
    cellar :any
    sha1 "d78a5a2ad85391e7bc182f0ed4b3c0840da40db2" => :mavericks
    sha1 "b84d9dba4a9c67e8c33042b0f735d68c3b2c70f6" => :mountain_lion
    sha1 "16fcae2ec366b07a43665a5c1a33e2db342e45bb" => :lion
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
