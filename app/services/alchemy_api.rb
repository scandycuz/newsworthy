class AlchemyAPI

  def initialize
    @apikey = "b8766d91aff5a68cd54c21fbb43b7c4aa1e65511"
  end

  def analyze_sentiment
    # get sentiment
    api_url = "https://gateway-a.watsonplatform.net/calls/url/URLGetTextSentiment"
    target_url = "http://confluence-denver.com/innovationnews/alchemyapi_booming.aspx"
    request_url = "#{api_url}?apikey=#{@apikey}&outputMode=json&url=#{target_url}"

    response = HTTP.get(request_url)
    .body

    data = JSON.parse(response)
    score = data['docSentiment']['score'].to_f.round(2)

    p score

    # get emotions
    api_url = "https://gateway-a.watsonplatform.net/calls/url/URLGetEmotion"
    target_url = "http://confluence-denver.com/innovationnews/alchemyapi_booming.aspx"
    request_url = "#{api_url}?apikey=#{@apikey}&outputMode=json&url=#{target_url}"

    response = HTTP.get(request_url)
    .body

    data = JSON.parse(response)
    anger = data['docEmotions']['anger'].to_f.round(2)
    disgust = data['docEmotions']['disgust'].to_f.round(2)
    fear = data['docEmotions']['fear'].to_f.round(2)
    joy = data['docEmotions']['joy'].to_f.round(2)
    sadness = data['docEmotions']['sadness'].to_f.round(2)
    p "#{anger}, #{disgust}, #{fear}, #{joy}, #{sadness}"


  #   response = Excon.get("https://gateway.watsonplatform.net/personality-insights/api/v2/profile",
  #    :headers => { "apikey" => @apikey }
  #  )

    # results = AlchemyAPI.search(:emotion_analysis, url: "http://confluence-denver.com/innovationnews/alchemyapi_booming.aspx")
    # p results

  end

end
