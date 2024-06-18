defmodule EclipticLynx.Set do
  alias EclipticLynx.ConfigFiles

  def set_theme(name) do
    config_root = ConfigFiles.config_root()

    if File.exists?(config_root) do
      kde_theme_path = config_root <> "/" <> name <> "/kde"
      kitty_path = config_root <> "/" <> name <> "/kitty.conf"

      if File.exists?(kitty_path) do
        set_config(kitty_path, ConfigFiles.kitty_config_path())
        reload_kitty_config()
      end

      if File.exists?(kde_theme_path) do
        set_kde_theme(kde_theme_path)
      end
    end
  end

  def set_config(new_config, destination) do
    File.cp!(new_config, destination)
  end

  def reload_kitty_config() do
    # Get the process IDs of all running kitty instances
    {pids, _status} = System.cmd("pidof", ["kitty"], stderr_to_stdout: true)

    # Check if we got any PIDs back
    if pids != "" do
      # Send the SIGUSR1 signal to all kitty instances
      for pid <- String.split(String.trim(pids)) do
        {output, _status} = System.cmd("kill", ["-SIGUSR1", pid], stderr_to_stdout: true)
        IO.puts("Sent SIGUSR1 to kitty instance #{pid}: #{output}")
      end
    else
      IO.puts("No running kitty instances found.")
    end
  end

  def set_kde_theme(theme_path) do
    theme_files = File.ls!(theme_path)

    Enum.each(theme_files, fn file_name ->
      src_file = theme_path <> "/" <> file_name
      dest_file = ConfigFiles.system_config() <> "/" <> file_name

      File.cp!(src_file, dest_file)
    end)

    reconfigure_kwin()
    restart_plasma_shell()
  end

  def reconfigure_kwin do
    # Use qdbus to reconfigure KWin
    {output, status} =
      System.cmd("qdbus-qt5", ["org.kde.KWin", "/KWin", "reconfigure"], stderr_to_stdout: true)

    IO.puts("Reconfiguring KWin: #{output}")

    if status != 0 do
      IO.puts("Failed to reconfigure KWin.")
    end
  end

  def restart_plasma_shell do
    # Quit Plasma Shell
    {quit_output, quit_status} = System.cmd("kquitapp5", ["plasmashell"], stderr_to_stdout: true)
    IO.puts("Quitting Plasma Shell: #{quit_output}")

    # Wait for a moment to ensure the process is fully stopped
    Process.sleep(1000)

    # Start Plasma Shell
    {start_output, start_status} = System.cmd("kstart5", ["plasmashell"], stderr_to_stdout: true)
    IO.puts("Starting Plasma Shell: #{start_output}")

    {quit_status, start_status}
  end
end
