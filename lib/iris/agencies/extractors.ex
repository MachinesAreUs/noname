defmodule Iris.Agencies.Extractors do

  import Iris.Agencies.ExtractorUtils

  image_extractor :EFE,
    root:           [xpath: "NewsItem"],
    headline:       [xpath: "NewsComponent/NewsLines/HeadLine"],
    sub_headline:   [xpath: "NewsComponent/NewsLines/SubHeadLine"],
    copyright_line: [xpath: "NewsComponent/NewsLines/CopyrightLine"],
    #creation_date:  [xpath: "Identification/NewsIdentifier/DateId", with: :to_date, args: "%Y-%m-%d %H:%M:%S%z"],
    #body:           [xpath: "NewsComponent/ContentItem/DataContent/body/body.content"],
    provider:       [literal: "EFE"] 

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