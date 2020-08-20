defmodule ShipitApi do
  alias ShipitApi.{Commune, Rate, Sku, Shipment}
  @moduledoc """
  Documentation for `ShipitApi`.
  Shipit documentation: https://developers.shipit.cl/v4/reference#comienza-con-nuestra-api
  """
  def communes(email, token), do: Commune.all(email, token)

  def skus(email, token), do: Sku.all(email, token)

  def rates(parcel, email, token) when is_map(parcel) and is_binary(email) and is_binary(token) do
    Rate.calculate(%{length: parcel[:length],
                     width: parcel[:width],
                     height: parcel[:height],
                     weight: parcel[:weight],
                     origin_id: parcel[:origin_id],
                     destiny_id: parcel[:destiny_id],
                     type_of_destiny: parcel[:type_of_destiny],
                     algorithm: parcel[:algorithm],
                     algorithm_days: parcel[:algorithm_days]}, email, token)
  end

  def create_shipment(shipment, email, token) when is_map(shipment) and is_binary(email) and is_binary(token) do
    Shipment.create(%{
      kind: shipment[:kind],
      platform: shipment[:kind],
      reference: shipment[:reference],
      items: shipment[:items],
      seller: shipment[:seller],
      sizes: shipment[:sizes],
      courier: shipment[:courier],
      origin: shipment[:origin],
      destiny: shipment[:destiny],
      insurance: shipment[:insurance],
      products: shipment[:products]}, email, token)
  end

  def show_shipment(id, email, token) when is_integer(id) and is_binary(email) and is_binary(token) do
    Shipment.show(id, email, token)
  end

  def shipment_by_reference(reference, email, token) when is_binary(reference) and is_binary(email) and is_binary(token) do
    Shipment.find_by_reference(reference, email, token)
  end


  def history(params, email, token) when is_map(params) and is_binary(email) and is_binary(token) do
    Shipment.history(params, email, token)
  end
end
