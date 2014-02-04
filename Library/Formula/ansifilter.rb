require 'formula'

class Ansifilter < Formula
  homepage 'http://www.andre-simon.de/doku/ansifilter/ansifilter.html'
  url 'http://www.andre-simon.de/zip/ansifilter-1.7.tar.bz2'
  sha1 '5b88db508ea100f327bf6b621c959742694fe2d8'

  bottle do
    cellar :any
    sha1 "e46d2c7dc3a59e2383d1dabfe48d9b076f9b8be4" => :mavericks
    sha1 "7613fcd9ba868fbe4363762b7ee0df1083afd371" => :mountain_lion
    sha1 "ddba691aa4d4d861f654a215791796c03fa5c0ed" => :lion
  end

  def install
    # both steps required and with PREFIX, last checked v1.7
    system "make", "PREFIX=#{prefix}"
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    path = testpath/"ansi.txt"
    path.write "f\x1b[31moo"

    output = `#{bin}/ansifilter #{path}`.strip
    assert_equal "foo", output
    assert_equal 0, $?.exitstatus
  end
end
