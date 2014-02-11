require 'formula'

class Jsonpp < Formula
  homepage 'http://jmhodges.github.io/jsonpp/'
  url 'https://github.com/jmhodges/jsonpp/releases/v1.2.0/715/jsonpp-1.2.0-osx-x86_64.zip'
  version '1.2.0'
  sha1 '422d5b2cefa92923d2fbef9afe1324d72134509e'

  bottle do
    cellar :any
    sha1 "b065285a7b4b668ce7b403a8041b747528c2d2b5" => :mavericks
    sha1 "fe557c110dc20cb4bee14be705b494ad9b52aa8a" => :mountain_lion
    sha1 "d51cc69ce06153433ced256722bf3af7c7acfd78" => :lion
  end

  def install
    bin.install 'jsonpp'
  end

  test do
    IO.popen("#{bin}/jsonpp", "w+") do |pipe|
      pipe.puts '{"foo":"bar","baz":"qux"}'
      pipe.close_write
      assert_equal <<-EOS.undent, pipe.read
        {
          "foo": "bar",
          "baz": "qux"
        }
      EOS
    end
  end
end
