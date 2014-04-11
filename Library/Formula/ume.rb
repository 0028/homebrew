require 'formula'

class Ume < Formula
  homepage 'http://mamedev.org/'
  url 'svn://dspnet.fr/mame/trunk', :revision => '29406'
  version '0.153'

  head 'svn://dspnet.fr/mame/trunk'

  bottle do
    cellar :any
    sha1 "b4654eda9ae6c9a2908ced8003e08c0660585335" => :mavericks
    sha1 "4a4f8a97ead134e465042108e367abee38d666c3" => :mountain_lion
    sha1 "eef669b320a888fdd75fcf7a552043b534d5c449" => :lion
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
