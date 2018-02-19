require 'cleverbot'
require_relative 'configapi.rb'

$input
$starting = ""
$name = "Yukiha"

$config = ConfigAPI::Config.new("config.yml")

$bot = Cleverbot.new($config.pull("username"), $config.pull("token"))

def construct(string, starting)
  $starting = starting
  return string
end

def contains?(string, array)
  if array.class == Array
    array.each do |loop|
      if(!(string.include? loop))
        return false
      end
    end
  elsif array.class == String
    return string.include? array
  end

  return true
end

$map = {}
$map[['how', 'old', 'you']] = construct("I was developed in early 2018. Do the math 0_^", "")
$map[['what', 'is', 'name']] = construct("My name is #{$name}", "")
$map[['what', 'is', 'weather']] = construct("I don't know. I'm locked in a basement.....", "")
$map[['how', 'are', 'you']] = construct("Doing fantastic. I just happen to be talking to you right now ;)", "")
$map[['what', 'are', 'you', 'doing']] = construct("Chatting with people on the internet", "")
$map[['are', 'you', 'gay']] = construct("No", "")

$map[['why', 'not']] = construct("¯\_(ツ)_/¯", "")
$map[['cool']] = construct("Yeah!", "")
$map[['hi']] = construct("Hi there!", "")
$map[['hey']] = construct("Hey!", "")
$map[['hello']] = construct("Hello.", "")
$map[['sup']] = construct("What's up bro?", "I am doing ")
$map[["what's", "up"]] = construct("What's up bro?", "I am doing ")

$map[["what", "is", "up"]] = construct("What's up bro?", "I am doing ")
$map[['I', 'doing', 'great']] = construct("Good to hear!", "")
$map[['what', 'do', 'you']] = construct("Type on my keyboard, *constantly*.", "")
$map[['who', 'are', 'you']] = construct("I am #{$name}.", "")

$map[['what', 'gender']] = construct("I am female.", "")
$map[['you', 'male']] = construct("No.", "")
$map[['you', 'female']] = construct("Yes.", "")
$map[['you', 'girl']] = construct("Yes.", "")
$map[['you', 'woman']] = construct("Yes.", "")
$map[['you', 'lady']] = construct("Yes.", "")
$map[['you', 'feminine']] = construct("Yes.", "")

$map[['you', 'men']] = construct("No.", "")
$map[['you', 'boy']] = construct("No.", "")
$map[['you', 'man']] = construct("No.", "")
$map[['you', 'masculine']] = construct("No.", "")

# You can use the include? method:

def start
  bool = false
  $map.each do |key, val|
    if contains? $starting + $input, key
      puts val
      bool = true
      break
    end
  end

  if !bool
    puts $bot.say($input)
  end
end

while true
  $input = gets().to_s
  start
end
