# FreelaReport

Desafio 2 - Ignite Elixir

Nesse desafio, você deverá gerar um relatório a partir de um arquivo .csv.

```elixir
iex> FreelaReport.build("gen_test.csv")
%{
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
```
E também com muitos arquivos:

```bash
iex> FreelaReport.build_parallel(["report_1.csv", "report_2.csv", "report_3.csv"])
```

## Todo List

- [x] Criar parser.
- [x] Criar função de somar o tempo de todos os freelancers.
- [x] Testes.
- [x] Refatorar bugs.
- [x] Adicionar versão paralela do projeto.
- [x] Adicionar testes da versão paralela.