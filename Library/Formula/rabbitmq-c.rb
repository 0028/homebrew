require 'formula'

class RabbitmqC < Formula
  homepage 'https://github.com/alanxz/rabbitmq-c'
  url 'https://github.com/alanxz/rabbitmq-c/archive/v0.5.0.tar.gz'
  sha1 '826286c3f04695bdc231d8e7b0541f871975cdcc'

  head 'https://github.com/alanxz/rabbitmq-c.git'

  bottle do
    cellar :any
    sha1 "50006323ed0b63ef95f27bd7170d515982794515" => :mavericks
    sha1 "26cbbf21cafc7b1e857c75562c265a5baddce46d" => :mountain_lion
    sha1 "8fa3230c21b09cc6bfb6f0ee9b2d5e13904be668" => :lion
  end

  option :universal

  depends_on 'pkg-config' => :build
  depends_on 'autoconf' => :build # Use a newer version on Snow Leopard too
  depends_on 'automake' => :build
  depends_on :libtool
  depends_on 'rabbitmq'
  depends_on 'simplejson' => :python if MacOS.version <= :leopard

  resource 'codegen' do
    url 'https://github.com/rabbitmq/rabbitmq-codegen/archive/rabbitmq_v3_3_0.tar.gz'
    sha1 '8a5fd687faae669f3715ea44aaeaf53b8743a340'
  end

  def install
    ENV.universal_binary if build.universal?
    (buildpath/'codegen').install resource('codegen')
    system "autoreconf", "-i"
    system "./configure", "--prefix=#{prefix}", "--disable-dependency-tracking"
    system "make install"
  end
end
