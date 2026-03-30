class Silbercueswift < Formula
  desc "The fastest MCP server for iOS development — 55 tools, xcresult parsing, WDA automation"
  homepage "https://github.com/silbercue/SilbercueSwift"
  version "3.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/silbercue/SilbercueSwift/releases/download/v3.0.0/silbercueswift-v3.0.0-macos-arm64.tar.gz"
      sha256 "46ae68f1b6c88b637b5959b0f2c8ec0a56df1fee5c712243d8caca49f6155329"
    end
  end

  depends_on :macos

  def install
    bin.install "SilbercueSwift"
  end

  def caveats
    <<~EOS
      Add SilbercueSwift to your MCP config:

        # ~/.claude/.mcp.json (global)
        {
          "mcpServers": {
            "SilbercueSwift": {
              "command": "#{opt_bin}/SilbercueSwift"
            }
          }
        }

      Requirements: macOS 13+, Xcode 15+
      For UI automation: WebDriverAgent must be installed on the simulator.

      Pro features (12 EUR/mo): silbercueswift activate <YOUR_KEY>
      Get Pro: https://polar.sh/silbercueswift
    EOS
  end

  test do
    assert_predicate bin/"SilbercueSwift", :executable?
  end
end
