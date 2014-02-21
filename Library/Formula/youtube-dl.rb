require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.21/youtube-dl-2014.02.21.tar.gz'
  sha1 '0e083d4ab0ce7d60f663d8e877bc315e8a5f0c5d'

  bottle do
    cellar :any
    sha1 "df0c88a1f929515ff73fb9b7329155c841384692" => :mavericks
    sha1 "dfa2752dbcd26cb1dc18090c54de05f4da7db5f9" => :mountain_lion
    sha1 "321e89c0ed5d9af7e68c81eb8d8e79bf5ab58966" => :lion
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
