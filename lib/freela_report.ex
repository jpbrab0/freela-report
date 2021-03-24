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

  def build(filename) do
    filename
    |> Parser.parse_file()
    |> Enum.reduce(report_acc(), fn line, report -> sum_values(line, report) end)
  end

  def build_parallel(filenames) when not is_list(filenames), do: {:error, "Please provide list of a strings."}

  def build_parallel(filenames) do
    filenames
    |> Task.async_stream(fn filename -> build(filename) end)
    |> Enum.reduce(report_acc(), fn {:ok, result}, report -> sum_reports(report, result) end)
  end

  defp sum_reports(%{"all_hours" => all_hours1, "hours_per_month" => hours_per_month1, "hours_per_year" => hours_per_year1}, %{"all_hours" => all_hours2, "hours_per_month" => hours_per_month2, "hours_per_year" => hours_per_year2}) do
    all_hours = merge_maps(all_hours1, all_hours2)
    hours_per_month = merge_maps(hours_per_month1, hours_per_month2)
    hours_per_year = merge_maps(hours_per_year1, hours_per_year2)

    %{"all_hours" => all_hours, "hours_per_month" => hours_per_month, "hours_per_year" => hours_per_year}
  end

  defp merge_maps(map1, map2) do
    Map.merge(map1, map2, fn _key, value1, value2 -> value1 + value2 end)
  end

  defp sum_values([name, hours, _days, months, years], %{"all_hours" => all_hours, "hours_per_month" => hours_per_month, "hours_per_year" => hours_per_year} = report) do
    all_hours = Map.put(all_hours, name, all_hours[name] + hours)
    hours_per_month = Map.put(hours_per_month, name, hours_per_month[name] + hours * months)
    hours_per_year = Map.put(hours_per_year, name, hours_per_year[name] + hours * years)

    report
    |> Map.put("all_hours", all_hours)
    |> Map.put("hours_per_month", hours_per_month)
    |> Map.put("hours_per_year", hours_per_year)
  end

  defp report_acc() do
    all_hours = Enum.into(@freelancers, %{}, &{&1, 0})
    hours_per_month = Enum.into(@freelancers, %{}, &{&1, 0})
    hours_per_year = Enum.into(@freelancers, %{}, &{&1, 0})

    %{
      "all_hours" => all_hours,
      "hours_per_month" => hours_per_month,
      "hours_per_year" => hours_per_year
    }
  end
end
