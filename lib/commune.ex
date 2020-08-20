defmodule ShipitApi.Commune do
  alias ShipitApi.HttpClient
  @moduledoc """
  Documentation for `ShipitApi.Commune`.
  """
  def all(email, token), do: HttpClient.make_get_request("communes", email, token)
end
