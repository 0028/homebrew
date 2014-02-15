require 'formula'

class RabbitmqC < Formula
  homepage 'https://github.com/alanxz/rabbitmq-c'
  url 'https://github.com/alanxz/rabbitmq-c/archive/v0.5.0.tar.gz'
  sha1 '826286c3f04695bdc231d8e7b0541f871975cdcc'

  head 'https://github.com/alanxz/rabbitmq-c.git'

  bottle do
    cellar :any
    sha1 "456e0f7b4e685b3141019aa10deabdd445db512b" => :mavericks
    sha1 "72dc36cdb00a30ac13b907cf5745526e9c70f807" => :mountain_lion
    sha1 "f91a9a2f39feb701f8cc0a1b863105a1b62906e7" => :lion
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build # Use a newer version on Snow Leopard too
  depends_on 'automake' => :build
  depends_on :libtool
  depends_on 'rabbitmq'
  depends_on 'simplejson' => :python if MacOS.version <= :leopard

  resource 'codegen' do
    url 'https://github.com/rabbitmq/rabbitmq-codegen/archive/rabbitmq_v3_2_3.tar.gz'
    sha1 '67a0857e78b5cfce7ea8c433313faa60dc557f9a'
  end

  def install
    ENV.universal_binary if build.universal?
    (buildpath/'codegen').install resource('codegen')
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
