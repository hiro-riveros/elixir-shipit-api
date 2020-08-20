defmodule ShipitApiTest do
  use ExUnit.Case
  doctest ShipitApi

  setup do
    {:ok, email: "", token: ""}
  end

  test "communes", context do
    {:ok, communes} = ShipitApi.communes(context[:email], context[:token])
    assert Enum.count(communes) > 0
  end

  test "skus", context do
    {:ok, response} = ShipitApi.skus(context[:email], context[:token])
    if response[:state] == "error" do
      assert response[:message] == "Cliente sin servicio fulfillment activo"
    else
      assert Enum.count(response[:response]) > 0
    end
  end

  test "rates", context do
    parcel = %{
      length: 10,
      width: 10,
      height: 10,
      weight: 1,
      origin_id: 308,
      destiny_id: 308,
      type_of_destiny: "domicilio",
      algorithm: "1",
      algorithm_days: "2"
    }
    {:ok, result} = ShipitApi.rates(parcel, context[:email], context[:token])
    assert Enum.count(result[:response]["prices"]) > 0
  end

  test "create_shipment", context do
    shipment = %{
      kind: 0,
      platform: 3,
      reference: "#test-hex-6",
      items: 2,
      seller: %{
        name: "shopify",
        id: "1111111"
      },
      sizes: %{
        width: 10,
        height: 10,
        length: 10,
        weight: 1
      },
      courier: %{
        id: 1,
        client: "",
        selected: false,
        payable: false,
        algorithm: 1,
        algorithm_days: nil,
        without_courier: false
      },
      destiny: %{
        street: "apoquindo",
        number: 55555,
        complement: "",
        commune_id: 308,
        commune_name: "LAS CONDES",
        full_name: "Roberto",
        email: "roberto@gmail.com",
        phone: "1111111111",
        kind: "home_delivery",
        courier_destiny_id: nil,
        courier_branch_office_id: nil
      },
      insurance: %{
        ticket_amount: 10000,
        ticket_number: 392832,
        detail: "Zapatos talla x marca n",
        extra: true
      }
    }
    {:ok, result} = ShipitApi.create_shipment(shipment, context[:email], context[:token])
    assert shipment[:reference] == result[:response]["reference"]
  end

  test "show_shipment", context do
    {:ok, result} = ShipitApi.show_shipment(2115789, context[:email], context[:token])
    assert result[:response]["id"] == 2115789
  end

  test "shipment_by_reference", context do
    {:ok, result} = ShipitApi.shipment_by_reference("#333", context[:email], context[:token])
    assert result[:response]["reference"] == "PaThe19"
  end

  test "history", context do
    params = %{
      from_date: "2020-07-01",
      to_date: "2020-07-31",
      status: nil,
      payables: nil,
      returned: nil,
      courier: nil,
      label_printed: false,
      page: 1,
      per: 50
    }
    {:ok, result} = ShipitApi.history(params, context[:email], context[:token])
    assert Enum.count(result[:response]["shipments"]) > 0
  end
end
