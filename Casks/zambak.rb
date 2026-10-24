cask "zambak" do
  version "0.2.0"
  sha256 "6a03bc0e2d3a7331317f3b7169c2a3e24969a5e9e3d2f4ebcd8604f6477f20cf"

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
