cask "agent-fuse" do
  version "0.5.0"
  sha256 "0bd56154d497c1b1f80b8669b93874bc8c67b449e5bc736fbfbfdb6ab2b63c72"

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
  ]
end
