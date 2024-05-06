class DarkModeNotify < Formula
  desc "Swift program running a command whenever the dark mode status changes"
  homepage "https://github.com/bouk/dark-mode-notify"
  url "https://github.com/bouk/dark-mode-notify/archive/4d7fe211f81c5b67402fad4bed44995344a260d1.tar.gz"
  version "0.0.1"
  sha256 "794d588c2f743b982214900fd565e0986badf42f829fd995962280dd585d33ec"

  depends_on :macos

  uses_from_macos "swift" => :build

  def install
    swiftc_flags = %w[
      -O
      -whole-module-optimization
      -lto=llvm-full
    ]

    system "swiftc", "main.swift", *swiftc_flags, "-o", "dark-mode-notify"
    bin.install "dark-mode-notify"
  end

  service do
    run [opt_bin/"dark-mode-notify", "#{Dir.home}/.config/dark-mode-notify/notify"]
    keep_alive true
    working_dir Dir.home
    environment_variables PATH: std_service_path_env
    log_path var/"log/dark-mode-notify.log"
    error_log_path var/"log/dark-mode-notify.log"
  end
end
