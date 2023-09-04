require 'active_support/concern'

# OpenBD API を使って、書誌情報を取得する
module Shoshi 
  extend ActiveSupport::Concern

  require 'open-uri'
  require 'net/http'
  require 'json'

  def hello 
    return "hello"
  end

  def get_shoshi(isbn)
    url = "https://api.openbd.jp/v1/get?isbn=" + isbn
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    json = JSON.parse(response.body)

    return json
  end
  module_function :hello, :get_shoshi
end