defmodule FreelaReport.ParserTest do
  use ExUnit.Case

  alias FreelaReport.Parser

  describe "parse_file/1" do
    test "Test parse file" do
      filename = "gen_report.csv"

      response =
        filename
        |> Parser.parse_file()
        |> Enum.map(& &1)

      expected_reponse = [
        ["Daniele", 7, 29, 4, 2018],
        ["Mayk", 4, 9, 12, 2019],
        ["Daniele", 5, 27, 12, 2016],
        ["Mayk", 1, 2, 12, 2017],
        ["Giuliano", 3, 13, 2, 2017],
        ["Cleiton", 1, 22, 6, 2020],
        ["Giuliano", 6, 18, 2, 2019],
        ["Jakeliny", 8, 18, 7, 2017],
        ["Joseph", 3, 17, 3, 2017],
        ["Jakeliny", 6, 23, 3, 2019],
        ["Cleiton", 3, 20, 6, 2016],
        ["Daniele", 5, 1, 5, 2016],
        ["Giuliano", 1, 2, 4, 2020],
        ["Daniele", 3, 5, 5, 2017],
        ["Daniele", 1, 26, 6, 2020],
        ["Diego", 3, 11, 9, 2016],
        ["Mayk", 7, 28, 7, 2017],
        ["Mayk", 7, 3, 9, 2016],
        ["Danilo", 6, 28, 2, 2019],
        ["Diego", 4, 15, 8, 2017],
        ["Cleiton", 8, 3, 10, 2020],
        ["Giuliano", 4, 24, 5, 2020],
        ["Rafael", 7, 1, 7, 2017],
        ["Danilo", 1, 7, 4, 2018],
        ["Diego", 1, 10, 12, 2019],
        ["Joseph", 5, 3, 11, 2020],
        ["Diego", 4, 2, 4, 2017],
        ["Joseph", 3, 10, 9, 2019],
        ["Jakeliny", 8, 15, 3, 2016],
        ["Joseph", 2, 27, 12, 2020],
        ["Rafael", 7, 9, 8, 2017],
        ["Diego", 1, 6, 5, 2018],
        ["Mayk", 3, 14, 6, 2019],
        ["Joseph", 4, 16, 4, 2020],
        ["Cleiton", 7, 2, 7, 2018],
        ["Mayk", 4, 27, 4, 2020],
        ["Mayk", 3, 18, 3, 2020],
        ["Jakeliny", 2, 5, 10, 2020],
        ["Mayk", 4, 9, 11, 2016],
        ["Jakeliny", 1, 29, 12, 2019],
        ["Diego", 6, 30, 3, 2018],
        ["Jakeliny", 8, 24, 12, 2016],
        ["Jakeliny", 5, 3, 10, 2019],
        ["Daniele", 4, 20, 6, 2020],
        ["Jakeliny", 1, 3, 10, 2017]
      ]

      assert response != expected_reponse
    end
  end
end
