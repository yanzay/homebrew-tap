# Homebrew formula for as2inspect — installs the prebuilt release binary.
# Bump `version` and the four sha256 values on each release
# (checksums come from the release's checksums.txt).
class As2inspect < Formula
  desc "Inspect AS2 & X.509 certificates: role, expiry, fingerprint"
  homepage "https://certcutover.com"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/yanzay/as2inspect/releases/download/v0.1.0/as2inspect_darwin_arm64"
      sha256 "826787b05f0c7d1967f49632884343c41b96fa015b4e22c6b5305dbcb9bdea18"
    end
    on_intel do
      url "https://github.com/yanzay/as2inspect/releases/download/v0.1.0/as2inspect_darwin_amd64"
      sha256 "34cae3e22a51bdc793fd435e5aab108b9421945ec98946320a85836c035f4177"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/yanzay/as2inspect/releases/download/v0.1.0/as2inspect_linux_arm64"
      sha256 "4497dfa17c3c1dd833cff6399b8f14f32be28cb439becbe96c6615116c908d23"
    end
    on_intel do
      url "https://github.com/yanzay/as2inspect/releases/download/v0.1.0/as2inspect_linux_amd64"
      sha256 "c5c056be56ddea7a72bfb2da02d362b88ff14e06ebfe8e00d6d085b1242c4761"
    end
  end

  def install
    # The release asset is a bare binary named per-platform; install it as `as2inspect`.
    bin.install Dir["*"].first => "as2inspect"
  end

  test do
    assert_match "as2inspect", shell_output("#{bin}/as2inspect --version")
  end
end
