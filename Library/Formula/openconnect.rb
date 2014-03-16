require 'formula'

class Openconnect < Formula
  homepage 'http://www.infradead.org/openconnect.html'
  url "ftp://ftp.infradead.org/pub/openconnect/openconnect-5.99.tar.gz"
  sha1 "3ac20e50f2700ff58d1635f210fc263d29cf7768"

  bottle do
    revision 1
    sha1 "506c0c0448e76987ebd18ef559e4b32af204188f" => :mavericks
    sha1 "5bbc482bc0b235a269af1df0cdab4084f92015a6" => :mountain_lion
    sha1 "0b41a2dff1f9b52ffec5e76f67c27be7cbeb0023" => :lion
  end

  head do
    url "git://git.infradead.org/users/dwmw2/openconnect.git", :shallow => false
    depends_on :autoconf => :build
    depends_on :automake => :build
    depends_on :libtool => :build
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'
  depends_on "openssl"

  resource 'vpnc-script' do
    url 'http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/d2c5a77f3f0ea6ad80fc59158127d63ede81a6cb:/vpnc-script'
    sha1 '9915539c34393c1f8d7de9c3fc2c7396476bd998'
  end

  def install
    etc.install resource('vpnc-script')
    chmod 0755, "#{etc}/vpnc-script"

    if build.head?
      ENV["GIT_DIR"] = cached_download/".git"
      ENV["LIBTOOLIZE"] = "glibtoolize"
      system "./autogen.sh"
    end

    args = %W[
      --prefix=#{prefix}
      --sbindir=#{bin}
      --localstatedir=#{var}
      --with-vpnc-script=#{etc}/vpnc-script
    ]

    system "./configure", *args
    system "make install"
  end

  def caveats; <<-EOS.undent
    OpenConnect requires the use of a TUN/TAP driver.

    You can download one at http://tuntaposx.sourceforge.net/
    and install it prior to running OpenConnect.
    EOS
  end
end
