cask "battery-toolkit" do
  version "1.6"
  sha256 "1a4d99b55e49b69465f526d783de8a2fa5e1648394989f6c8328ccd9d4b0d73f"

  url "https://github.com/mhaeuser/Battery-Toolkit/releases/download/#{version}/Battery-Toolkit-#{version}.zip"
  name "Battery Toolkit"
  desc "Control the platform power state of your Apple Silicon MacBooks"
  homepage "https://github.com/mhaeuser/Battery-Toolkit"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates false
  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "Battery Toolkit.app"

  uninstall launchctl:  [
              "me.mhaeuser.BatteryToolkitAutostart",
              "me.mhaeuser.batterytoolkitd",
            ],
            quit:       "me.mhaeuser.BatteryToolkit",
            login_item: "Battery Toolkit"

  zap trash: [
    "~/Library/Preferences/me.mhaeuser.BatteryToolkit.plist",
    "~/Library/Saved Application State/me.mhaeuser.BatteryToolkit.savedState",
  ]
end
