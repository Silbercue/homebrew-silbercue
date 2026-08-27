class Silbercueswift < Formula
  desc "The fastest MCP server for iOS development — 49 tools free, xcresult parsing, WDA automation"
  homepage "https://github.com/silbercue/SilbercueSwift"
  version "3.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/silbercue/SilbercueSwift/releases/download/v3.6.3/silbercueswift-v3.6.3-macos-arm64.tar.gz"
      sha256 "124ba733f108d6154a8c299a91a8fc548bd1f37093b9cd9ed527233aa65fe61c"
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
