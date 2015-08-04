defmodule Iris.Util.Time do
  use Timex

  def to_str(%Ecto.DateTime{year: year, month: month, day: day, hour: hour, min: min, sec: sec}) do
    {:ok, str_date} = Date.from({{year,month,day},{hour,min,sec}}) |> DateFormat.format("{ISOz}")
    str_date
  end

  def to_str(nil), do: ""

  def from_str(date_str, format) do
    use Timex
    {:ok, %DateTime{
      year:   year,
      month:  month,
      day:    day,
      hour:   hour,
      minute: min,
      second: sec
    }} = date_str |> DateFormat.parse(format)
    %Ecto.DateTime{
      year:  year,
      month: month,
      day:   day,
      hour:  hour,
      min:   min,
      sec:   sec
    }
  end
end
