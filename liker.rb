require 'watir' 
require 'pry' 
require 'rb-readline' 
require 'awesome_print' # Console output


username = #enter username
password = $enter password
numOfLikes = 0
numOfRounds = 0
MAX_LIKES = 2000

# Login
browser = Watir::Browser.new :chrome
browser.goto "instagram.com/accounts/login/"

# Logging in
browser.text_field(:name => "username").set "#{username}"
browser.text_field(:name => "password").set "#{password}"
browser.button(:class => '_ah57t _84y62 _i46jh _rmr7s').click
sleep(5)


loop do
  5.times do |i|
    browser.driver.execute_script("window.scrollBy(0,document.body.scrollHeight)")
    sleep(3)
  end

  # Going through unliked pictures and liking them
  if browser.span(:class => "coreSpriteHeartOpen").exists?
    browser.spans(:class => "coreSpriteHeartOpen").each { |val|
      val.click
      numOfLikes += 1
    }
  ap "Photos liked: #{numOfLikes}"
  end
  numOfRounds += 1
  sleep(30) 
