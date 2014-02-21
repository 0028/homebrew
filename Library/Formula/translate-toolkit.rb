require 'formula'

class TranslateToolkit < Formula
  homepage 'http://toolkit.translatehouse.org/'
  url 'http://downloads.sourceforge.net/project/translate/Translate%20Toolkit/1.11.0/translate-toolkit-1.11.0.tar.bz2'
  sha1 'c67d17f9c0a3a04e1d18e8e0eb4c2440a11ec5ab'

  bottle do
    sha1 "998680009993b628b57553e298eaca9ad3b00106" => :mavericks
    sha1 "f521f9897f69864167dfdc11f65ff2cf0f98656b" => :mountain_lion
    sha1 "03cd96ed5ff20921a0d429c7868b10a310c585bd" => :lion
  end

  def install
    bin.mkpath
    system "python", "setup.py", "install",
             "--prefix=#{prefix}",
             "--install-scripts=#{bin}",
             "--install-data=#{libexec}"
  end
end
