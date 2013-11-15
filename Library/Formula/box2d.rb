require 'formula'

class Box2d < Formula
  homepage 'http://www.box2d.org/'
  url 'https://box2d.googlecode.com/files/Box2D_v2.3.0.7z'
  sha1 '1d3ea1f872b3cab3ef5130a2404d74f9ff66f265'

  bottle do
    cellar :any
    sha1 '56a4a56f09a50027534439f7693e2095f88f1523' => :mavericks
    sha1 '657ae0f2b94bc8353dfa580764c111979ffd1965' => :mountain_lion
    sha1 'c0b31e7574493b2a0678aad55d80050681cf22f8' => :lion
  end

  depends_on 'cmake' => :build

  def install
    cd 'Box2D_v2.3.0' do
      cd 'Box2D' do
        system "cmake", "-DBOX2D_INSTALL=ON",
                        "-DBOX2D_BUILD_SHARED=ON",
                        "-DBOX2D_BUILD_EXAMPLES=OFF",
                        *std_cmake_args
        system "make install"
      end
    end
  end
end
