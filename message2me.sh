#!/usr/bin/env bash
#
# send message via "Telegram-bot" or "Twilio-sms"

usage() { echo "Usage: message2me <your_message>" >&2; exit 1; }

read_configuration() {
  . "${XDG_CONFIG_HOME:-${HOME}/.config}/message2me/message2me.conf" || exit 1
}

send_message_with_twilio() {
  local message="$@"

  # Send a text message
  curl -fSs -X POST \
    -u "${twilio_account_sid}:${twilio_auth_token}" \
    --data-urlencode "To=${twilio_to_number}" \
    --data-urlencode "From=${twilio_from_number}" \
    --data-urlencode "Body=${message}" \
    "https://api.twilio.com/2010-04-01/Accounts/${twilio_account_sid}/Messages.json" > /dev/null
}

send_message_with_telegram() {
  local message="$@"

  # Send a text message
  curl -fSs -X POST \
    --data-urlencode "chat_id=${telegram_chat_id}" \
    --data-urlencode "text=${message}" \
    "https://api.telegram.org/bot${telegram_token}/sendMessage" > /dev/null
}

[[ -z "$1" ]] && usage

read_configuration

message="$(echo -e "$@")"

if [[ "${enable_twilio}" = 'true' ]]; then
  send_message_with_twilio "${message}" && echo "twilio-sms: send successfully!"
fi

if [[ "${enable_telegram}" = 'true' ]]; then
  send_message_with_telegram "${message}" && echo "telegram-bot: send successfully!"
fi
