cask "zambak" do
  version "0.1.1"
  sha256 "8ade7ec22e50d0419279d8b684be0b12aa856df5d5c0104ccb379e0ba5d0cf93"

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
