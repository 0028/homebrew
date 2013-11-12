require 'formula'

class JsonSpirit < Formula
  homepage 'http://www.codeproject.com/KB/recipes/JSON_Spirit.aspx'
  url 'https://github.com/png85/json_spirit/archive/json_spirit-4.07.zip'
  sha1 'e7055cb8fd596fc89b73e6898d8162a56fd80ec7'

  bottle do
    cellar :any
    sha1 '73f26a67d41d676e4f4ffacc07f320c17f6633a4' => :mavericks
    sha1 'bf6c91caead092b9c41f7d9632a82d3eb5d3b7be' => :mountain_lion
    sha1 '53261481591e3c81df0df812a7c2e237c5dd624c' => :lion
  end

  depends_on 'boost'
  depends_on 'cmake' => :build

  def install
    args = std_cmake_args
    args << "-DBUILD_STATIC_LIBRARIES=ON"

    system "cmake", *args
    system "make install"
  end
end
