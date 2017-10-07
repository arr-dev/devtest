require "net/http"

class Downloader
  DEFAULT_USER_AGENT = "Devtest v1.0"

  def initialize(url)
    @url = url
  end

  def body
    response.body
  end

  private

  attr_reader :url, :response

  def response
    @response ||= download
  end

  def download
    uri = URI(url)
    request = Net::HTTP::Get.new(uri)

    request["User-Agent"] = DEFAULT_USER_AGENT

    req_options = {
      use_ssl: uri.scheme == "https"
    }

    res = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
      http.request(request)
    end

    case res
    when Net::HTTPSuccess
      res
    else
      puts "#{res.class} Error fetching '#{request.uri}'"
      puts "Got code '#{res.code}', with body: '#{res.body}'"

      res.value
    end
  end
end
