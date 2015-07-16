defmodule Iris.Agencies.EfeExtractor do

  alias Iris.Image
  alias Iris.XmlNode

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
    creation_date  = xml_node |> XmlNode.first('Identification/NewsIdentifier/DateId')  |> XmlNode.text
    #TODO  convert to DateTime

    %Image{
      headline:       headline,
      sub_headline:   sub_headline,
      copyright_line: copyright_line,
      provider:       "EFE"
    }
  end

  defp inspect_node(xml_node) do
    IO.puts "--Start Inspect--"
    IO.puts "is list  : #{is_list(xml_node)}"
    IO.puts "is tuple : #{is_tuple(xml_node)}"
    IO.puts "is int   : #{is_integer(xml_node)}"
    IO.inspect xml_node
    IO.puts "--End Inspect--"
    xml_node
  end

end
