require 'formula'

class Texapp < Formula
  homepage 'http://www.floodgap.com/software/texapp/'
  url 'http://www.floodgap.com/software/texapp/dist0/0.6.06.txt'
  sha1 '5dbf1caf40bd70bc1ed121601c384bf9823ee1e4'

  bottle do
    cellar :any
    sha1 '1bd813e365f86d5da2bf09edcc59d66cf4e8a4fb' => :mavericks
    sha1 '3023dd9041f471e7dc572512a2bcb516f6ffc468' => :mountain_lion
    sha1 '38b82ed044e7907ea401b09f3b4ba53512d49fdc' => :lion
  end

  def install
    bin.install "#{version}.txt" => "texapp"
  end

  def caveats; <<-EOS.undent
    To take full advantage of readline features you must install readline:
      brew install readline

    and the Perl Module Term::ReadLine::TTYtter
      cpan -i Term::ReadLine::TTYtter

    Or if you have cpanminus:
      cpanm Term::ReadLine::TTYtter
    EOS
  end
end
