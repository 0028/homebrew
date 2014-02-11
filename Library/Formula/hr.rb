require 'formula'

class Hr < Formula
  homepage 'https://github.com/LuRsT/hr'
  head 'https://github.com/LuRsT/hr', :branch => 'master'

  url 'https://raw2.github.com/LuRsT/hr/103e25c7844cfed2dcf17fdcb366dbd6e45105ab/hr', :nounzip => true
  sha1 '165cb02e1deaf3cb6dff312eab097c457aa06083'
  version '0.0.1'

  def install
    bin.install 'hr'
  end

  test do
    system "#{bin}/hr", "-#-"
  end
end
