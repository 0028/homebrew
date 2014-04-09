require 'formula'

class Openconnect < Formula
  homepage 'http://www.infradead.org/openconnect.html'
  url "ftp://ftp.infradead.org/pub/openconnect/openconnect-5.99.tar.gz"
  sha1 "3ac20e50f2700ff58d1635f210fc263d29cf7768"

  bottle do
    revision 1
    sha1 "2447a3aa02f7c7efb1cb45ac4731b2cb51072c4c" => :mavericks
    sha1 "7fd5e65092ae7c9e8791055079f5b4e581e15ac2" => :mountain_lion
    sha1 "1b6d3548bc6b3eae1f35df551dd50720eb84dd78" => :lion
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
