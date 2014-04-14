require "formula"

class Metaproxy < Formula
  homepage "http://www.indexdata.com/metaproxy"
  url "http://ftp.indexdata.dk/pub/metaproxy/metaproxy-1.4.8.tar.gz"
  sha1 "0f361a6b7e1a5eb666ac477dcaa47d82b5e5acbd"

  bottle do
    cellar :any
    sha1 "d4c474e92cc9088408bbcc8e47496e8bb8389028" => :mavericks
    sha1 "7bdcabcb74f3f0e492e53d12516e6373e9a70c74" => :mountain_lion
    sha1 "2554038a9c72dc659ef8c44cf1b7b1dacf281c4e" => :lion
  end

  depends_on "pkg-config" => :build
  depends_on "yazpp"
  depends_on "boost"

  def install
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  # Test by making metaproxy test a trivial configuration file (etc/config0.xml).
  test do
    (testpath/"test-config.xml").write <<-EOS.undent
    <?xml version="1.0"?>
    <metaproxy xmlns="http://indexdata.com/metaproxy" version="1.0">
      <start route="start"/>
      <filters>
        <filter id="frontend" type="frontend_net">
          <port max_recv_bytes="1000000">@:9070</port>
          <message>FN</message>
          <stat-req>/fn_stat</stat-req>
        </filter>
      </filters>
      <routes>
        <route id="start">
          <filter refid="frontend"/>
          <filter type="log"><category access="false" line="true" apdu="true" /></filter>
          <filter type="backend_test"/>
          <filter type="bounce"/>
        </route>
      </routes>
    </metaproxy>
    EOS

    system "#{bin}/metaproxy", "-t", "--config", "#{testpath}/test-config.xml"
   end
end
