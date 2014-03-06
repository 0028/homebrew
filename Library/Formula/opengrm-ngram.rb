require 'formula'

class OpengrmNgram < Formula
  homepage 'http://www.openfst.org/twiki/bin/view/GRM/NGramLibrary'
  url 'http://openfst.cs.nyu.edu/twiki/pub/GRM/NGramDownload/opengrm-ngram-1.1.0.tar.gz'
  sha1 'a2ceeaf6ac129b66d2682d76a20388cf1d4b8c31'

  bottle do
    cellar :any
    sha1 "08c88062271516a82a9bfbac61a4dae2fb918890" => :mavericks
    sha1 "2cffe276c49090c70bb3f7d4e2461c23e7cf516d" => :mountain_lion
    sha1 "4e9123715234f73b6df2da86092928a9f9faaa4f" => :lion
  end

  depends_on 'openfst'

  def install
    ENV.libstdcxx if ENV.compiler == :clang && MacOS.version >= :mavericks
    system './configure', "--prefix=#{prefix}", '--disable-dependency-tracking'
    system 'make install'
  end
end
