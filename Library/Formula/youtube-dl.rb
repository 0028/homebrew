require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.21.1/youtube-dl-2014.02.21.1.tar.gz'
  sha1 'e40cd96a578c93407d2691520756115a135a443c'

  bottle do
    cellar :any
    sha1 "47cbfae7e6b1c22274302fa915049f426df93c3e" => :mavericks
    sha1 "6324669bb20a70565bc822e302678656d525e1f3" => :mountain_lion
    sha1 "d9d4a7217c968686e1e801032665198aa27c3c1b" => :lion
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
