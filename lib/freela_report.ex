defmodule FreelaReport do
  alias FreelaReport.Parser

  @freelancers [
    "Daniele",
    "Mayk",
    "Giuliano",
    "Cleiton",
    "Jakeliny",
    "Joseph",
    "Diego",
    "Danilo",
    "Rafael",
    "Vinicius"
  ]

  @years [
    2016,
    2017,
    2018,
    2019,
    2020
  ]

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  defp sum_values(
         [name, hours, _days, months, years],
         %{
           "all_hours" => all_hours,
           "hours_per_month" => hours_per_month,
           "hours_per_year" => hours_per_year
         } = report
       ) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours)
    hours_per_month = Map.put(hours_per_month, name, hours_per_month[months] + hours * months)
    hours_per_year = Map.put(hours_per_year, name, hours_per_year[years] + hours * years)

    report
    |> Map.put("all_hours", all_hours)
    |> Map.put("hours_per_month", hours_per_month)
    |> Map.put("hours_per_year", hours_per_year)
  end

  defp report_acc do
    all_hours = Enum.into(@freelancers, %{}, &{&1, 0})
    hours_per_month = Enum.into(1..12, %{}, &{&1, 0})
    hours_per_year = Enum.into(@years, %{}, &{&1, 0})

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
