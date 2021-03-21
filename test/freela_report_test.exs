defmodule FreelaReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "Generate report of csv." do
      filename = "gen_report.csv"

      response = FreelaReport.build(filename)

      expected_reponse = %{
        "all_hours" => %{
          "Cleiton" => 422,
          "Daniele" => 435,
          "Danilo" => 452,
          "Diego" => 402,
          "Giuliano" => 406,
          "Jakeliny" => 472,
          "Joseph" => 409,
          "Mayk" => 419,
          "Rafael" => 493,
          "Vinicius" => 506
        },
        "hours_per_month" => %{
          1 => 0,
          2 => 0,
          3 => 0,
          4 => 0,
          5 => 0,
          6 => 0,
          7 => 0,
          8 => 0,
          9 => 0,
          10 => 0,
          11 => 0,
          12 => 0,
          "Cleiton" => 16,
          "Daniele" => 4,
          "Danilo" => 15,
          "Diego" => 36,
          "Giuliano" => 24,
          "Jakeliny" => 6,
          "Joseph" => 36,
          "Mayk" => 36,
          "Rafael" => 36,
          "Vinicius" => 10
        },
        "hours_per_year" => %{
          2016 => 0,
          2017 => 0,
          2018 => 0,
          2019 => 0,
          2020 => 0,
          "Cleiton" => 4032,
          "Daniele" => 4040,
          "Danilo" => 10080,
          "Diego" => 12120,
          "Giuliano" => 6060,
          "Jakeliny" => 6051,
          "Joseph" => 6054,
          "Mayk" => 12102,
          "Rafael" => 6051,
          "Vinicius" => 10100
        }
      }

      assert response == expected_reponse
    end
  end
end
