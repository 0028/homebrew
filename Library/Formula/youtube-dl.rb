require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2013.12.26/youtube-dl-2013.12.26.tar.gz'
  sha1 '4cbd9c8ed452dea57dcc5b91469efb2525bd9469'

  bottle do
    cellar :any
    sha1 '71687d11f7cfad680ca75a344e32b117bd80eb03' => :mavericks
    sha1 '9ae3980ac187e90dfc6adac35a2feca6621b3332' => :mountain_lion
    sha1 '3758b8d0008189800c69708b18ed906d40f7f850' => :lion
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
