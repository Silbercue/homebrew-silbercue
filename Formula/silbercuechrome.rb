class Silbercuechrome < Formula
  desc "Fast MCP server for Chrome browser automation via CDP"
  homepage "https://github.com/Silbercue/silbercuechrome"
  url "https://github.com/Silbercue/silbercuechrome/releases/download/v1.1.1/silbercuechrome-pro-v1.1.1-macos-arm64.tar.gz"
  version "1.1.1"
  sha256 "8c01951bbf8ade7890f766c25dc489a4ac8ea1c97832806b7a4576c3703eef51"
  license "MIT"

  depends_on arch: :arm64
  depends_on :macos

  def install
    bin.install "silbercuechrome-pro" => "silbercuechrome"
  end

  def caveats
    <<~EOS
      SilbercueChrome launches Google Chrome via the Chrome DevTools Protocol.
      Make sure Google Chrome is installed — auto-launch needs it at runtime.

      To use with Claude Code:
        claude mcp add --scope user silbercuechrome #{opt_bin}/silbercuechrome

      IMPORTANT: After `claude mcp add`, fully quit and reopen Claude Code.
      `/mcp reconnect` is NOT enough — Claude Code caches mcpServers at
      session start and keeps using the old config until a full restart.

      To activate Pro (purchase at https://polar.sh/silbercuechrome):
        silbercuechrome activate <YOUR-LICENSE-KEY>
    EOS
  end

  test do
    assert_match "@silbercue/chrome-pro", shell_output("#{bin}/silbercuechrome version")
  end
end
