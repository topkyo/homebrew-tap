cask "agent-fuse" do
  version "0.6.3"
  sha256 "76c9b8281181e2579dccd387036ae5e1f6f78d0b9eb93156e6bf1bea0e3f315a"

  url "https://github.com/topkyo/agent-fuse/releases/download/v#{version}/AgentFuse-#{version}-macos.dmg"
  name "AgentFuse Pro"
  desc "Millisecond-scale APFS CoW workspace time machine & runaway circuit breaker for AI agents"
  homepage "https://agentfuse.topkyo.dev/"

  depends_on macos: ">= :monterey"

  app "AgentFuse.app"
  binary "#{appdir}/AgentFuse.app/Contents/MacOS/afuse"

  # Pre-notarization note: install with `brew install --cask --no-quarantine topkyo/tap/agent-fuse`
  # prior to Apple Developer ID notarization cutover.

  zap trash: [
    "~/Library/Application Support/AgentFuse",
    "~/Library/HTTPStorages/app.agentfuse.pro",
    "~/Library/LaunchAgents/app.agentfuse.pro.plist",
    "~/Library/Preferences/app.agentfuse.pro.plist",
    "~/Library/Saved Application State/app.agentfuse.pro.savedState",
    "~/.agent-fuse",
    "~/.cache/afuse-interactive-demo",
  ]
end
