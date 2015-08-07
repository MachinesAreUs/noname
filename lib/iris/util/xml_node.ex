defmodule Iris.Util.XmlNode do
  require Record
  Record.defrecord :xmlAttribute, Record.extract(:xmlAttribute, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText     , Record.extract(:xmlText     , from_lib: "xmerl/include/xmerl.hrl")

  def from_string(xml_string, options \\ [quiet: true]) do
    {doc, []} =
      xml_string
      |> :binary.bin_to_list
      |> :xmerl_scan.string(options)
    doc
  end

  def all(node, path) do
    for child_element <- xpath(node, path) do
      child_element
    end
  end

  def first(node, path), do: node |> xpath(path) |> take_one
  defp take_one([head | _]), do: head
  defp take_one(_), do: nil

  def node_name(nil), do: nil
  def node_name(node), do: elem(node, 1)

  def attr(node, name), do: node |> xpath('./@#{name}') |> extract_attr
  defp extract_attr([xmlAttribute(value: value)]), do: List.to_string(value)
  defp extract_attr(_), do: nil

  def text(node), do: node |> xpath('./text()') |> extract_text
  defp extract_text([xmlText(value: value)]), do: List.to_string(value)
  defp extract_text(_x), do: nil

  def xpath(nil, _), do: []
  def xpath(node, path) do
    :xmerl_xpath.string(to_char_list(path), node)
  end

  @html_head "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n"

  def text_or_content(element, format \\ :html) do
    unless is_nil(element) do
      case text_ = text element do
        nil -> 
          # Erlang hackery. We convert the element to a nice html text
          html = :xmerl.export([element], xmerl_format(format))
          html = :erlang.iolist_to_binary( :io_lib.format("~s~n",[html]) )
          String.replace html, @html_head, ""
        _   -> text_ 
      end
    end
  end

  defp xmerl_format(format) do
    case format do
      :html -> :xmerl_html
      :xml  -> :xmerl_xml
      :text -> :xmerl_text
    end
  end
end

