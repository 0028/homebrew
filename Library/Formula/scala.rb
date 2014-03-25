require 'formula'

class Scala < Formula
  homepage 'http://www.scala-lang.org/'
  url 'http://www.scala-lang.org/files/archive/scala-2.10.3.tgz'
  sha1 '04cd6237f164940e1e993a127e7cb21297f3b7ae'

  bottle do
    cellar :any
    sha1 "53346a6e0be6cc505bb07af795a5a7cf48cc3cb1" => :mavericks
    sha1 "75945038d5ce2078f521bb416636e3deb8247e72" => :mountain_lion
    sha1 "00cc30a172243f48e8651a713e2695896d2a961a" => :lion
  end

  devel do
    url 'http://downloads.typesafe.com/scala/2.11.0-RC3/scala-2.11.0-RC3.tgz'
    sha1 'cd1b8fb5b6896c9e3b9f2c6b3eb52556fd25bd3a'
    version '2.11.0-RC3'

    resource 'docs' do
      url 'http://downloads.typesafe.com/scala/2.11.0-RC3/scala-docs-2.11.0-RC3.zip'
      sha1 '34b2dfb77c2fadd276aaaae2be74c52711079ddf'
      version '2.11.0-RC3'
    end
  end

  option 'with-docs', 'Also install library documentation'

  resource 'docs' do
    url 'http://www.scala-lang.org/files/archive/scala-docs-2.10.3.zip'
    sha1 '43bab3ceb8215dad9caefb07eac5c24edc36c605'
  end

  resource 'completion' do
    url 'https://raw.github.com/scala/scala-dist/27bc0c25145a83691e3678c7dda602e765e13413/completion.d/2.9.1/scala'
    sha1 'e2fd99fe31a9fb687a2deaf049265c605692c997'
  end

  def install
    rm_f Dir["bin/*.bat"]
    doc.install Dir['doc/*']
    man1.install Dir['man/man1/*']
    libexec.install Dir['*']
    bin.install_symlink Dir["#{libexec}/bin/*"]

    bash_completion.install resource('completion')

    if build.with? 'docs'
      branch = build.stable? ? 'scala-2.10' : 'scala-2.11'
      (share/'doc'/branch).install resource('docs')
    end

    # Set up an IntelliJ compatible symlink farm in 'idea'
    idea = prefix/'idea'
    idea.install_symlink libexec/'src', libexec/'lib'
    (idea/'doc/scala-devel-docs').install_symlink doc => 'api'
  end

  def caveats; <<-EOS.undent
    To use with IntelliJ, set the Scala home to:
      #{opt_prefix}/idea
    EOS
  end

  test do
    file = testpath/'hello.scala'
    file.write <<-EOS.undent
      object Computer {
        def main(args: Array[String]) {
          println(2 + 2)
        }
      }
    EOS
    output = `'#{bin}/scala' #{file}`
    assert_equal "4", output.strip
    assert $?.success?
  end
end
