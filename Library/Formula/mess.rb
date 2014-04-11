require 'formula'

class Mess < Formula
  homepage 'http://www.mess.org/'
  url 'svn://dspnet.fr/mame/trunk', :revision => '29406'
  version '0.153'

  head 'svn://dspnet.fr/mame/trunk'

  bottle do
    cellar :any
    sha1 "47def1acdc4410c676b0dfa1f78889609e3bd942" => :mavericks
    sha1 "75f5c9128f7eacd9e0b350a32cb85d5e4ec28c89" => :mountain_lion
    sha1 "02c94faed7a63e02ef6b7a5b77ef3a116c6c0f67" => :lion
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
