User.destroy_all
Chatroom.destroy_all

chatrooms = [
	{title: "DevOps", description:"Developer Operations"},
	{title: "Product Engineer", description:"Product Engineering to the max!"},
	{title: "Design", description:"I talk to the users and wireframe stuff"},
	{title: "Testing", description:"...We break stuff"},
	{title: "FunnyBiz", description:"How punny can you get!?"}
]

users = [
	{
		first_name: "Will",
		last_name: "Kaspar",
		username: "catchat23" ,
		email: "w@k.com",
		password: "123456",
		biography: "I'm a cat."
	},
	{
		first_name: "Yan Yin",
		last_name: "Choy",
		username: "starcat",
		email: "y@c.com",
		password: "123456",
		biography: "I'm a star-cat unicorn."
	},
	{
		first_name: "Thelma",
		last_name: "Boamah",
		username: "thelma",
		email: "t@b.com",
		password: "123456",
		biography: "I'm more of a goldfish."
	},
	{
		first_name: "Kody",
		last_name: "Lawton",
		username: "kodycodes",
		email: "k@l.com",
		password: "123456",
		biography: "I'm a kitten."
	},
	{
		first_name: "Christen",
		last_name: "Williams",
		username: "chris10",
		email: "c@w.com",
		password: "123456",
		biography: "I'm a puppy."
	}
]

User.create(users)
Chatroom.create(chatrooms)
