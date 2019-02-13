module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        =  Rails.application.credentials.dig(:tweet, :consumer_key)
      config.consumer_secret     =  Rails.application.credentials.dig(:tweet, :consumer_secret)
      config.access_token        =  Rails.application.credentials.dig(:tweet, :access_token)
      config.access_token_secret =  Rails.application.credentials.dig(:tweet, :access_token_secret)
    end

    client.search("#rubyonrails", result_type: 'recent').take(6).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end