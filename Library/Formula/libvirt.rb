require 'formula'

class Libvirt < Formula
  homepage 'http://www.libvirt.org'
  url 'http://libvirt.org/sources/libvirt-1.2.1.tar.gz'
  sha256 'bc29b5751bf36753c17e2fdbb75e70c7b07df3d9527586d3426e90f5f4abb898'

  bottle do
    sha1 "5c5e4a5af5542f0a48f37b8b55302ced3ca9cd2f" => :mavericks
    sha1 "631f82e6a8691bd8ef3878ce072afec0fbe1cbab" => :mountain_lion
    sha1 "5a29477957db7e1828611cf32e0c510d82beee8e" => :lion
  end

  option 'without-libvirtd', 'Build only the virsh client and development libraries'

  depends_on 'pkg-config' => :build
  depends_on 'gnutls'
  depends_on 'libgcrypt'
  depends_on 'yajl'

  if MacOS.version <= :leopard
    # Definitely needed on Leopard, but not on Snow Leopard.
    depends_on "readline"
    depends_on "libxml2"
  end

  fails_with :llvm do
    build 2326
    cause "Undefined symbols when linking"
  end

  def install
    args = ["--prefix=#{prefix}",
            "--localstatedir=#{var}",
            "--mandir=#{man}",
            "--sysconfdir=#{etc}",
            "--with-esx",
            "--with-init-script=none",
            "--with-remote",
            "--with-test",
            "--with-vbox",
            "--with-vmware",
            "--with-yajl",
            "--without-qemu"]

    args << "--without-libvirtd" if build.without? 'libvirtd'

    system "./configure", *args

    # Compilation of docs doesn't get done if we jump straight to "make install"
    system "make"
    system "make install"

    # Update the SASL config file with the Homebrew prefix
    inreplace "#{etc}/sasl2/libvirt.conf" do |s|
      s.gsub! "/etc/", "#{HOMEBREW_PREFIX}/etc/"
    end

    # If the libvirt daemon is built, update its config file to reflect
    # the Homebrew prefix
    unless build.include? 'without-libvirtd'
      inreplace "#{etc}/libvirt/libvirtd.conf" do |s|
        s.gsub! "/etc/", "#{HOMEBREW_PREFIX}/etc/"
        s.gsub! "/var/", "#{HOMEBREW_PREFIX}/var/"
      end
    end
  end
end
