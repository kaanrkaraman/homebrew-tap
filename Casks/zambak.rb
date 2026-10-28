cask "zambak" do
  version "0.6.0"
  sha256 "fc88d48e96dae92fae5b572f51d32ddcccaf940ed34f8aa97b936cbef3ac7f22"

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
