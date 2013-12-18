require 'formula'

class Setweblocthumb < Formula
  homepage 'http://hasseg.org/setWeblocThumb'
  url 'https://github.com/ali-rantakari/setWeblocThumb/archive/v1.0.0.tar.gz'
  sha1 '60fb2858e6f45216166f31e951432805d7f9dcc0'

  bottle do
    cellar :any
    sha1 '53ae61d970b765e7409973a4cbb937ca68cf8428' => :mavericks
    sha1 '51eb66e1d1f4e2fabc485eaa5065fd466740a53e' => :mountain_lion
    sha1 '2de4e43a3938a758078f0faa1b4796ba3bf93e23' => :lion
  end

  def install
    system "make"
    bin.install "setWeblocThumb"
  end

  test do
    webloc = '{URL = "https://google.com";}'
    File.open('google.webloc', 'w') {|f| f.write(webloc)}
    system "#{bin}/setWeblocThumb google.webloc"
  end
end
