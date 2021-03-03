defmodule Palantirpay.Numbers do
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handleFile()
  end

  defp handleFile({:ok, result}) do

    # WITHOUT PIPE
    # result = String.split(result, ",")
    # result = Enum.map(result, fn number -> String.to_integer(number) end)
    # result = Enum.sum(result)

    result =
      result
      |> String.split(",")
      |> Stream.map( fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handleFile({:error, _error}), do: {:error, %{message: "Invalid file!"}}
end
