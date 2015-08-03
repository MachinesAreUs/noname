defmodule Iris.Util.TimeTest do
  use ExUnit.Case, async: true
  import Iris.Util.Time

  test "formating a null date should give an empty string" do
    assert to_timestamp_str(nil) == "" 
  end

  test "formatting an Ecto.DateTime should give an ISO formatted string" do
    date = %Ecto.DateTime{
      year:  2015,
      month: 8,
      day:   3,
      hour:  16,
      min:   23,
      sec:   0
    }
    assert to_timestamp_str(date) == "2015-08-03T16:23:00Z"
  end

end
