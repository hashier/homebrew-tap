cask "macfolket" do
  version "2026.1"
  sha256 "21826c95573c07d5c9aef73a94d7f1c99f8f88c6b7e410d2b97fe4c6faa1ad43"

  url "https://github.com/hashier/MacFolket/releases/download/v#{version}/MacFolket-#{version}.zip"
  name "MacFolket"
  desc "Swedish-English dictionary for macOS Dictionary.app"
  homepage "https://github.com/hashier/MacFolket"

  preflight do
    system_dict = "/Library/Dictionaries/Svensk-English.dictionary"
    user_dict   = File.expand_path("~/Library/Dictionaries/Svensk-English.dictionary")
    populated   = ->(bundle) { File.exist?(File.join(bundle, "Contents", "Info.plist")) }

    if populated.call(system_dict)
      odie "An older MacFolket install was found at #{system_dict}. " \
           "This Homebrew version installs to ~/Library/Dictionaries/, which would " \
           "leave two copies registered with Dictionary.app. Remove the old copy first, then retry:\n" \
           "  sudo rm -rf \"#{system_dict}\"\n" \
           "  brew reinstall --cask macfolket"
    end

    if populated.call(user_dict)
      odie "A non-Homebrew MacFolket install was found at #{user_dict}. " \
           "Homebrew will not take ownership of existing files. Remove it first, then retry:\n" \
           "  rm -rf \"#{user_dict}\"\n" \
           "  brew reinstall --cask macfolket"
    end
  end

  artifact "Svensk-English.dictionary", target: "~/Library/Dictionaries/Svensk-English.dictionary"
end
