defmodule Iris.Util.Time do
  use Timex

  @doc """
  Formatting a nil value, gives back an empty string

  # Example

      iex> import Iris.Util.Time
      iex> to_str nil
      ""
  """
  def to_str(nil), do: ""

  @doc """
  Formats an Ecto.DateTime value to an ISO 8601 string

  # Examples

      iex> import Iris.Util.Time
      iex> date_time = %Ecto.DateTime{year: 2015, month: 8, day: 3, hour: 16, min: 23, sec: 0}
      iex> to_str date_time
      "2015-08-03T16:23:00Z"
  """
  def to_str(%Ecto.DateTime{year: year, month: month, day: day, hour: hour, min: min, sec: sec}) do
    Date.from({{year,month,day},{hour,min,sec}}) |> to_str
  end

  @doc """
  Formats an Timex.DateTime value to an ISO 8601 string,

  # Examples 

      iex> import Iris.Util.Time
      iex> use Timex 
      iex> date_time = Date.from {{2015, 8, 3}, {16, 23, 0}}, :utc
      iex> to_str date_time
      "2015-08-03T16:23:00Z"

      iex> import Iris.Util.Time
      iex> use Timex 
      iex> date_time = Date.from {{2015, 8, 28}, {6, 6, 6}}, :utc
      iex> to_str date_time
      "2015-08-28T06:06:06Z"
  """
  def to_str(%DateTime{} = date_time) do
    {:ok, str_date} = date_time |> DateFormat.format("{ISOz}")
    str_date
  end

  @doc """
  Creates an Timex.DateTime record from a string.
  The format syntaxis is the one available in the Timex library.
  
  # Examples

      iex> import Iris.Util.Time
      iex> date_time = from_str "20150707T223929+0000", "{YYYY}{M}{D}T{h24}{0m}{0s}{Z}"
      iex> date_time.year
      2015
      iex> date_time.month
      7
      iex> date_time.day
      7
      iex> date_time.hour
      22
      iex> date_time.minute
      39
      iex> date_time.second
      29

      iex> import Iris.Util.Time
      iex> date_time = from_str "2015-08-28T06:06:06Z", "{ISOz}"
      iex> date_time.year
      2015
      iex> date_time.month
      8
      iex> date_time.day
      28 
      iex> date_time.hour
      6
      iex> date_time.minute
      6
      iex> date_time.second
      6
  """
  def from_str(date_str, format) do
    case date_str |> DateFormat.parse(format) do
      {:ok, date_time} -> date_time
      {:error, msg}    -> {:error, msg}
    end
  end
 
  @doc """
  Converts an Timex.DateTime value to an Ecto.DateTime one  

  # Example

      iex> use Timex
      iex> import Iris.Util.Time
      iex> timex_datetime = Date.now
      iex> ecto_datetime = to_ecto timex_datetime
      iex> ecto_datetime.year == timex_datetime.year
      true
      iex> ecto_datetime.month == timex_datetime.month
      true
      iex> ecto_datetime.day == timex_datetime.day 
      true
      iex> ecto_datetime.hour == timex_datetime.hour 
      true
      iex> ecto_datetime.min == timex_datetime.minute 
      true
      iex> ecto_datetime.sec == timex_datetime.second 
      true
  """
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
