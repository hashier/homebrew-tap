cask "macfolket" do
  version "1.3"
  sha256 "PLACEHOLDER_UPDATE_ON_RELEASE"

  url "https://github.com/hashier/MacFolket/releases/download/v#{version}/MacFolket-#{version}.pkg"
  name "MacFolket"
  desc "Swedish-English dictionary for macOS Dictionary.app"
  homepage "https://github.com/hashier/MacFolket"

  pkg "MacFolket-#{version}.pkg"

  uninstall delete: "/Library/Dictionaries/Svensk-English.dictionary"
end
