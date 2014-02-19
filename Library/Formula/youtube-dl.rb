require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.19.1/youtube-dl-2014.02.19.1.tar.gz'
  sha1 '6d02e9b07ffee6b898349bc2532d0ab9e653f6d4'

  bottle do
    cellar :any
    sha1 "3011f2fe039c2222b0ff01945d77ed7dc7ce4e30" => :mavericks
    sha1 "70b2ef3c54eec2f207b790e99f53e89c0ff356af" => :mountain_lion
    sha1 "1a4a6738c85ecc82956da06eaf6cb4d8ed16d70c" => :lion
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
