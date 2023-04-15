extends Gift

func _ready() -> void:
	# I use a file in the working directory to store auth data
	# so that I don't accidentally push it to the repository.
	# Replace this or create a auth file with 3 lines in your
	# project directory:
	# <bot username>
	# <oauth token>
	# <initial channel>
	var authfile := File.new()
	authfile.open("./auth", File.READ)
	var botname := authfile.get_line()
	var token := authfile.get_line()
	var initial_channel = authfile.get_line()

	connect_to_twitch()
	yield(self, "twitch_connected")

	# Login using your username and an oauth token.
	# You will have to either get a oauth token yourself or use
	# https://twitchapps.com/tokengen/
	# to generate a token with custom scopes.
	authenticate_oauth(botname, token)
	if(yield(self, "login_attempt") == false):
	  print("Invalid username or token.")
	  return
	join_channel(initial_channel)
	connect("chat_message", get_parent(), "chat_message")
	
	#add_command("accel", get_parent(),"accel")
	add_command("c1", get_parent(),"c1")
	add_command("c2", get_parent(),"c2")
	add_command("c3", get_parent(),"c3")
	add_command("c4", get_parent(),"c4")
	add_command("c5", get_parent(),"c5")
	add_command("thc", get_parent(),"thc")
	add_command("jump", get_parent(),"jump")
	add_command("ap", get_parent(),"ap")
	add_command("train", get_parent(),"train")
	#add_command("truite", get_parent(),"truite")
	#add_command("wheelie", get_parent(),"wheelie")
