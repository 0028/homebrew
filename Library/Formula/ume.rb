require 'formula'

class Ume < Formula
  homepage 'http://mamedev.org/'
  url 'svn://dspnet.fr/mame/trunk', :revision => '26743'
  version '0.152'

  head 'svn://dspnet.fr/mame/trunk'

  bottle do
    cellar :any
    sha1 'e4b46d0bee31ba13f66c718da050c655f9339dd1' => :mavericks
    sha1 '507fafaafe072668c77a565323838c3dc28289e6' => :mountain_lion
    sha1 '124b81ef6a5fa4a507046bb0ff5c3ce6ed900efe' => :lion
  end

  depends_on :x11
  depends_on 'sdl'

  def install
    ENV['MACOSX_USE_LIBSDL'] = '1'
    ENV['INCPATH'] = "-I#{MacOS::X11.include}"
    ENV['PTR64'] = (MacOS.prefer_64_bit? ? '1' : '0')

    system "make", "CC=#{ENV.cc}", "LD=#{ENV.cxx}", "TARGET=ume"

    if MacOS.prefer_64_bit?
      bin.install 'ume64' => 'ume'
    else
      bin.install 'ume'
    end
  end
end
