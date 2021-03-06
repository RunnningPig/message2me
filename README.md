# Message2me

Message2me is a simple command line program to send message via "Telegram-bot" or "Twilio-sms".

## Install

```bash
git clone https://github.com/RunnningPig/message2me.git
cd message2me && bash install.sh
```

## How to use?

### Using Twilio-sms

* You need have a [twilio account](https://www.twilio.com/try-twilio).

* Get following three parameters in [Twilio Getting Started](https://www.twilio.com/console/sms/getting-started/):
  
  * account_sid
  
  * auth_token
  
  * from_number

* Configurate `twilio_account_sid`, `twilio_auth_token`, `twilio_from_number` and `twilio_to_number` parameters in `message2me.conf` .

* Set the `enable_twilio` to `true` in `message2me.conf` .

### Using Telegram-bot

* You need have a [telegram account](https://telegram.org/).

* Get **your chat id** from [get-id-bot](https://telegram.me/get_id_bot).

* Create a bot and get **the bot authorization token** referring to [how-do-i-create-a-bot](https://core.telegram.org/bots#3-how-do-i-create-a-bot).

* Configurate `telegram_chat_id` and `telegram_token` in `message2me.conf`.

* Set the `enable_telegram` to `true` in `message2me.conf` .

If all is ok, you just execute `message2me <your_message>`，and the mesaage will be send to you.


