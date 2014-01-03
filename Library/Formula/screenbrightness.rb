require 'formula'

class Screenbrightness < Formula
  homepage 'https://github.com/jmstacey/screenbrightness'
  url 'https://github.com/jmstacey/screenbrightness/archive/1.1.tar.gz'
  sha1 'f9750733ac298837f519fcfedcbfec74f781bc68'
  head 'https://github.com/jmstacey/screenbrightness.git'

  bottle do
    cellar :any
    sha1 '77aae54707efaca65d5991acf119d15aa655e9b6' => :mavericks
    sha1 'cbf4436878c1b6516857b926d5b3323ab62f1106' => :mountain_lion
    sha1 '7e1c502baa2ce02647c6e1c72c882bf90aafbbdb' => :lion
  end

  def install
    system "make"
    system "make", "prefix=#{prefix}", "install"
  end
end
