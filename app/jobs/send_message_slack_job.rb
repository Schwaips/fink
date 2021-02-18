class SendMessageSlackJob < ApplicationJob
  queue_as :default

  def perform(message, user, channel)
   RestClient.post 'https://slack.com/api/chat.postMessage', {
      channel: channel,
      as_user: true,
      text: message
    },
    {
      Authorization:"Bearer xoxb-1715641287046-1725737469462-qWuanyW4s9PG1LGccQQ2KXRj",
      "X-Slack-User": user,
      "Content-type": "application/json"
    }
  end
end
