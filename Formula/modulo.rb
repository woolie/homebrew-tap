class Modulo < Formula
  desc "source-only dependency manager"
  homepage "https://github.com/modulo-dm/modulo"
  url "https://github.com/modulo-dm/modulo/archive/v0.5.2.tar.gz"
  sha256 "a2499784bc43cdb83e2f5b27c72169540df0bf57d86005c7aaeb2cede9b203eb"

  depends_on :xcode => "8.0"

  def install
    xcodebuild "build", "-project", "modulo.xcodeproj", "-scheme", "modulo", "-configuration", "Release", "SYMROOT=build"
    bin.install "/tmp/modulo"
    man1.install "Documentation/modulo.1"
    man1.install "Documentation/modulo-layout.1"
    man1.install "Documentation/modulo-init.1"
    man1.install "Documentation/modulo-add.1"
    man1.install "Documentation/modulo-update.1"
  end

  test do
    system "#{bin}/modulo", "--help"
  end
end
