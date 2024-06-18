defmodule EclipticLynx.Create do
  alias EclipticLynx.ConfigFiles

  def create_theme(name) do
    name = name |> without_slash()

    config_dir = ConfigFiles.config_root() <> "/" <> name

    if !(ConfigFiles.config_root() |> File.exists?()) do
      ConfigFiles.config_root() |> File.mkdir!()
    end

    if !File.exists?(config_dir) do
      config_dir |> File.mkdir!()
    else
      prompt_to_replace(name, config_dir)
    end

    clone_kde_config_to(config_dir)
    clone_kitty_config_to(config_dir)
  end

  defp clone_kde_config_to(config_dir) do
    Enum.each(ConfigFiles.kde_config_paths(), fn file_path ->
      file_path = Path.expand(file_path)

      dest_path = config_dir <> "/kde/" <> get_file_name_from(file_path)

      if !File.exists?(config_dir <> "/kde") do
        File.mkdir!(config_dir <> "/kde")
      end

      if File.exists?(file_path) do
        if File.exists?(dest_path) do
          prompt_to_replace(dest_path, file_path)
        else
          File.cp!(file_path, dest_path)
        end
      end
    end)
  end

  defp clone_kitty_config_to(config_dir) do
    dest_path = config_dir <> "/kitty.conf"

    File.cp!(ConfigFiles.kitty_config_path(), dest_path)
  end

  defp prompt_to_replace(name, config_dir) do
    IO.puts("File: #{name} exists. Replace it? (y/N)")

    case IO.gets("") |> String.trim() |> String.downcase() do
      "y" ->
        File.rm_rf!(config_dir)
        File.mkdir!(config_dir)

      "yes" ->
        File.rm_rf!(config_dir)
        File.mkdir!(config_dir)

      _ ->
        IO.puts("No files were modified.")
        :ok
    end
  end

  def without_slash("/" <> rest), do: rest
  def without_slash(word), do: word

  def get_file_name_from(path) do
    path
    |> String.split("/")
    |> List.last()
  end
end
