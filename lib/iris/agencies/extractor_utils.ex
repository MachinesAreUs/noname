defmodule Iris.Agencies.ExtractorUtils do

  defmacro image_extractor(
           name, 
           root: [xpath: root_path],
           headline: [xpath: headline_path],
           sub_headline: [xpath: sub_headline_path],
           copyright_line: [xpath: copyright_path],
           creation_date: [xpath: creation_date_path, format: date_format],
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
                   unquote(creation_date_path),
                   unquote(date_format),
                   unquote(provider))
                 end
        end

        def to_image(node, 
                     headline_path, 
                     sub_headline_path,
                     copyright_path,
                     creation_date_path,
                     date_format,
                     provider) do
          alias Iris.Image
          import Iris.Util.XmlNode
          import Iris.Util.Time

          headline       = node |> first(headline_path)      |> text
          sub_headline   = node |> first(sub_headline_path)  |> text
          copyright_line = node |> first(copyright_path)     |> text
          creation_date  = node |> first(creation_date_path) |> text |> from_str(date_format)

          %Image{
            headline:       headline,
            sub_headline:   sub_headline,
            copyright_line: copyright_line,
            creation_date:  creation_date,
            provider:       provider
          }
        end

      end
    end
  end

end
