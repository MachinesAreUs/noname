defmodule Iris.Agencies.ImageExtractorTest do
  use ExUnit.Case, async: true
  alias Iris.Agencies.EfeExtractor
  alias Iris.Image
  
  @resources_base_path "./test/resources/agencies_samples/efe_img/"

  test "EFE extract images" do
    xml_file       = "f-y-general\(efe\)mexico_20150708_0041.xml"
    {:ok, xml_str} = File.read "#{@resources_base_path}/#{xml_file}"
    res            = :EFE.extract_images xml_str
    assert length(res) == 2
    Enum.each res, fn(it) -> 
      assert it.__struct__ == Image
      assert not is_nil it.headline
      assert not is_nil it.sub_headline
      assert not is_nil it.copyright_line
      #assert not is_nil it.country
      assert it.provider == "EFE"
      assert not is_nil it.creation_date
    end
  end
 
  # AFP

  @resources_base_path "./test/resources/agencies_samples/afp_img/"

  test "AFP extract images" do
    xml_file       = "482869648.xml"
    {:ok, xml_str} = File.read "#{@resources_base_path}/#{xml_file}"
    res            = :AFP.extract_images xml_str
    assert length(res) == 1
    Enum.each res, fn(it) -> 
      assert it.__struct__ == Image
      assert not is_nil it.headline
      assert not is_nil it.sub_headline
      assert not is_nil it.copyright_line
      #assert not is_nil it.country
      assert it.provider == "AFP"
      assert not is_nil it.creation_date

      IO.puts "--> AFP headline:       #{inspect it.headline}"
      IO.puts "--> AFP sub_headline:   #{inspect it.sub_headline}"
      IO.puts "--> AFP creation_date:  #{inspect it.creation_date}"
      IO.puts "--> AFP copyright_line: #{inspect it.copyright_line}"
    end
  end

end
