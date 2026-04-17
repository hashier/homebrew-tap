cask "macfolket" do
  version "1.3"
  sha256 "PLACEHOLDER_UPDATE_ON_RELEASE"

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
