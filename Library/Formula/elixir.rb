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
  url  'https://github.com/elixir-lang/elixir/archive/v0.12.5.tar.gz'
  sha1 '6bf2b2f7bd0a4df846b1149031538ddb0612f91e'

  head 'https://github.com/elixir-lang/elixir.git'

  bottle do
    sha1 "7edd545b6e9570cb5ea749b054822685b1f292ab" => :mavericks
    sha1 "5a6487bab24fb743b012e116ff381ac092fddd7b" => :mountain_lion
    sha1 "5325416175d9bbe54dbbcca3fc0337592c8f065d" => :lion
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
