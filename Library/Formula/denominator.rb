require 'formula'

class Denominator < ScriptFileFormula
  # This is a shell script wrapping a java jar; download as single file using nounzip
  homepage 'https://github.com/Netflix/denominator/tree/master/cli'
  url 'http://dl.bintray.com/content/netflixoss/denominator/denominator-cli/release/4.3.3/denominator?direct',
    :using  => :nounzip
  sha1 'df078fe7e1c3739ea17dfeced936515026890c1e'

  bottle do
    cellar :any
    sha1 "2eeb7d121de64db9865cbdfe45665e05e6a43768" => :mavericks
    sha1 "8e1f36d284caa2f0fb8bb5426a27f6b89ec1a6e8" => :mountain_lion
    sha1 "863f83dbecd57d747962fa6d3057102587f6d9b8" => :lion
  end

  test do
    system "#{bin}/denominator", "help"
  end
end
