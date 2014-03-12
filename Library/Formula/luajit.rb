require 'formula'

class Luajit < Formula
  homepage 'http://luajit.org/luajit.html'
  url 'http://luajit.org/download/LuaJIT-2.0.3.tar.gz'
  sha1 '2db39e7d1264918c2266b0436c313fbd12da4ceb'
  head 'http://luajit.org/git/luajit-2.0.git'

  bottle do
    sha1 "4a53a6d8d463d7eb4bf5cf2c84a1a26ab262597c" => :mavericks
    sha1 "21d7e3bb1fad57a097608909b2cfc8f8d2be8d39" => :mountain_lion
    sha1 "17dd21afbfcbb2b9d55e7b254a34a845c5292606" => :lion
  end

  skip_clean 'lib/lua/5.1', 'share/lua/5.1'

  option "enable-debug", "Build with debugging symbols"

  def install
    # 1 - Override the hardcoded gcc.
    # 2 - Remove the '-march=i686' so we can set the march in cflags.
    # Both changes should persist and were discussed upstream.
    inreplace 'src/Makefile' do |f|
      f.change_make_var! 'CC', ENV.cc
      f.change_make_var! 'CCOPT_x86', ''
    end

    ENV.O2 # Respect the developer's choice.

    args = %W[PREFIX=#{prefix}]

    # This doesn't yet work under superenv because it removes '-g'
    args << 'CCDEBUG=-g' if build.include? 'enable-debug'

    system 'make', 'amalg', *args
    system 'make', 'install', *args
  end

  test do
    system "#{bin}/luajit", "-e", <<-EOS.strip
      local ffi = require("ffi")
      ffi.cdef("int printf(const char *fmt, ...);")
      ffi.C.printf("Hello %s!\\n", "#{ENV['USER']}")
      EOS
  end
end
