defmodule EclipticLynx do
  defdelegate create_theme(name), to: EclipticLynx.Create
  defdelegate set_theme(name), to: EclipticLynx.Set
end
