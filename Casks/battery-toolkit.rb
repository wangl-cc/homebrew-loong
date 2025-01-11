cask "battery-toolkit" do
  version "1.5"
  sha256 "f83523b621b4e43cbbb7129f08dd2483137c3bb997efd704b9521803e7482075"

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
