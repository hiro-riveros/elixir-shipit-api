defmodule ShipitApi.Shipment do
  alias ShipitApi.HttpClient
  @moduledoc """
  Documentation for `ShipitApi.Shipment`.
  Shipit Documentation: https://developers.shipit.cl/v4/reference#crear-un-env%C3%ADo
  """

  def create(shipment, email, token) when is_map(shipment) and is_binary(email) and is_binary(token),
    do: HttpClient.make_post_request("shipments", %{shipment: shipment}, email, token)

  def show(id, email, token) when is_integer(id) and is_binary(email) and is_binary(token),
    do: HttpClient.make_get_request("shipments/#{id}", email, token)

  def find_by_reference(reference, email, token) when is_binary(reference) and is_binary(email) and is_binary(token),
    do: HttpClient.make_get_request("shipments/reference/#{reference}", email, token)

  def history(params = %{from_date: from_date,
                         to_date: to_date,
                         status: status,
                         payables: payables,
                         returned: returned,
                         courier: courier,
                         label_printed: label_printed,
                         page: page,
                         per: per}, email, token) when is_map(params) and is_binary(email) and is_binary(token) do
    HttpClient.make_get_request("shipments?from_date=#{from_date}&to_date=#{to_date}&status=#{status}&payables=#{payables}&returned=#{returned}&courier=#{courier}&label_printed=#{label_printed}&page=#{page}&per=#{per}", email, token)
  end
end
