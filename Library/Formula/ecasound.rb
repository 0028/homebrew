require 'formula'

class Ecasound < Formula
  homepage 'http://www.eca.cx/ecasound/'
  url 'http://ecasound.seul.org/download/ecasound-2.9.1.tar.gz'
  sha1 '048fc2487deb3c94d92814b54255435b2acee1d8'

  bottle do
    sha1 "c4884937a2e83b06d70f25b83bd01758f1b808de" => :mavericks
    sha1 "dbc5b390d252c6fe91c695f9d8a7be1f0e1e2521" => :mountain_lion
    sha1 "951701e3de68854a6413bfc3cd5b9d934418bca6" => :lion
  end

  option "with-ruby", "Compile with ruby support"

  def install
    args = %W[
      --disable-debug
      --disable-dependency-tracking
      --prefix=#{prefix}
    ]
    args << ("--enable-rubyecasound=" + ((build.with? 'ruby') ? 'yes' : 'no'))
    system "./configure", *args
    system "make install"
  end
end
