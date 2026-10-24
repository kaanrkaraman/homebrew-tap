cask "zambak" do
  version "0.4.0"
  sha256 "a9af1db9cadf28516914944a91574fc85dd4788d83da941d44b59c1060f78a12"

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
