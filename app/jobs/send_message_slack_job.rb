class SendMessageSlackJob < ApplicationJob
  queue_as :default

  def perform(message, user, channel)
   RestClient.post 'https://slack.com/api/chat.postMessage', {
      channel: channel,
      text: message
    },
    {
      Authorization:"Bearer xoxp-1715641287046-1746235713077-1768601390386-ea967ce886e26608b1728eb74dbef41e",
      "X-Slack-User": user,
      "Content-type": "application/json"
    }
  end
end
