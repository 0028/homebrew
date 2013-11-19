require 'formula'

class Tracebox < Formula
  homepage 'http://www.tracebox.org/'
  url 'https://drone.io/github.com/tracebox/tracebox/files/tracebox-0.1.tar.gz'
  sha1 'bb79f17cb799c3b4b1b8f4e3ab0775ae40b2060c'

  bottle do
    cellar :any
    sha1 'ef210a2863e150b0a8cdf3ebc9388e368b52ad54' => :mavericks
    sha1 'e352ee9926c7aad94553c885044e544d0babe0c9' => :mountain_lion
    sha1 'c4f23bb6681ad558985c004c0818b92be0a4a268' => :lion
  end

  depends_on 'lua'

  def install
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    #This test is commented out pending an upstream fix
    #https://github.com/tracebox/tracebox/issues/7
    #system "#{bin}/tracebox", "-h"
  end

  def caveats; <<-EOS.undent
    tracebox requires superuser privileges. You can either run the program
    via `sudo`, or change its ownership to root and set the setuid bit:

      sudo chown root:wheel #{bin}/tracebox
      sudo chmod u+s #{bin}/tracebox

    In any case, you should be certain that you trust the software you
    are executing with elevated privileges.
    EOS
  end
end
