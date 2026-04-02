class Silbercueswift < Formula
  desc "The fastest MCP server for iOS development — 55 tools, xcresult parsing, WDA automation"
  homepage "https://github.com/silbercue/SilbercueSwift"
  version "3.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/silbercue/SilbercueSwift/releases/download/v3.6.1/silbercueswift-v3.6.1-macos-arm64.tar.gz"
      sha256 "4439fc3ca208c727c0a2c9ef76888d86d894421425a7339e36d8862062afffa3"
    end
  end

  depends_on :macos

  def install
    bin.install "SilbercueSwift"
    (share/"silbercueswift").install "SilbercueWDA"
  end

  def caveats
    <<~EOS
      Add SilbercueSwift to Claude Code:

        claude mcp add SilbercueSwift #{opt_bin}/SilbercueSwift

      Requirements: macOS 13+, Xcode 15+
      SilbercueWDA (UI automation) included at: #{opt_share}/silbercueswift/SilbercueWDA

      Pro features (12 EUR/mo): silbercueswift activate <YOUR_KEY>
      Get Pro: https://polar.sh/silbercueswift
    EOS
  end

  test do
    assert_predicate bin/"SilbercueSwift", :executable?
    assert_predicate share/"silbercueswift/SilbercueWDA/SilbercueWDA.xcodeproj", :exist?
  end
end
