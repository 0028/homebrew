require 'formula'

class Ttytter < Formula
  homepage 'http://www.floodgap.com/software/ttytter/'
  url 'http://www.floodgap.com/software/ttytter/dist2/2.1.00.txt'
  sha1 'dd20d55aa819699b3e39ca4c35bf390b3e074db3'

  bottle do
    cellar :any
    sha1 '84a522713f09d007e657c04a3d0b5558d543c1df' => :mavericks
    sha1 '415333a139759012461a18eacc33f223be3e357f' => :mountain_lion
    sha1 '34e63b1801249952bce9dd097219731e3b79589a' => :lion
  end

  depends_on 'curl'

  def install
    bin.install "#{version}.txt" => "ttytter"
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
