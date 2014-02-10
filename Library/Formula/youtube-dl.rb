require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.10/youtube-dl-2014.02.10.tar.gz'
  sha1 '84668a44e9864bdae81ec9020b9b817bc2ffd538'

  bottle do
    cellar :any
    sha1 "11acf47f1c54d27fefa72f986773efb502cdf322" => :mavericks
    sha1 "1b44fce921babcc8a2ba32fc6c438a02701bfee9" => :mountain_lion
    sha1 "47be5867bf0046620217b1ba643858de3ad9f58d" => :lion
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
