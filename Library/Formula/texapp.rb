require 'formula'

class Texapp < Formula
  homepage 'http://www.floodgap.com/software/texapp/'
  url 'http://www.floodgap.com/software/texapp/dist0/0.6.06.txt'
  sha1 '5dbf1caf40bd70bc1ed121601c384bf9823ee1e4'

  bottle do
    cellar :any
    sha1 'dcfd722f67485e877da4740ee4bc0416b178bd40' => :mavericks
    sha1 '97fee684db9dac431954ea5f583bb08b35c3899d' => :mountain_lion
    sha1 '22d6f9bcaffd2e49e63a4d2d16903a4e7e66a1ef' => :lion
  end

  depends_on 'curl'

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
