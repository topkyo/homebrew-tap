cask "agent-fuse" do
  version "0.5.0"
  sha256 "d778b5a9e51ad69795d7d4bee9539fc99dd4203d8ff9cbca09a3f8cb932288fb"

  url "https://github.com/topkyo/agent-fuse/releases/download/v#{version}/AgentFuse-#{version}-macos.dmg"
  name "AgentFuse Pro"
  desc "Millisecond-scale APFS CoW workspace time machine & runaway circuit breaker for AI agents"
  homepage "https://github.com/topkyo/agent-fuse"

  depends_on macos: ">= :monterey"

  app "AgentFuse.app"
  binary "#{appdir}/AgentFuse.app/Contents/MacOS/afuse"

  # Cold-start note (M8): install with `brew install --cask --no-quarantine topkyo/tap/agent-fuse`
  # prior to Apple Developer ID notarization cutover.

  zap trash: [
    "~/Library/Application Support/AgentFuse",
    "~/Library/LaunchAgents/app.agentfuse.pro.plist",
    "~/Library/Preferences/app.agentfuse.pro.plist",
    "~/.agent-fuse",
    "~/.cache/afuse-interactive-demo",
  ]
end
