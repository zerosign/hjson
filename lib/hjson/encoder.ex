defmodule Hjson.EncodeError do
  defexception value: nil, message: nil

  def message(%{value: value, message: nil}) do
    "unable to encode value: #{inspect value}"
  end

  def message(%{message: message}) do
    message
  end
end


defmodule Hjson.Encode do

  defmacro __using__(_) do
    # TODO
    quote do

    end
  end

end

defprotocol Hjson.Encoder do
  @fallback_to_any true

  def encode(value, options)
end

defimpl Hjson.Encoder, for: Atom do
  def encode(nil, _), do: "null"
  def encode(true, _), do: "true"
  def encode(false, _), do: "false"

  def encode(atom, options) do
    # TODO
  end
end
