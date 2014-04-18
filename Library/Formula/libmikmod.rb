require 'formula'

class Libmikmod < Formula
  homepage 'http://mikmod.shlomifish.org'
  url 'https://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.6/libmikmod-3.3.6.tar.gz'
  sha256 '3f363e03f7b1db75b9b6602841bbd440ed275a548e53545f980df8155de4d330'

  bottle do
    cellar :any
    sha1 "785d0206e7e27a47672b62791abcc7e8ece02267" => :mavericks
    sha1 "42318a03bf96284298eef7040e8740f2440b5d5c" => :mountain_lion
    sha1 "906c9880063922d770cec178c50ad70875d54fbc" => :lion
  end

  option 'with-debug', 'Enable debugging symbols'

  def install
    ENV.O2 if build.with? 'debug'

    # OSX has CoreAudio, but ALSA is not for this OS nor is SAM9407 nor ULTRA.
    args = %W[
      --prefix=#{prefix}
      --disable-alsa
      --disable-sam9407
      --disable-ultra
    ]
    args << '--with-debug' if build.with? 'debug'
    mkdir 'macbuild' do
      system "../configure", *args
      system "make install"
    end
  end

  test do
    system "#{bin}/libmikmod-config", "--version"
  end
end
