defmodule Iris.Time do
  use Timex

  def to_timestamp_str(%Ecto.DateTime{year: year, month: month, day: day, hour: hour, min: min, sec: sec}) do
    {:ok, str_date} = Date.from({{year,month,day},{hour,min,sec}}) |> DateFormat.format("{ISOz}")
    str_date
  end

  def to_timestamp_str(nil), do: ""

end
