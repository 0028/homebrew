require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  # Please only update to versions that are published on PyPi as there are too
  # many releases for us to update to every single one:
  # https://pypi.python.org/pypi/youtube_dl
  url 'https://yt-dl.org/downloads/2014.03.04.1/youtube-dl-2014.03.04.1.tar.gz'
  sha1 '139a6ef949cf873239c25296a2ea31bbf9f52ebe'

  bottle do
    cellar :any
    sha1 "5f682e4ba33f37e3a6b85bb07eb4ec0fcaadb968" => :mavericks
    sha1 "138016ef4b5084914a86734d35715aaec472befa" => :mountain_lion
    sha1 "31c333b06d48fa96300114da0436cce256cd2ffb" => :lion
  end

  depends_on 'rtmpdump' => :optional

  def install
    system "make", "youtube-dl", "PREFIX=#{prefix}"
    bin.install 'youtube-dl'
    man1.install 'youtube-dl.1'
    bash_completion.install 'youtube-dl.bash-completion'
  end

  def caveats
    "To use post-processing options, `brew install ffmpeg`."
  end

  test do
    system "#{bin}/youtube-dl", '--simulate', 'http://www.youtube.com/watch?v=he2a4xK8ctk'
  end
end
