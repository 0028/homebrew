require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  # Please only update to versions that are published on PyPi as there are too
  # many releases for us to update to every single one:
  # https://pypi.python.org/pypi/youtube_dl
  url 'https://yt-dl.org/downloads/2014.03.17/youtube-dl-2014.03.17.tar.gz'
  sha1 '00869bbc52fc1ee7477abfff4e40e7b05d0671ec'

  bottle do
    cellar :any
    sha1 "0e6ee0fd5254b212613a988ec2dd7a970ddeb331" => :mavericks
    sha1 "3c7d69f13a39de3c7cb052c6c27ccfe0f2edc6e1" => :mountain_lion
    sha1 "7460486edffc9cd29151f4d088e588da811b2e8e" => :lion
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
