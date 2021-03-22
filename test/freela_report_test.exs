defmodule FreelaReportTest do
  use ExUnit.Case

  describe "build/1" do
    test "Generate report of csv." do
      filename = "gen_test.csv"

      response = FreelaReport.build(filename)

      expected_reponse = %{
        "all_hours" => %{
          "Cleiton" => 1,
          "Daniele" => 12,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 9,
          "Jakeliny" => 14,
          "Joseph" => 3,
          "Mayk" => 5,
          "Rafael" => 0,
          "Vinicius" => 0
        },
        "hours_per_month" => %{
          "Cleiton" => 6,
          "Daniele" => 88,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 18,
          "Jakeliny" => 74,
          "Joseph" => 9,
          "Mayk" => 60,
          "Rafael" => 0,
          "Vinicius" => 0
        },
        "hours_per_year" => %{
          "Cleiton" => 2020,
          "Daniele" => 24206,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 18165,
          "Jakeliny" => 28250,
          "Joseph" => 6051,
          "Mayk" => 10093,
          "Rafael" => 0,
          "Vinicius" => 0
        }
      }

      assert response == expected_reponse
    end
  end
end
