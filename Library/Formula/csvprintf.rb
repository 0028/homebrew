require 'formula'

class Csvprintf < Formula
  homepage 'http://code.google.com/p/csvprintf/'
  url 'http://csvprintf.googlecode.com/files/csvprintf-1.0.3.tar.gz'
  sha1 'ee5ee6728a44cc7d0961b0960c7a444372752931'

  bottle do
    sha1 "0506649c3edfe5d880fbc8e87c1ee66cf3513f88" => :mavericks
    sha1 "fc2694815f7ea4bbd2ac9902d5c112684508daf9" => :mountain_lion
    sha1 "4fd01034a94636d14f4bc3e0e4240596d65cdc70" => :lion
  end

  def install
    ENV.append 'LDFLAGS', '-liconv'
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  test do
    IO.popen("#{bin}/csvprintf -i '%2$s %1$s\n'", "w+") do |pipe|
      pipe.write "Last,First\nSmith,Fred\n"
      pipe.close_write
      assert_equal "Fred Smith\n", pipe.read
    end
  end
end
