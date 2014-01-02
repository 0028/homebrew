require 'formula'

class Leiningen < Formula
  homepage 'https://github.com/technomancy/leiningen'
  url 'https://github.com/technomancy/leiningen/archive/2.3.4.tar.gz'
  sha1 '0fdccbc441237a1dde5dd16b5d9edb936c4a8c36'

  head 'https://github.com/technomancy/leiningen.git'

  bottle do
    sha1 'c133f1057a1e83cc0158bfe5e7065193ea05b661' => :mavericks
    sha1 '0ec2e000d8cc5e850619bb79d3761cb5d620a7e7' => :mountain_lion
    sha1 '9dfb5e2933bbc905703d0eb18c1ef9bf5e90e823' => :lion
  end

  resource 'jar' do
    url 'https://leiningen.s3.amazonaws.com/downloads/leiningen-2.3.4-standalone.jar'
    sha1 '59718bb8553f25b8ca853f57dd259cd81eb16f91'
  end

  def install
    libexec.install resource('jar')

    # bin/lein autoinstalls and autoupdates, which doesn't work too well for us
    inreplace "bin/lein-pkg" do |s|
      s.change_make_var! 'LEIN_JAR', libexec/"leiningen-#{version}-standalone.jar"
    end

    bin.install "bin/lein-pkg" => 'lein'
    bash_completion.install 'bash_completion.bash' => 'lein-completion.bash'
    zsh_completion.install 'zsh_completion.zsh' => '_lein'
  end

  def caveats; <<-EOS.undent
    Dependencies will be installed to:
      $HOME/.m2/repository
    To play around with Clojure run `lein repl` or `lein help`.
    EOS
  end

  test do
    # Test creates a sample project with a project.clj, core.clj and core_test.clj.
    # It then runs the tests in core_test.clj for the sample project.
    (testpath/'project.clj').write <<-'EOF'.undent
      (defproject brew-test "1.0.0-SNAPSHOT"
        :description "An example project for Homebrew to test Leiningen"
        :url "http://brew.sh"
        :license {:name "Eclipse Public License, and the Homebrew License (BSD 2 Clause / NetBSD)"
                  ; :also_licensed_under "https://github.com/Homebrew/homebrew/tree/master/Library/Homebrew/LICENSE"
                  :url "http://www.eclipse.org/legal/epl-v10.html"}
        :dependencies [[org.clojure/clojure "1.5.1"]])
    EOF
    (testpath/'test/brew_test/core_test.clj').write <<-'EOF'.undent
      (ns brew-test.core-test
        (:require [clojure.test :refer :all]
                  [brew-test.core :refer :all]))
      (deftest canary-test
        (testing "adds-two yields 4 for input of 2"
          (is (= 4 (adds-two 2))))
        (testing "adds-two yields 6 for input of 4"
          (is (= 6 (adds-two 4))))
        (testing "adds-two yields 0 for input of -2"
          (is (= 0 (adds-two -2)))))
    EOF
    (testpath/'src/brew_test/core.clj').write <<-'EOF'.undent
      (ns brew-test.core)
        (defn adds-two
          "I add two to a number"
          [x]
          (+ x 2))
    EOF
    # Now that the project is scaffolded, run the tests!
    system "#{bin}/lein", 'test'
  end

end
