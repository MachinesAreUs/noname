defmodule Iris.Agencies.EfeExtractorTest do
  use ExUnit.Case, async: true
  alias Iris.Agencies.EfeExtractor
  alias Iris.Image
  
  @resources_base_path "./test/resources/agencies_samples/efe_img/"

  test "to_images" do
    xml_file       = "f-y-general\(efe\)mexico_20150708_0041.xml"
    {:ok, xml_str} = File.read "#{@resources_base_path}/#{xml_file}"
    res            = EfeExtractor.to_images xml_str
    assert length(res) == 2
    Enum.each res, fn(it) -> 
      assert it.__struct__ == Image
      assert not is_nil it.headline
      assert not is_nil it.sub_headline
      assert not is_nil it.copyright_line
      #assert not is_nil it.country
      #assert not is_nil it.provider
      #assert not is_nil it.creation_date
    end
  end

end
