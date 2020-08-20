defmodule ShipitApi.Rate do
  alias ShipitApi.HttpClient
  @moduledoc """
  Documentation for `ShipitApi.Rate`.
  Shipit Documentation: https://developers.shipit.cl/v4/reference#consultar-precio-version-estable
  """
  def calculate(parcel, email, token) when is_map(parcel),
    do: HttpClient.make_post_request("rates", %{parcel: parcel}, email, token)
end
