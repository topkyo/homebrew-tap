cask "agent-fuse" do
  version "0.6.2"
  sha256 "9f8f6e24e007d392f468c5710e9facef14a19607d66727a8d0ae60bee8d35df1"

  url "https://github.com/topkyo/agent-fuse/releases/download/v#{version}/AgentFuse-#{version}-macos.dmg"
  name "AgentFuse Pro"
  desc "Millisecond-scale APFS CoW workspace time machine & runaway circuit breaker for AI agents"
  homepage "https://github.com/topkyo/agent-fuse"

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
