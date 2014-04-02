require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  # Please only update to versions that are published on PyPi as there are too
  # many releases for us to update to every single one:
  # https://pypi.python.org/pypi/youtube_dl
  url 'https://yt-dl.org/downloads/2014.04.01.3/youtube-dl-2014.04.01.3.tar.gz'
  sha1 '7b44d554e80799f5872f768cb58f9a5b08307d1b'

  bottle do
    cellar :any
    sha1 "1631e1a292e18e062cb3b0d518697ff2c53f7549" => :mavericks
    sha1 "a2d9954ed81024080a87a20db81f9eaeaf652fda" => :mountain_lion
    sha1 "283d6cc2fc00199bfe4d87f2ce37b21db962c3b9" => :lion
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
