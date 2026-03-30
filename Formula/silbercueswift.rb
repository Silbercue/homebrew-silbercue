class Silbercueswift < Formula
  desc "The fastest MCP server for iOS development — 55 tools, xcresult parsing, WDA automation"
  homepage "https://github.com/silbercue/SilbercueSwift"
  version "2.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/silbercue/SilbercueSwift/releases/download/v2.0.0/silbercueswift-v2.0.0-macos-arm64.tar.gz"
      sha256 "3800e5debb90c9c96d62fe4672f08d9474a3c3c1d2e3cffab4c119133a401c66"
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
