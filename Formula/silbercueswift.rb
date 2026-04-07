class Silbercueswift < Formula
  desc "The fastest MCP server for iOS development — 55 tools, xcresult parsing, WDA automation"
  homepage "https://github.com/silbercue/SilbercueSwift"
  version "3.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/silbercue/SilbercueSwift/releases/download/v3.6.2/silbercueswift-v3.6.2-macos-arm64.tar.gz"
      sha256 "2d6aac4039fbd7b088d20a0f3f54661379f32acaab9a93eb4dedf11a2e9342fc"
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
