require "formula"

class Qwtpolar < Formula
  homepage "http://qwtpolar.sourceforge.net/"
  url "http://downloads.sf.net/project/qwtpolar/qwtpolar/1.1.0/qwtpolar-1.1.0.tar.bz2"
  sha1 "94d5f897e75e37f32c910e3bdf2a1ffbaaf76621"

  bottle do
    sha1 "24682ae116e0136e2dc54ccac389c8416475c2e9" => :mavericks
    sha1 "4fd5321bd6e3b99942cd1dd5c1eed26e6803f867" => :mountain_lion
    sha1 "bedb5d71da0cfb1f786e0a249377b8b63cbc7114" => :lion
  end

  option "with-examples", "Install source code for example apps"

  depends_on "qt"
  depends_on "qwt"

  def install
    cd "doc" do
      doc.install "html"
      man3.install Dir["man/man3/{q,Q}wt*"]
    end
    rm_r "doc"

    libexec.install Dir["examples/*"] if build.with? "examples"

    inreplace "qwtpolarconfig.pri" do |s|
      # change_make_var won't work because there are leading spaces
      s.gsub! /^(\s*)QWT_POLAR_INSTALL_PREFIX\s*=\s*(.*)$/,
              "\\1QWT_POLAR_INSTALL_PREFIX=#{prefix}"
      # don't build examples now, since linking flawed until qwtpolar installed
      s.sub! /\+(=\s*QwtPolarExamples)/, "-\\1"
    end

    # update designer plugin linking back to qwtpolar framework/lib
    inreplace "designer/designer.pro" do |s|
      s.sub! /(INSTALLS \+= target)/, "\\1\n" + <<-EOS.undent
        macx {
            contains(QWT_POLAR_CONFIG, QwtPolarFramework) {
                QWTP_LIB = qwtpolar.framework/Versions/$${QWT_POLAR_VER_MAJ}/qwtpolar
            }
            else {
                QWTP_LIB = libqwtpolar.$${QWT_POLAR_VER_MAJ}.dylib
            }
            QMAKE_POST_LINK = install_name_tool -change $${QWTP_LIB} #{opt_prefix}/lib/$${QWTP_LIB} ${DESTDIR}/$(TARGET)
        }
      EOS
    end

    args = %W[-config release -spec]
    # On Mavericks we want to target libc++, this requires a unsupported/macx-clang-libc++ flag
    if ENV.compiler == :clang and MacOS.version >= :mavericks
      args << "unsupported/macx-clang-libc++"
    else
      args << "macx-g++"
    end

    ENV["QMAKEFEATURES"] = "#{Formula.factory("qwt").opt_prefix}/features"
    system "qmake", *args
    system "make"
    system "make", "install"

    # symlink Qt Designer plugin (note: not removed on qwtpolar formula uninstall)
    cd Formula.factory("qt").opt_prefix/"plugins/designer" do
      ln_sf prefix/"plugins/designer/libqwt_polar_designer_plugin.dylib", "."
    end
  end

end
