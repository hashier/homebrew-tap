cask "macfolket" do
  version "2026.1"
  sha256 "21826c95573c07d5c9aef73a94d7f1c99f8f88c6b7e410d2b97fe4c6faa1ad43"

  url "https://github.com/hashier/MacFolket/releases/download/v#{version}/MacFolket-#{version}.zip"
  name "MacFolket"
  desc "Swedish-English dictionary for macOS Dictionary.app"
  homepage "https://github.com/hashier/MacFolket"

  preflight do
    system_dict = "/Library/Dictionaries/Svensk-English.dictionary"
    if File.exist?(system_dict)
      opoo "An older MacFolket install was found at #{system_dict}. " \
           "This Homebrew version installs to ~/Library/Dictionaries/. " \
           "To avoid duplicates, remove the old copy with:\n" \
           "  sudo rm -rf \"#{system_dict}\""
    end
  end

  artifact "Svensk-English.dictionary", target: "~/Library/Dictionaries/Svensk-English.dictionary"

  uninstall delete: "~/Library/Dictionaries/Svensk-English.dictionary"
end
