require "formula"

class Csv2xls < Formula
  homepage 'http://ferkulat.github.io/csv2xls/'
  url 'https://github.com/ferkulat/csv2xls/releases/download/0.3.4/csv2xls-0.3.4.tar.bz2'
  sha1 "6140301b3187932c46fc02ea7bf70f2b0be6421b"

  bottle do
    cellar :any
    sha1 "633fb44c9adbbcc83d57f835fb73d1afcd9d6000" => :mavericks
    sha1 "54fd44d2631be68815de4d702d69e316171f8145" => :mountain_lion
    sha1 "350e6a6e02038c15507cacdaa66ddb129f7bbd02" => :lion
  end

  depends_on 'xlslib'
  depends_on 'libcsv'

  def install

    system "./configure", "--disable-debug"
    system "make"
    system "make", "install"
  end
end
