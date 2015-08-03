defmodule Iris.Agencies.ExtractorUtils do

  defmacro news_extractor(name, options) do
    quote do
      defmodule unquote(name) do
        def extract(xml_str) do
          IO.puts "hello from #{unquote(name)}"
          unquote(options)
        end
      end
    end
  end

end
