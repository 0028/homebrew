require 'formula'

class Jslint4java < Formula
  homepage 'http://code.google.com/p/jslint4java/'
  url 'http://jslint4java.googlecode.com/files/jslint4java-2.0.5-dist.zip'
  sha1 '30a75ce48b64d2c8f0b2b86e20c0d98e6441827d'

  bottle do
    sha1 "75fd2135d702f92bb71e051e2f6a11336e22e1fc" => :mavericks
    sha1 "52eed30cd00a0dbed99e00d4de043364fce38eac" => :mountain_lion
    sha1 "82924175d899fc1b35895687522239183d3cbfaf" => :lion
  end

  def install
    doc.install Dir['docs/*']
    libexec.install Dir['*.jar']
    bin.write_jar_script Dir[libexec/'jslint4java*.jar'].first, 'jslint4java'
  end

  test do
    path = testpath/"test.js"
    path.write <<-EOS.undent
      var i = 0;
      var j = 1  // no semicolon
    EOS

    output = `#{bin}/jslint4java #{path}`
    assert output.include?("2:10:Expected ';' and instead saw '(end)'")
    assert_equal 1, $?.exitstatus
  end
end
