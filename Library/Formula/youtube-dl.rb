require 'formula'

class YoutubeDl < Formula
  homepage 'http://rg3.github.io/youtube-dl/'
  url 'http://youtube-dl.org/downloads/2013.12.11.2/youtube-dl-2013.12.11.2.tar.gz'
  sha1 '04a29b9bd69f74fa276546fe997e89bf123aa222'

  bottle do
    cellar :any
    sha1 '297daefae1b1ee08eb871cc648236d3718cb9dd0' => :mavericks
    sha1 'cda17fa41c8c725de301b76e5a6081bec43a2bdf' => :mountain_lion
    sha1 '685dc77d25cedb99379add0a7aaa9d391949bad9' => :lion
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
end
