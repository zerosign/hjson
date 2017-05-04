defmodule Hjson.SyntaxError do
  defexception [:message, :token, :pos]

  def exception(opts) do
    message = if token = opts[:token] do
      "Unexpected token at position #{opts[:pos]}: #{token}"
    else
      "Unexpected end of input at position #{opts[:pos]}"
    end

    %Hjson.SyntaxError{message: message, token: token}
  end
end

defmodule Hjson.Parser do
  # TODO
end
