require 'formula'

class Calabash < Formula
  homepage 'http://xmlcalabash.com'
  url 'http://xmlcalabash.com/download/calabash-1.0.15-95.zip'
  sha1 'd1cb6f0f26780a504e1f6890a6a3e9261fc28c81'

  head 'https://github.com/ndw/xmlcalabash1.git'

  bottle do
    sha1 'f4aa7d1672306d5f7aaf5c4ab70c3407e68c5514' => :mavericks
    sha1 '3608760804a5a897e413fdbfae44b1e252dc32c9' => :mountain_lion
    sha1 '4c75f746fd160c00047e5e2b9fa01d57be24f33a' => :lion
  end

  depends_on 'saxon'

  def install
    libexec.install Dir["*"]
    bin.write_jar_script libexec/'calabash.jar', 'calabash', '-Xmx1024m'
  end

  def test
    # This small XML pipeline (*.xpl) that comes with Calabash
    # is basically its equivalent "Hello World" program.
    system "#{bin}/calabash", "#{libexec}/xpl/pipe.xpl"
  end
end
