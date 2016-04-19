def check_session session, check_flag
  puts "checking #{check_flag} => #{session[check_flag].inspect}"
  return !session[check_flag].nil?
end

def out str
  str = str.force_encoding 'UTF-8'
end