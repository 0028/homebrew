require 'formula'

class Mess < Formula
  homepage 'http://www.mess.org/'
  url 'svn://dspnet.fr/mame/trunk', :revision => '26743'
  version '0.152'

  head 'svn://dspnet.fr/mame/trunk'

  bottle do
    cellar :any
    sha1 '0bf0d7b58a4d576e652151be0370c281195226c5' => :mavericks
    sha1 '56030d301e6f362a1ffbf91130f22254c05910a1' => :mountain_lion
    sha1 'c769b9c7ea18130849397d7b6684a06e2a071211' => :lion
  end

  depends_on :x11
  depends_on 'sdl'

  def install
    ENV['MACOSX_USE_LIBSDL'] = '1'
    ENV['INCPATH'] = "-I#{MacOS::X11.include}"
    ENV['PTR64'] = (MacOS.prefer_64_bit? ? '1' : '0')

    system "make", "CC=#{ENV.cc}", "LD=#{ENV.cxx}",
                   "TARGET=mess", "SUBTARGET=mess"

    if MacOS.prefer_64_bit?
      bin.install 'mess64' => 'mess'
    else
      bin.install 'mess'
    end
  end
end
