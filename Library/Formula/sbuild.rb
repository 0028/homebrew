require 'formula'

class Sbuild < Formula
  homepage 'http://sbuild.tototec.de/sbuild/projects/sbuild/wiki'
  url 'http://sbuild.tototec.de/sbuild/attachments/download/87/sbuild-0.7.1-dist.zip'
  sha1 'b18c1e21f6bd5ef5b1d9733b171a1558e72ed017'

  bottle do
    cellar :any
    sha1 '01539a74f7fa41c8cb8ac50cf8dea556417b0fa9' => :mavericks
    sha1 '2b8fa2873fd38ac3fe40f1c87d158a9fea856934' => :mountain_lion
    sha1 'b861222b95d76e3f78b7875fcd0edb1445a8e408' => :lion
  end

  def install
    libexec.install Dir['*']
    system "chmod +x #{libexec}/bin/sbuild"
    bin.install_symlink libexec/"bin/sbuild"
  end

  test do
    system "#{bin}/sbuild", "--help"
  end
end
