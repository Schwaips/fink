class SendMessageSlackJob < ApplicationJob
  queue_as :default

  def perform(message, user, channel)
   RestClient.post 'https://slack.com/api/chat.postMessage', {
      channel: channel,
      text: message
    },
    {
      Authorization:"Bearer #{ENV["SLACK_TOKEN"]}",
      "X-Slack-User": user,
      "Content-type": "application/json"
    }
  end
end
