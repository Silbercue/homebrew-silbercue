class Silbercueswift < Formula
  desc "The fastest MCP server for iOS development — 40 tools, xcresult parsing, WDA automation"
  homepage "https://github.com/silbercue/SilbercueSwift"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/silbercue/SilbercueSwift/releases/download/v0.2.0/silbercueswift-v0.2.0-macos-arm64.tar.gz"
      sha256 "845bea24653bc6981c04918bfbb57947b97a36cb05e25392ec43a1c0e5f7ec34"
    end
  end

  depends_on :macos

  def install
    bin.install "silbercueswift" => "SilbercueSwift"
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
    EOS
  end

  test do
    # Binary should start and respond to MCP protocol
    assert_predicate bin/"SilbercueSwift", :executable?
  end
end
