defmodule EclipticLynx.ConfigFiles do
  def kde_config_paths() do
    [
      "~/.config/kdeglobals",
      "~/.config/kscreenlockerrc",
      "~/.config/kwinrc",
      "~/.config/gtkrc",
      "~/.config/gtkrc-2.0",
      "~/.config/plasmarc",
      "~/.config/Trolltech.conf",
      "~/.config/kcmfonts",
      "~/.config/kcminputrc",
      "~/.config/oxygenrc",
      "~/.config/plasma-org.kde.plasma.desktop-appletsrc"
    ]
  end

  def kitty_config_path() do
    Path.expand("~/.config/kitty/kitty.conf")
  end

  def config_root() do
    Path.expand("~/.config/exlynx/")
  end

  def system_config() do
    Path.expand("~/.config")
  end
end
