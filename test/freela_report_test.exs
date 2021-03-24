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
  describe "build_parallel/1" do
    test "Generate report if provided a list of csv's." do
      filenames = ["gen_test.csv", "gen_test.csv"]

      response = FreelaReport.build_parallel(filenames)

      expected_reponse = %{
        "all_hours" => %{
          "Cleiton" => 2,
          "Daniele" => 24,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 18,
          "Jakeliny" => 28,
          "Joseph" => 6,
          "Mayk" => 10,
          "Rafael" => 0,
          "Vinicius" => 0
        },
        "hours_per_month" => %{
          "Cleiton" => 12,
          "Daniele" => 176,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 36,
          "Jakeliny" => 148,
          "Joseph" => 18,
          "Mayk" => 120,
          "Rafael" => 0,
          "Vinicius" => 0
        },
        "hours_per_year" => %{
          "Cleiton" => 4040,
          "Daniele" => 48412,
          "Danilo" => 0,
          "Diego" => 0,
          "Giuliano" => 36330,
          "Jakeliny" => 56500,
          "Joseph" => 12102,
          "Mayk" => 20186,
          "Rafael" => 0,
          "Vinicius" => 0
        }
      }

      assert response == expected_reponse
    end

    test "Return error if not provided a list of csv's" do
      response = FreelaReport.build_parallel("banana")

      expected_response = {:error, "Please provide list of a strings."}

      assert response == expected_response
    end
  end
end
