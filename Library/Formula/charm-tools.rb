require 'formula'

class CharmTools < Formula
  homepage 'https://launchpad.net/charm-tools'
  url 'https://launchpad.net/charm-tools/1.2/1.2.9/+download/charm-tools-1.2.9-1.tar.gz'
  sha1 '9da948b85dc2fc547335d28669f694338b0b77e8'

  bottle do
    sha1 "e2b9b9738a7ae62aa4ee078acde400944aa9062e" => :mavericks
    sha1 "62624fb23a7b673dfa68eb3b49ab8f3610636a49" => :mountain_lion
    sha1 "87a0956bbd255b187947dc66cb4829a730bc94ab" => :lion
  end

  depends_on :python
  depends_on 'libyaml'

  def install
    ENV.prepend_create_path 'PYTHONPATH', libexec+'lib/python2.7/site-packages'
    system "python", "setup.py", "install", "--prefix=#{libexec}"

    bin.install Dir[libexec/'bin/*charm*']
    bin.env_script_all_files(libexec+'bin', :PYTHONPATH => ENV['PYTHONPATH'])
  end

  test do
    system "#{bin}/charm", "list"
  end
end
