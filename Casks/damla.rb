cask "damla" do
  version "0.7.3"
  sha256 "c2fb9de2bc9e5e73f6ea4195b1b9146b7b10f3ab9cfed638f4fa94549e13ab18"

  url "https://github.com/kaanrkaraman/damla/releases/download/v#{version}/Damla-#{version}.dmg"
  name "Damla"
  desc "Safari extension for downloading videos from social sites"
  homepage "https://github.com/kaanrkaraman/damla"

  livecheck do
    url "https://github.com/kaanrkaraman/damla/releases/latest/download/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Damla.app"

  uninstall quit: "com.kaan.damla"

  zap trash: [
    "~/Library/Application Support/Damla",
    "~/Library/Caches/com.kaan.damla",
    "~/Library/Containers/com.kaan.damla.Extension",
    "~/Library/HTTPStorages/com.kaan.damla",
    "~/Library/Preferences/com.kaan.damla.plist",
  ]
end
