defmodule Iris.Agencies.EfeExtractor do

  alias Iris.Image
  alias Iris.Util.XmlNode

  def to_images(xml_str) do
    xml_str 
      |> XmlNode.from_string
      |> XmlNode.all('NewsItem')
      |> Enum.map &to_image/1
  end

  defp to_image(xml_node) do
    headline       = xml_node |> XmlNode.first('NewsComponent/NewsLines/HeadLine')      |> XmlNode.text
    sub_headline   = xml_node |> XmlNode.first('NewsComponent/NewsLines/SubHeadLine')   |> XmlNode.text
    copyright_line = xml_node |> XmlNode.first('NewsComponent/NewsLines/CopyrightLine') |> XmlNode.text
    creation_date  = xml_node |> XmlNode.first('Identification/NewsIdentifier/DateId')  |> XmlNode.text |> to_date

    %Image{
      headline:       headline,
      sub_headline:   sub_headline,
      copyright_line: copyright_line,
      creation_date:  creation_date,
      provider:       "EFE"
    }
  end

  def to_date(date_str) do
    use Timex
    {:ok, %DateTime{
      year:   year,
      month:  month,
      day:    day,
      hour:   hour,
      minute: min,
      second: sec
    }} = date_str |> DateFormat.parse "{YYYY}{M}{D}T{h24}{0m}{0s}{Z}"
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
