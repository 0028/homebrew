require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.01.23.4/youtube-dl-2014.01.23.4.tar.gz'
  sha1 '39c047d26f61dc0910f5cb2f72778a4cacec5ee4'

  bottle do
    cellar :any
    sha1 "35af1aeff2df74d698fe0ba6924474c094887081" => :mavericks
    sha1 "c73efa6ec1754a9bb392e5db47a0d3a0a351a837" => :mountain_lion
    sha1 "f54210bc8f1c3dc8e22afe0ae2120f4b7938caa2" => :lion
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
