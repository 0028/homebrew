require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.24/youtube-dl-2014.02.24.tar.gz'
  sha1 'f9065de654e00e3b8daed0a454f7f65789f89067'

  bottle do
    cellar :any
    sha1 "818507cde927891167ffcf68b4fa34892c7fa66b" => :mavericks
    sha1 "9ed0cf4eda36daf2f1dd4f91b49e3ef8b9f53f49" => :mountain_lion
    sha1 "20d47cb7f6e7b53513b953749a9d89445016e8c7" => :lion
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
