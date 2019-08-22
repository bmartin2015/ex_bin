defmodule ExBin.Bin do
  @moduledoc """
  Defines a `Bin` Struct
  """

  @type t :: %__MODULE__{
    created: DateTime.t(),
    private: boolean(),
    color: String.t(),
    name: String.t(),
    favicon_uri: String.t(),
    requests: list(),
    secret_key: nil | String.t(),
    request_count: integer()
  }

  defstruct [
    :created,
    :private,
    :color,
    :name,
    :favicon_uri,
    :requests,
    :secret_key,
    :request_count
  ]

  @doc """
  Returns a new `Bin` struct with defaults
  """
  @spec new(keyword) :: ExBin.Bin.t()
  def new(opts \\ []) do
    %__MODULE__{
      created: DateTime.utc_now(),
      private: Keyword.get(opts, :private, false),
      color: "Coming Soon",
      name: Keyword.get(opts, :name, "No Name"),
      favicon_uri: "Coming Soon",
      requests: [],
      secret_key: nil,
      request_count: 0
    }
  end

  def add_request(bin, request) do
    new_requests = [request | Map.fetch!(bin, :requests)]

    bin
    |> Map.put(:requests, new_requests)
    |> Map.put(:request_count, length(new_requests))
  end
end
