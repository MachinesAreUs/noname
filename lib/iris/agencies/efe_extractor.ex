defmodule Iris.Agencies.EfeExtractor do

  require Record

  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText   , Record.extract(:xmlText   , from_lib: "xmerl/include/xmerl.hrl")

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

    %Image{
      headline:       headline,
      sub_headline:   sub_headline,
      copyright_line: copyright_line
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
