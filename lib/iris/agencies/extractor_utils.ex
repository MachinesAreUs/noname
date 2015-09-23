defmodule Iris.Agencies.ExtractorUtils do

  def to_news_item(node,
               headline_path, 
               sub_headline_path,
               copyright_path,
               creation_date_path,
               date_format,
               provider) do
    alias Iris.NewsItem
    import Iris.Util.Time
    import Iris.Util.XmlNode

    headline       = node |> first(headline_path)      |> text_or_content
    sub_headline   = node |> first(sub_headline_path)  |> text_or_content
    copyright_line = node |> first(copyright_path)     |> text_or_content
    creation_date  = node |> first(creation_date_path) |> text_or_content 
                          |> from_str(date_format)     |> to_ecto

    %NewsItem{
      headline:       headline,
      sub_headline:   sub_headline,
      copyright_line: copyright_line,
      creation_date:  creation_date,
      provider:       provider
    }
  end

  defmacro news_item_extractor(
           name, 
           root: [xpath: root_path],
           headline: [xpath: headline_path],
           sub_headline: [xpath: sub_headline_path],
           copyright_line: [xpath: copyright_path],
           creation_date: [xpath: creation_date_path, format: date_format],
           provider: [literal: provider]
           ) do
    quote do

      #mod_name = "Iris.Agencies.ExtractorUtils." <> Atom.to_string(unquote(name)) |> String.to_atom
      mod_name = Atom.to_string(unquote(name)) |> String.to_atom
      IO.puts "==>>>>> Defining module #{mod_name}"
      
      defmodule Macro.escape(mod_name) do
        @moduledoc """
        Provides functions for extracting NewsItems and Images from xml documents.
        """

        #@doc """
        #Extracts a list of NesItem structs from a string representing an xml document.
        #"""
        #def extract_news_items(xml_str) do
        #  {:error, "Not yet implemented"}
        #end

        def extract_news_items(xml_str) do
          alias Iris.Util.XmlNode
          xml_str
            |> XmlNode.from_string
            |> XmlNode.all(unquote(root_path))
            |> Enum.map fn(node) -> 
                 alias Iris.Agencies.ExtractorUtils;
                 ExtractorUtils.to_news_item(
                   node, 
                   unquote(headline_path), 
                   unquote(sub_headline_path),
                   unquote(copyright_path),
                   unquote(creation_date_path),
                   unquote(date_format),
                   unquote(provider))
                 end
        end
      end
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
    import Iris.Util.Time
    import Iris.Util.XmlNode

    headline       = node |> first(headline_path)      |> text_or_content
    sub_headline   = node |> first(sub_headline_path)  |> text_or_content
    copyright_line = node |> first(copyright_path)     |> text_or_content
    creation_date  = node |> first(creation_date_path) |> text_or_content 
                          |> from_str(date_format)     |> to_ecto

    %Image{
      headline:       headline,
      sub_headline:   sub_headline,
      copyright_line: copyright_line,
      creation_date:  creation_date,
      provider:       provider
    }
  end

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

      #mod_name = "Iris.Agencies.ExtractorUtils." <> Atom.to_string(unquote(name)) |> String.to_atom
      mod_name = Atom.to_string(unquote(name)) |> String.to_atom
      IO.puts "==>>>>> Defining module #{mod_name}"
      
      defmodule Macro.escape(mod_name) do
        @moduledoc """
        Provides functions for extracting NewsItems and Images from xml documents.
        """

        @doc """
        Extracts a list of NesItem structs from a string representing an xml document.
        """
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
                 ExtractorUtils.to_image(
                   node, 
                   unquote(headline_path), 
                   unquote(sub_headline_path),
                   unquote(copyright_path),
                   unquote(creation_date_path),
                   unquote(date_format),
                   unquote(provider))
                 end
        end
      end
    end
  end

end
