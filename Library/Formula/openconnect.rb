require 'formula'

class Openconnect < Formula
  homepage 'http://www.infradead.org/openconnect.html'
  url 'ftp://ftp.infradead.org/pub/openconnect/openconnect-5.03.tar.gz'
  sha1 '40344fc910a19c8781a79204808f1229acaee2a4'

  bottle do
    sha1 "14395e569e4bb130f6613adef2930b0cf079c311" => :mavericks
    sha1 "3d6d1159c6e26813bb6ba7cdad05393f009297c6" => :mountain_lion
    sha1 "cccbbe5028ad353dc5aa5082f1f5a88511a754e4" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'

  resource 'vpnc-script' do
    url 'http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/d2c5a77f3f0ea6ad80fc59158127d63ede81a6cb:/vpnc-script'
    sha1 '9915539c34393c1f8d7de9c3fc2c7396476bd998'
  end

  head do
    url 'git://git.infradead.org/users/dwmw2/openconnect.git'
    depends_on :autoconf => :build
    depends_on :automake => :build
    depends_on :libtool => :build
  end

  def install
    etc.install resource('vpnc-script')
    chmod 0755, "#{etc}/vpnc-script"

    if build.head?
      inreplace 'autogen.sh', /libtoolize/, "glibtoolize"
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
