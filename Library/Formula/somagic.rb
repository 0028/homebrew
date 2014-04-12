require 'formula'

class Somagic < Formula
  homepage 'https://code.google.com/p/easycap-somagic-linux/'
  url 'https://easycap-somagic-linux.googlecode.com/files/somagic-easycap_1.1.tar.gz'
  sha1 '97cda956ea319fdd9aa9be9aff222a3e804deb91'

  bottle do
    cellar :any
    sha1 "96e1b73212686646a925cfbdaa6f35b9fbd40b7b" => :mavericks
    sha1 "349cb0766a996a8957ad766a3a132be10cf5a002" => :mountain_lion
    sha1 "5d910722787e9ab31198ec1ffd105f63893699ad" => :lion
  end

  depends_on 'libusb'
  depends_on 'libgcrypt'
  depends_on 'somagic-tools'
  depends_on 'mplayer' => :optional

  def install
    system 'make'
    system 'make', 'PREFIX="#{prefix}"', 'install'
  end

  def caveats
    s = <<-EOS.undent
      Before running somagic-capture you must extract the official firmware from the CD.
      See https://code.google.com/p/easycap-somagic-linux/wiki/GettingStarted#Extracting_firmware for details.
    EOS
    s
  end
end
