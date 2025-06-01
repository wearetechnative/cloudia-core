defmodule CloudiaWeb.AshJsonApiRouter do
  use AshJsonApi.Router,
    domains: [Cloudia.Aws],
    open_api: "/open_api"
end
