defmodule Hjson do
  alias Hjson.Encoder
  alias Hjson.Decoder
  alias Hjson.Parser

  @moduledoc """
  Documentation for Hjson.
  """

  @spec encode(Encoder.t, Keyword.t) :: {:ok, iodata} | {:ok, String.t}

  @spec encode_to_iodata(Encoder.t, Keyword.t) :: {:ok, iodata}

  @spec encode!(Encoder.t, Keyword.t) :: iodata | no_return

  @spec encode_to_iodata!(Encoder.t, Keyword.t) :: iodata | no_return

  @spec decode(iodata, Keyword.t) :: {:ok, Parser.t} | {:error, :invalid}

  @spec decode!(iodata, Keyword.t) :: Parser.t | no_return

end
