require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.17/youtube-dl-2014.02.17.tar.gz'
  sha1 '2fd2fdf732244b89b38032b610531b83029e6370'

  bottle do
    cellar :any
    sha1 "bc73e963141781cfeadf0f9f5bd2e65a7b80ec12" => :mavericks
    sha1 "383ea057158c51dd3bea84bdc02fa8e5e38eecc1" => :mountain_lion
    sha1 "5f3224bb61309ab34dac66d851e9d06ee0b2e28e" => :lion
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
