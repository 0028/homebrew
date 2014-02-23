require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.22.1/youtube-dl-2014.02.22.1.tar.gz'
  sha1 '01612b25b7e9930fb5f720bb6e4a6f01a376e4e0'

  bottle do
    cellar :any
    sha1 "67a8ba581c65863fa5816d1148d14abdaec0052e" => :mavericks
    sha1 "da05b7cc7b09da5a4dd271cb9dea4b2bea6e2289" => :mountain_lion
    sha1 "ae90ca95fceee10640bf1cc036e5948cabdc67bb" => :lion
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

  def test
    system "#{bin}/youtube-dl", '--simulate', 'http://www.youtube.com/watch?v=he2a4xK8ctk'
  end
end
