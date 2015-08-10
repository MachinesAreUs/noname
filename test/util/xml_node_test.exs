defmodule Iris.Util.XmlNodeTest do
  use ExUnit.Case, async: true
  import Iris.Util.XmlNode
 
  @html_embed_1 "<p><br/>I'm a very enthusiastic software developer.<br/>I like artisanal beers.</p>" 
  @html_embed_2 "<p><br/>I'm a very young software developer.<br/>I like cookies.</p>" 

  @xml_str """
  <people>
    <person id="1">
      <id>1</id>
      <name>Agus</name>
      <job>programmer</job>
      <skills>
        <skill>haskell</skill>
        <skill>elixir</skill>
        <skill>elm</skill>
      </skills>
      <short_bio>
      #{@html_embed_1}
      </short_bio>
    </person>
    <person id="2">
      <id>2</id>
      <name>Juan</name>
      <job>coder</job>
      <skills>
        <skill>css</skill>
        <skill>javascript</skill>
        <skill>php</skill>
      </skills>
      <short_bio>
        #{@html_embed_2}
      </short_bio>
    </person>
  </people>
  """

  setup do
    doc = @xml_str |> from_string
    {:ok, xml: doc}
  end

  test "should parse a simple XML document" do
    xml = @xml_str |> from_string
    assert is_tuple(xml)
    assert elem(xml,0) == :xmlElement
  end

  test "retrieves all elements satisfying an xpath route", %{xml: xml} do
    assert all(xml, "person") |> length == 2 
    assert all(xml, "person/skills/skill") |> length == 6 
    assert all(xml, "person[@id='2']") |> length == 1
  end

  test "retrieves first element satisfying an xpath route", %{xml: xml} do
    element = first(xml, "person")
    assert not is_nil element
    assert is_tuple(element)
    assert elem(element,0) == :xmlElement
  end

  test "retrives the name from an element", %{xml: xml} do
    assert first(xml, "person") |> node_name == :person
  end 

  test "retrieves the attribute value from an element", %{xml: xml} do
    assert first(xml, "person") |> attr("id") == "1"
  end

  test "retrieves inner text from an element", %{xml: xml} do
    element = first(xml, "person")
    assert first(element, "name") |> text == "Agus"
  end 

  test "retrieves the inner text from an element, or the children elements as xml", %{xml: xml} do
    text = first(xml, "person/short_bio/p") |> text_or_content
    assert text == "<p><br>I'm a very enthusiastic software developer.<br>I like artisanal beers.</p>"
  end

  test "retrieves the inner text from an element, or the children elements as plain text", %{xml: xml} do
    text = first(xml, "person/short_bio/p") |> text_or_content(:text)
    assert text == "I'm a very enthusiastic software developer.I like artisanal beers."
  end

end
