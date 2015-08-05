defmodule Iris.Util.Time do
  use Timex

  def to_str(nil), do: ""

  def to_str(%Ecto.DateTime{year: year, month: month, day: day, hour: hour, min: min, sec: sec}) do
    Date.from({{year,month,day},{hour,min,sec}}) |> to_str
  end

  def to_str(date_time = %DateTime{}) do
    {:ok, str_date} = date_time |> DateFormat.format("{ISOz}")
    str_date
  end

  def from_str(date_str, format) do
    {:ok, date_time} = date_str |> DateFormat.parse(format)
    date_time 
  end
  
  def to_ecto(%DateTime{
      year:   year,
      month:  month,
      day:    day,
      hour:   hour,
      minute: min,
      second: sec
    }) do
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
