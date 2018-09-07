# DownTheTu.be
## Barrel round count tracker

This application will help all firearms enthusiasts track the number of rounds that have been shot though any firearm.

The basics of the application include:

User - Fields to include Username, Email, Password
  * Create
  * Login
  * Logout

Firearm - Fields to include Name, Round Count(number of rounds fired)
  * Create
  * Show
  * Edit
  * Delete

Users have many firearms and firearms belong to a user.

Once a user has signed up and logged in they begin by adding a firearm and including the current number of rounds fired.


To start the app run `rackup config.ru` after running `rake db:migrate`
