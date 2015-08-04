defmodule Iris.Agencies.ExtractorUtils do


  defmacro image_extractor(
           name, 
           root: [xpath: root_path],
           headline: [xpath: headline_path],
           sub_headline: [xpath: sub_headline_path],
           copyright_line: [xpath: copyright_path],
           provider: [literal: provider]
           ) do
    quote do

      mod_name = Atom.to_string(unquote(name)) |> String.to_atom
      IO.puts "==>>>>> Defining module #{mod_name}"

      defmodule mod_name do
        def extract_news_items(xml_str) do
          {:error, "Not yet implemented"}
        end

        def extract_images(xml_str) do
          alias Iris.Util.XmlNode
          xml_str
            |> XmlNode.from_string
            |> XmlNode.all(unquote(root_path))
            |> Enum.map fn(node) -> 
                 alias Iris.Agencies.ExtractorUtils;
                 to_image(
                   node, 
                   unquote(headline_path), 
                   unquote(sub_headline_path),
                   unquote(copyright_path),
                   unquote(provider))
                 end
        end

        def to_image(xml_node, 
                     headline_path, 
                     sub_headline_path,
                     copyright_path,
                     provider) do
          alias Iris.Image
          alias Iris.Util.XmlNode

          headline       = xml_node |> XmlNode.first(headline_path)     |> XmlNode.text
          sub_headline   = xml_node |> XmlNode.first(sub_headline_path) |> XmlNode.text
          copyright_line = xml_node |> XmlNode.first(copyright_path)    |> XmlNode.text
          #creation_date  = xml_node |> XmlNode.first() |> XmlNode.text |> to_date

          %Image{
            headline:       headline,
            sub_headline:   sub_headline,
            copyright_line: copyright_line,
            #creation_date:  creation_date,
            provider:       provider
          }
        end

      end
    end
  end

end
