require 'formula'

class Upx < Formula
  homepage 'http://upx.sourceforge.net'
  url 'http://upx.sourceforge.net/download/upx-3.91-src.tar.bz2'
  sha1 'da962c0affb27eae11aa9b6fbd751c3699717b36'
  bottle do
    cellar :any
    sha1 "24261c6475aa2fabdeac173da0deb6ab438c3054" => :mavericks
    sha1 "8af75a7682c42bb9f07f02265eb842e41189cf16" => :mountain_lion
    sha1 "82794664e213be80fb0bf52276205dcd3b85670f" => :lion
  end

  head 'https://www.pysol.org:4443/hg/upx.hg', :using => :hg

  depends_on 'ucl'

  resource 'lzma' do
    url 'http://downloads.sourceforge.net/project/sevenzip/LZMA%20SDK/4.65/lzma465.tar.bz2'
    sha1 '5ec1c4606fec88c770a9712073e83916f8aed173'
  end

  def install
    (buildpath/'lzmasdk').install resource('lzma')
    ENV['UPX_LZMADIR'] = buildpath/'lzmasdk'
    ENV['UPX_LZMA_VERSION'] = '0x465'
    system "make all"
    bin.install  'src/upx.out' => 'upx'
    man1.install 'doc/upx.1'
  end
end
