require 'formula'

class ErlangInstalled < Requirement
  fatal true
  default_formula 'erlang'
  env :userpaths

  satisfy {
    erl = which('erl') and begin
      `#{erl} -noshell -eval 'io:fwrite("~s~n", [erlang:system_info(otp_release)]).' -s erlang halt | grep -q '^R1[6789]'`
      $?.exitstatus == 0
    end
  }

  def message; <<-EOS.undent
    Erlang R16 is required to install.

    You can install this with:
      brew install erlang

    Or you can use an official installer from:
      http://www.erlang.org/
    EOS
  end
end

class Elixir < Formula
  homepage 'http://elixir-lang.org/'
  url  'https://github.com/elixir-lang/elixir/archive/v0.12.4.zip'
  sha1 '033970698bdfd82abebe8c8ec621d4002c314e0b'

  head 'https://github.com/elixir-lang/elixir.git'

  bottle do
    sha1 "558e8508c65c1f32a6e5098c05564d87967e4b42" => :mavericks
    sha1 "ae8d12684543c237f6b9916ccc540c4639001695" => :mountain_lion
    sha1 "353e951dcdaf5ff2469fee311c17bcb8188be8d5" => :lion
  end

  depends_on ErlangInstalled

  def install
    system "make"
    bin.install Dir['bin/*'] - Dir['bin/*.bat']

    Dir['lib/*/ebin'].each do |path|
      app = File.basename(File.dirname(path))
      (lib/app).install path
    end
  end

  test do
    system "#{bin}/elixir", "-v"
  end
end
