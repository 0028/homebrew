require 'formula'

class Hexcurse < Formula
  homepage 'https://github.com/LonnyGomes/hexcurse'
  url 'https://github.com/LonnyGomes/hexcurse/archive/hexcurse-1.58.tar.gz'
  sha1 '6a07324a4782007dcea800b8b545f9f07e8eae8f'

  bottle do
    cellar :any
    sha1 "5c76016fe2c0f33e896e9482ccfa8724325e7a73" => :mavericks
    sha1 "782b45e271134ab30914315aa1ffa9814f2e53eb" => :mountain_lion
    sha1 "ff4f8f6487e7eb8e81af5902fbd8b86bc723e58c" => :lion
  end

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make", "install"
  end

  test do
      system "#{bin}/hexcurse", "-help"
  end
end
