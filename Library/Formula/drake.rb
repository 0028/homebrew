require 'formula'

class Drake < Formula
  homepage 'https://github.com/Factual/drake'
  url 'https://github.com/Factual/drake/releases/download/v0.1.5/drake.jar'
  sha1 '21d0db8e34ed1d8b406ed7c2793f8b6e0f6ce191'
  version '0.1.5'

  depends_on 'drip' => :optional

  def install
    libexec.install Dir['*']
    (bin/'drake').write <<-EOS.undent
      #!/usr/bin/env bash
      cmd='java'
      # use drip if available
      if [[ -x `which drip` ]]; then
        cmd='drip'
      fi
      exec ${cmd} -jar #{libexec}/drake.jar "$@"
    EOS
  end

  test do
    # count lines test
    (testpath/'Drakefile').write <<-EOS.undent
      find_lines <- [shell]
        echo 'drake' > $OUTPUT

      count_drakes_lines <- find_lines
        cat $INPUT | wc -l > $OUTPUT
    EOS

    # force run (no user prompt) the full workflow
    system bin/'drake', '--auto', "--workflow=#{testpath/'Drakefile'}", '+...'
  end
end
