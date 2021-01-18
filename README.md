# DRIP - Back End

Drip is a web application that can help you manage your houseplants. You can schedule watering events, automatically schedule future ones when you water your plant, keep notes, and adjust watering frequency, as well as record your plant's name, species, and location.

## Installation

To run this app, fork and clone this repo and run
```bash
$ rails db:migrate
```
Currently the app is configured to be able to have users in a future version, but for now, you can create a `.env` file in the root directory and add to it
```bash
PASSWORD=<YOUR PASSWORD>
```
and then run
```bash
$ rails db:seed
```
which will seed the database with one user-you! You are also welcome to set the password in the seed file itself if you prefer. 

Devise is already configured and will be implemented in a future version. 

Once set up, run
```bash
$ rails s
```
to start the server.

## Front End

The front end repo can be found [here](https://github.com/patrick-rush/rails-js-drip-frontend). 

Fork and clone then run `open index.html` to open in your browser.

## Roadmap

Future versions of this app may include the following:

* Multi-user interface
* Different types of care events (fertilize, repot, etc.)
* Ability to group plants by room or species

## Versions

ruby - 2.6.1
rails - 6.0.3.4

## Contributing

You are welcome to submit pull requests as you see fit.

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Info

This project was created for the Javascript portion of Flatiron School's Software Engineering program. Thank you for checking it out! 