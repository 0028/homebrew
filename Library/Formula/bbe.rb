require 'formula'

class Bbe < Formula
  homepage 'http://bbe-.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/bbe-/bbe/0.2.2/bbe-0.2.2.tar.gz'
  sha1 '42d5b47d607a9633fb49e7d39e2aebfb7bb89c05'

  bottle do
    cellar :any
    sha1 'f919e34088509b98e0396422efb7aa1dad1b8f87' => :mavericks
    sha1 '8cdf13599103f5a82fd772f2ef14b3b93a3b4c84' => :mountain_lion
    sha1 '55243c259b08b2d79683fb794d1a5d0255a31e33' => :lion
  end

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end
end
