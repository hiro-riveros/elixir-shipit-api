# ShipitApi

# Supported features
- Get all Shipit Communes
- Get all Shipit Skus
- Calculate Shipit Rate
- Shipments
  - Create shipments
  - Show shipment by id
  - Find shipments by reference
  - Shipment History

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `shipit_api` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:shipit_api, "~> 0.1.0"}
    # or
    {:shipit_api, "~> 0.1.0", github: "https://github.com/hiro-riveros/elixir-shipit-api"}
  ]
end
```

# Basic usage
```elixir
iex> email = "cuenta@shipit.cl"
iex> token = "SHIPIT-TOKEN"
iex> ShipitApi.communes(email, token)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/shipit_api](https://hexdocs.pm/shipit_api).

