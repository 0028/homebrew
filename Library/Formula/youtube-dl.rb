require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'https://yt-dl.org/downloads/2014.02.27/youtube-dl-2014.02.27.tar.gz'
  sha1 '0cc7512fe6eda16110cf31f9c55f4c01b8376650'

  bottle do
    cellar :any
    sha1 "1fd92388cdbf471ed2cf8703fffa7e52af484c3e" => :mavericks
    sha1 "cb2f9f1bcffdaa1b23f03afc4feea99d101c2d71" => :mountain_lion
    sha1 "ce6c2e38b0c554fe693e0384689787ada103952e" => :lion
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
