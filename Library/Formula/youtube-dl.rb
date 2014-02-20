require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.20/youtube-dl-2014.02.20.tar.gz'
  sha1 '4a39d03326b4a037d75238646282b617fae44e3c'

  bottle do
    cellar :any
    sha1 "51a5592f32338bfe65da198b604da1e40f4f2e7d" => :mavericks
    sha1 "4cc7ab1cd14b51d922c69b99aa28deb1b586894e" => :mountain_lion
    sha1 "7900b50c02acb77be6ebc151c38a21a77df21c8a" => :lion
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
