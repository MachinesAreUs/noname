defmodule Iris.Agencies.Extractors do

  import Iris.Agencies.ExtractorUtils

  image_extractor :EFE,
    root:           [xpath: "NewsItem"],
    headline:       [xpath: "NewsComponent/NewsLines/HeadLine"],
    sub_headline:   [xpath: "NewsComponent/NewsLines/SubHeadLine"],
    copyright_line: [xpath: "NewsComponent/NewsLines/CopyrightLine"],
    creation_date:  [xpath: "Identification/NewsIdentifier/DateId", 
                     format: "{YYYY}{M}{D}T{h24}{0m}{0s}{Z}"],
    provider:       [literal: "EFE"] 

  image_extractor :AFP,
    root:           [xpath: "NewsItem"],
    headline:       [xpath: "NewsComponent/NewsLines/HeadLine"],
    sub_headline:   [xpath: "NewsComponent/NewsLines/HeadLine"], 
    copyright_line: [xpath: "NewsComponent/NewsComponent[2]/ContentItem/DataContent/nitf/body/body.content/p"],
    creation_date:  [xpath: "NewsManagement/FirstCreated", 
                     format: "{YYYY}{M}{D}T{h24}{0m}{0s}{Z}"],
    provider:       [literal: "AFP"] 

    #news_extractor :AFP,
    #  headline:       [xpath: "NewsML/NewsComponent/HeadLine"],
    #  sub_headline:   :none,
    #  copyright_line: :none,
    #  creation_date:  [xpath: "NewsML/NewsComponent/DescriptiveMetadata/DateLineDate", with: :to_date],
    #  body:           [xpath: "NewsItem/NewsComponent/ContentItem/DataContent/body/body.content"],
    #  provider:       [literal: "AFP"] 

    #news_extractor :Reuters,
    #  headline:       [xpath: "NewsComponent/NewsLines/HeadLine"],
    #  sub_headline:   [xpath: "NewsComponent/NewsLines/SubHeadLine"],
    #  copyright_line: [xpath: "NewsComponent/NewsLines/CopyrightLine"],
    #  creation_date:  [xpath: "Identification/NewsIdentifier/DateId", with: :to_date],
    #  body:           [xpath: "NewsItem/NewsComponent/ContentItem/body"],
    #  provider:       [literal: "Reuters"] 

end
