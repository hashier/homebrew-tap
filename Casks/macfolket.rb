cask "macfolket" do
  version "1.3"
  sha256 "PLACEHOLDER_UPDATE_ON_RELEASE"

  url "https://github.com/hashier/MacFolket/releases/download/v#{version}/MacFolket-#{version}.pkg"
  name "MacFolket"
  desc "Swedish-English dictionary for macOS Dictionary.app"
  homepage "https://github.com/hashier/MacFolket"

  preflight do
    user_dict = File.expand_path("~/Library/Dictionaries/Svensk-English.dictionary")
    if File.exist?(user_dict)
      opoo "An older MacFolket install was found at #{user_dict}. " \
           "This Homebrew version installs to /Library/Dictionaries/. " \
           "To avoid duplicates, remove the old copy with:\n" \
           "  rm -rf \"#{user_dict}\""
    end
  end

  pkg "MacFolket-#{version}.pkg"

  uninstall delete: "/Library/Dictionaries/Svensk-English.dictionary"
end
