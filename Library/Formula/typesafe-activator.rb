require 'formula'

class TypesafeActivator < Formula
  homepage 'http://typesafe.com/activator'
  url 'http://downloads.typesafe.com/typesafe-activator/1.0.11/typesafe-activator-1.0.11.zip'
  sha1 '34b22dcc9dd3352ef042f63491774527e0e2ca9d'

  bottle do
    sha1 "932db06f32f19a9e152444ee53c391da3faf9b0f" => :mavericks
    sha1 "fca16679aa196241c563fbad11203f40ada1d947" => :mountain_lion
    sha1 "eae48a4d87c25a2d001b9dbf136f6d8c49f45ff4" => :lion
  end

  def install
    # remove Windows .bat files
    rm Dir['*.bat']
    rm Dir["#{buildpath}/**/*.bat"]

    prefix.install_metafiles

    libexec.install Dir['*']
    bin.write_exec_script libexec/'activator'
  end
end
