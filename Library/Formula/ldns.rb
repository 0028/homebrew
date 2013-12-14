require 'formula'

class Ldns < Formula
  homepage 'http://nlnetlabs.nl/projects/ldns/'
  url 'http://nlnetlabs.nl/downloads/ldns/ldns-1.6.16.tar.gz'
  sha1 '5b4fc6c5c3078cd061905c47178478cb1015c62a'

  bottle do
    sha1 '2ecbd2e28e8704cfddba2c629577bc23d0166f6a' => :mavericks
    sha1 '6280fa2755c07b9f5ffe4acbde7c8a13061aeecc' => :mountain_lion
    sha1 'edae601ae81f21828d1bd1065992563292c1e302' => :lion
  end

  option 'with-gost', 'Compile ldns with support for GOST algorithms in DNSSEC'

  depends_on :python => :optional
  depends_on 'swig' if build.with? 'python'

  # gost requires OpenSSL >= 1.0.0
  depends_on 'openssl' if build.with? 'gost'

  def install
    args = %W[
      --prefix=#{prefix}
      --with-drill
    ]

    if build.with? 'gost'
      args << "--with-ssl=#{HOMEBREW_PREFIX}/opt/openssl"
    else
      args << "--disable-gost"
      args << "--with-ssl=#{MacOS.sdk_path}/usr"
    end

    if build.with? 'python'
      args << "--with-pyldns"
      ENV['PYTHON_SITE_PKG'] = python.site_packages
    end

    system "./configure", *args
    system "make"
    system "make install"
    system "make", "install-pyldns" if build.with? 'python'
  end
end
