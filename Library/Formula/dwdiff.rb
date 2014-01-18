require 'formula'

class Dwdiff < Formula
  homepage 'http://os.ghalkes.nl/dwdiff.html'
  url 'http://os.ghalkes.nl/dist/dwdiff-2.0.9.tgz'
  sha1 '01cb2230b9147347bcfd1770898e435e4a57fa25'

  bottle do
    sha1 '09824fb246ef9ca43cb54b41ff9b6fb1c48dd92d' => :mavericks
    sha1 'fb2670c14f8f8e95e01792ed262643e03fbb8d39' => :mountain_lion
    sha1 'd6bad16066575ae38df42fa8f0798ec03f8475e2' => :lion
  end

  depends_on 'gettext'
  depends_on 'icu4c'

  def install
    gettext = Formula.factory('gettext')
    icu4c = Formula.factory('icu4c')
    ENV.append "CFLAGS", "-I#{gettext.include} -I#{icu4c.include}"
    ENV.append "LDFLAGS", "-L#{gettext.lib} -L#{icu4c.lib}"
    system "./configure", "--prefix=#{prefix}"
    system "make install"

    # Remove non-English man pages
    (man+"nl").rmtree
    (man+"nl.UTF-8").rmtree
    (share+"locale/nl").rmtree
  end
end
