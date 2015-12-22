# calculator_lang.rb
##
require 'yaml'

## is MESSAGES considered a constant (all cap) or a hash ?
MESSAGES = YAML.load_file('calculator_messages_lang.yml')
#puts MESSAGES.inspect

LANGUAGE = 'en'
def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_integer?(num)
  (num.to_f.to_s == num) || (num.to_i.to_s == num)
end

def messages(message, lang='es')
  MESSAGES[lang][message]
end

prompt(messages('welcome',LANGUAGE))


prompt(MESSAGES['es']['valid_name'])
prompt(MESSAGES['en']['valid_name'])



# prompt("Calculator exiting...")
