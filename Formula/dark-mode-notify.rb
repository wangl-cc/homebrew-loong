class DarkModeNotify < Formula
  desc "Swift program running a command whenever the dark mode status changes"
  homepage "https://github.com/wangl-cc/dark-mode-notify"
  url "https://github.com/wangl-cc/dark-mode-notify/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "91646efab5916f61814f929783926624ab4a5b9166de04556bc0f1c61947f4ea"

  depends_on :macos

  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/dark-mode-notify"
  end

  service do
    run [opt_bin/"dark-mode-notify", "--daemon"]
    keep_alive true
    working_dir Dir.home
    environment_variables PATH: std_service_path_env
    log_path var/"log/dark-mode-notify.log"
    error_log_path var/"log/dark-mode-notify.log"
  end
end
