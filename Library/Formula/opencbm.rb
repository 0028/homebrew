require "formula"

class Opencbm < Formula
  homepage "http://www.trikaliotis.net/opencbm-alpha"
  url "http://www.trikaliotis.net/Download/opencbm-0.4.99.97/opencbm-0.4.99.97.tar.bz2"
  sha1 "e0f4b6c3d134d77e3da66ce4e2e1d945fded5fb6"
  head "git://git.code.sf.net/p/opencbm/code"

  bottle do
    sha1 "0b950740ae30316eab95b1c13d0ed69a85e02df5" => :mavericks
    sha1 "ba9914b23baaf6b91a5f15ee63913d21bf76a7f9" => :mountain_lion
    sha1 "2b1227d85549fcdebd6a3ffd7f92ca102e286a5f" => :lion
  end

  # cc65 is only used to build binary blobs included with the programs; it's
  # not necessary in its own right.
  depends_on 'cc65' => :build
  depends_on 'libusb-compat'

  def install
    # This one definitely breaks with parallel build.
    ENV.deparallelize

    # Fixup for 10.4 shared library issues.  Add -fno-common to CFLAGS.
    inreplace "opencbm/LINUX/config.make" do |s|
      s.change_make_var! "SHLIB_CFLAGS", "$(LIB_CFLAGS) -fPIC -fno-common"
    end

    args = %W[
      -fLINUX/Makefile
      LIBUSB_CONFIG=#{Formula["libusb-compat"].bin}/libusb-config
      PREFIX=#{prefix}
      MANDIR=#{man1}
    ]

    # The build is buried one directory down.
    cd "opencbm" do
      system "make", *args
      system "make", "install-all", *args
    end
  end

  test do
    system "#{bin}/cbmctrl", "--help"
  end
end
