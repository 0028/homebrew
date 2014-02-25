require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.25.1/youtube-dl-2014.02.25.1.tar.gz'
  sha1 'd322895f31e06a2ff6ae5d78d620d6efb1444ec7'

  bottle do
    cellar :any
    sha1 "45d1c104d3630c17cf77b61de04d21f63fcde3fc" => :mavericks
    sha1 "87505762e7b6311d6781540175507e78ebab4c63" => :mountain_lion
    sha1 "08ef6836ce25b9f8925ef4964caaa550c90ad400" => :lion
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
