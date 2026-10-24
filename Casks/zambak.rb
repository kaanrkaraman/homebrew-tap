cask "zambak" do
  version "0.3.0"
  sha256 "fa07154754f570ac0de819af074fd6e4e4e0898ed45ca43455eef33a4d2530b5"

  url "https://github.com/kaanrkaraman/zambak/releases/download/v#{version}/Zambak-#{version}.dmg"
  name "Zambak"
  desc "Screenshot and annotation tool"
  homepage "https://github.com/kaanrkaraman/zambak"

  livecheck do
    url "https://github.com/kaanrkaraman/zambak/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Zambak.app"

  uninstall quit: "com.kaan.zambak"

  zap trash: [
    "~/Library/Caches/com.kaan.zambak",
    "~/Library/HTTPStorages/com.kaan.zambak",
    "~/Library/Preferences/com.kaan.zambak.plist",
  ]
end
