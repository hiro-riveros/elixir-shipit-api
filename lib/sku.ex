defmodule ShipitApi.Sku do
  alias ShipitApi.HttpClient
  @moduledoc """
  Documentation for `ShipitApi.Sku`.
  Shipit Documentation: https://developers.shipit.cl/v4/reference#skus
  """

  def all(email, token) when is_binary(email) and is_binary(token),
    do: HttpClient.make_get_request("fulfillment/skus/all", email, token)
end
