defmodule ShipitApi.HttpClient do
  use HTTPoison.Base
  @base_url "http://api.shipit.cl/v"
  @content_type "application/json"
  @accept "application/vnd.shipit.v4"
  @moduledoc """
  Documentation for `ShipitApi.HttpClient`.
  """

  def headers(email, token) when is_binary(email) and is_binary(token) do
    ["Accept": @accept,
     "X-Shipit-Email": email,
     "X-Shipit-Access-Token": token,
     "Content-Type": @content_type]
  end

  def make_get_request(path, email, token) do
    case HTTPoison.get("#{@base_url}/#{path}", headers(email, token)) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, response: Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:ok, response: Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        {:ok, response: Jason.decode!(body)}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:ok, response: reason}
    end
  end

  @spec make_post_request(any, any, binary, binary) :: {:ok, [{:response, any}, ...]}
  def make_post_request(path, body, email, token) do
    case HTTPoison.post("#{@base_url}/#{path}", Jason.encode!(body), headers(email, token), [recv_timeout: (20 * 1000)]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, response: Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 400, body: body}} ->
        {:ok, response: Jason.decode!(body)}
      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        {:ok, response: Jason.decode!(body)}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:ok, response: reason}
    end
  end
end
