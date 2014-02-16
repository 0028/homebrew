require 'formula'

class Openconnect < Formula
  homepage 'http://www.infradead.org/openconnect.html'
  url 'ftp://ftp.infradead.org/pub/openconnect/openconnect-5.03.tar.gz'
  sha1 '40344fc910a19c8781a79204808f1229acaee2a4'

  bottle do
    sha1 "9d91e3eb553bc8d40f0af5606a6a87f01df623b1" => :mavericks
    sha1 "a318a5dca74cd40fe98f6fcd35dde52dd84075d6" => :mountain_lion
    sha1 "d69ccb96c7c0ad74b30a3616677b18da29d512f2" => :lion
  end

  depends_on 'pkg-config' => :build
  depends_on 'gettext'

  resource 'vpnc-script' do
    url 'http://git.infradead.org/users/dwmw2/vpnc-scripts.git/blob_plain/d2c5a77f3f0ea6ad80fc59158127d63ede81a6cb:/vpnc-script'
    sha1 '9915539c34393c1f8d7de9c3fc2c7396476bd998'
  end

  def install
    etc.install resource('vpnc-script')
    chmod 0755, "#{etc}/vpnc-script"

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
