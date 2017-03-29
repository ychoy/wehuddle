# WeHuddle

WeHuddle is a Ruby-On-Rails, ActionCable touting, real-time chat application targeted at agile development teams.  This project presented many interesting challenges, including getting ActionCable, a new Rails v5 feature, to implement websockets and render chat windows in real time.  Fun stuff!

## Getting Started

Clone down!

...or visit the live [demo](http://wehuddle.herokuapp.com)


### Prerequisites

You need Ruby (which comes default with Mac)!

You also need to install imagemagick (v. < 7.0)
```
$ brew install imagemagick
```

### Installing

Once you've cloned down the repo and installed imagemagick, in terminal...

1. Have bundler install gems/dependencies
```
$ bundle install
```

2. Create a SQL database
```
$ rails db:create
```

3. Migrate database up
```
$ rails db:migrate
```

4. Run your rails server!
```
$ rails s
```
Navigate to localhost:3000 in your browswer to begin!

## RSpec on Rails

While in terminal, 'cd' into the root directory and run
```
$ rspec
```

## Deployment

Currently deployed to Heroku @ [wehuddle.herokuapp.com](https://wehuddle.herokuapp.com)

## Built With

* [RubyOnRails](https://github.com/rails/rails) - Our framework
* [Bundler](https://github.com/bundler/bundler) - Dependency management
* [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) - Used to upload user avatars
* [Devise](https://github.com/plataformatec/devise) - Handles authentication
* [Rspec Rails](https://github.com/rspec/rspec-rails) - Handles testing

## Versioning

We use [GitHub](https://github.com/) for versioning. For our commit history, see the [repo](https://github.com/ychoy/wehuddle). 

## User Stories

Our 'planning' GoogleDoc is available [here](https://docs.google.com/document/d/1H9TaAHtwaFhci8TRtxyobqQasZRNvRooNZvqzIM3a8A/edit#heading=h.m39x7l3uudcg).

**Homepage: in the center of the page, user can select either the create an account or login button to start using We Huddle**

* If the user selects "Sign Up", user creates an account 
* User is prompted to enter information: first name, last name, username, email and password
* User submits the information to sign up
* User is directed to Edit Profile page 
* User sees profile page with basic information filled out (first name, last name, email). On the bottom of the edit profile there is a small link to change the password and to delete the user profile
* User proceeds to edit their profile 

**User can type in to edit the following fields:**

* First name
* Last name
* Username
* Email
* Profile Image
* Biography
* Phone Number 

* After user submits the information, user is redirected to the Profile page, with changes saved.

**If user selects Change Password**

* User goes to an edit form with change password
* User can save new password
* User gets redirected to the user Profile page

**If user selects Delete Profile**

* User gets a prompt - Are you sure?
* If user confirms Delete, user gets redirected to the homepage and a notification pops up "Thank you for using We Huddle" 
* User can select chat icon in the navbar to redirect to the chat page index
* User selects login 
* User logins with username or email, and password 
* User is redirected to the chat page index and can see two columns:

* Left column: List of chatrooms. left-bottom: Create new chatroom button
* Right column: empty if no chatroom selected. If chatroom selected, recent messages

**User can see the chat icon and profile icon in the navbar (top right).**

* Chat icon refreshes the chat page index 
* Profile icon redirects user to the Profile page 
* User can select a chatroom
* Right column will render most recent messages to the view. User can also see a people icon with a number count representing number of users active in the chatroom
* User can see a form on the bottom to type and send a message to the chatroom
* If the user sends a message 
* The user will see the message in the chat window in real-time
* Other users will see the message in real-time if they are view the chat window
* If user selects the people icon in the right column, they can see the list of active users - profile image thumbnails and names. 
* User can sign out
* User is redirected to homepage 

## Wishlist and Future Development

* First things first, we need to get thumbnails to show up dynamically while chatting.  The problem seems to lie in the asset pipeline and how it fingerprints the path, we just haven't quite worked it out.

* More stuff!

## Authors

* **Yan Yin Choy** - *Developer* - [GitHub](https://github.com/ychoy)
* **Thelma Boamah** - *Developer* - [GitHub](https://github.com/thelmaboamah)
* **Will Kaspar** - *Developer* - [GitHub](https://github.com/wakaspar)
* **Luke Swanson** - *UX/UI Designer* - [LinkedIn](https://www.linkedin.com/in/lukekswanson/)

See also the list of [contributors](https://github.com/ychoy/wehuddle/contributors) who participated in this project.

## License

Why does MIT license all our software, anyway?

## Acknowledgments

* Communication is hard
* Nathan and Michelle are great
* We all miss Sherri

* Logan's buying!
