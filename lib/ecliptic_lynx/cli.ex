defmodule EclipticLynx.CLI do
  @moduledoc false

  def main(args \\ []) do
    args
    |> parse_args()
    |> process_command()
  end

  defp parse_args(args) do
    OptionParser.parse(args, switches: [])
  end

  defp process_command({_opts, ["create", name], _}) do
    IO.puts("Creating global theme with current settings.")
    EclipticLynx.create_theme(name)
  end

  defp process_command({_opts, ["set", name], _}) do
    IO.puts("Setting global theme to #{name}")
    EclipticLynx.set_theme(name)
  end

  defp process_command(_other) do
    IO.puts("""
    Usage:
    exlynx set [THEME_NAME]           - Sets the system theme to the theme name 
    """)
  end
end
