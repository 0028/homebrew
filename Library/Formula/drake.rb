require 'formula'

class Drake < Formula
  homepage 'https://github.com/Factual/drake'
  url 'https://api.github.com/repos/Factual/drake/tarball/7119b1c7ae6feeef919a74090da696005fd70875'
  sha1 '353a08b2b0b1e135f07522e91e64e9839a4f742c'
  version '0.1.4'

  depends_on 'leiningen' => :build
  depends_on 'drip' => :optional

  def install
    libexec.install Dir['*']
    bin.write_exec_script Dir["#{libexec}/bin/*"]

    Dir.chdir(libexec) do
      system 'lein uberjar'
    end
  end

  test do
    # count the number of lines with 'drake' in all local files
    (testpath/'Drakefile').write <<-EOS.undent
      find_lines <- [shell]
        grep -r 'drake' . > $OUTPUT

      count_drakes_lines <- find_lines
        cat $INPUT | wc -l > $OUTPUT
    EOS

    # force run (no user prompt) the full workflow
    system bin/'drake', '--auto', '+...'
  end
end
