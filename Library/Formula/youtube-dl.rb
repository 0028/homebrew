require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.04/youtube-dl-2014.02.04.tar.gz'
  sha1 '120be66ea26168e3e5f1a0861bfab905b21782e3'

  bottle do
    cellar :any
    sha1 "05a7ffe04c5639aee6f814b10645baadbf1e7b30" => :mavericks
    sha1 "1e2e8abcb1a87c9258d64aea76d7d105ad48d3b7" => :mountain_lion
    sha1 "580c13b2cababe2b1f6b932be774dee8279af631" => :lion
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
