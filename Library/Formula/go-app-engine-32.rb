require 'formula'

class GoAppEngine32 < Formula
  homepage 'http://code.google.com/appengine/docs/go/overview.html'
  url 'http://googleappengine.googlecode.com/files/go_appengine_sdk_darwin_386-1.8.9.zip'
  sha1 '697ea243d50632751417b83dcecc702c8196564d'

  bottle do
    cellar :any
    sha1 'd3bf1d91fb3d3ec6a7be8b1f7504d95cfd6f6fe5' => :mavericks
    sha1 'b655fea01432a639a16d932adb40f32ea2dbcce2' => :mountain_lion
    sha1 '1b9d0e19fdc5b2678ce9b9fc70c14e985c053860' => :lion
  end

  def install
    cd '..'
    share.install 'go_appengine' => name
    bin.mkpath
    %w[
      api_server.py appcfg.py bulkloader.py bulkload_client.py dev_appserver.py download_appstats.py goapp
    ].each do |fn|
      ln_s share+name+fn, bin
    end
  end
end
