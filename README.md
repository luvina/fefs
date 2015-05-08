### Brief of project
* Overview
	Prototype application covering full of frontend technology stack(short by fefs)
* Functions
	User view the list of vehicle.
	User Can add Vehicle.
	User can search Vehicle.
	All the data export to csv file
* Technology
	Application: CoffeeScript, Jade, Compass, Ionic Framework (this includes AngularJS, SCSS, Cordova), RequireJS
	Build: Gulp, Bower
	Linter: CoffeeLint, SCSSList
	Unit Testing: Jasmine, Karma, PhantomJS, CoffeeCoverage
	E2E Testing: Protractor, Google Chrome, Appium

### Project Structure

├── gulpfile.coffee         			- Configuration of all Gulp tasks
├── gulpfile.js             			- Define gulpfile coffee
├── package.json            			- Dev dependencies and required plugins
├── bower.json              			- Lists front-end dependencies
├── .bowerrc							- Package installation directory of bower
├── config.xml              			- Global configuration
├── .gitignore              			- Best practices for checking in apps
├── resources/              			- Scaffolded placeholder Icons and Splashscreens
│   ├── ios/
│   ├── android/
├── app/
│   ├── assets/              			- Assets
│   ├── scripts/            			- Coffee script
│   ├── views/             				- Views
├── platforms/              			- Targeted operating systems
├── plugins/                			- Native plugins
├── hooks/                  			- Lifecycle hooks
├── scss/                   			- Scss file
├── test/                   			- Tests
│   ├── e2e/
│		├── protractor/
│			├── controller/			 	- E2E testing
│			├── protractor.config.js 	- Protractor config
├── www/                    			- Copied from app/ to be used

### Environment (prepare before start)

* Install NodeJS version 0.10.33 
	Reason: When run on lastest version 0.12.2 found some error with node-sass
* Change ionicServeAddress
	Edit ionic.config file. On Mac this file is at ~/.ionic. On Windows it can be found at c:/users/username/.ionic.
	Change ionicServeAddress to localhost

### Getting started

* Install cordova, ionic and gulp: `npm install -g cordova ionic gulp`
* Install Dependencies with `npm install`
* Build your app using gulp `gulp`
* Run in Browser `ionic serve`

### Run on Android Device

* Add the platform: `ionic platform android`
* Plug your phone and run: `ionic run android`

### Run on iOS

* Add the platform: `ionic platform ios`
* Plug your phone and run: `ionic run ios`

### Testing
	
	## Unit Test (Coverage)
		Doing (for next version)
	
	## E2E Test
		## Setup Testing Enviorment
			* Use npm to install Protractor globally with: `npm install -g protractor`
			* Update your webdriver-manager with: `webdriver-manager update`
			* Now start up a server with: `webdriver-manager start`
			* This will start up a Selenium Server and will output a bunch of info logs.
		## Testing code
			* Update your latest build code with command `gulp`
			* Run your ionic server with `ionic serve`
			* Now run the test with: `protractor .\test\protractor.config.js` (TODO: run with gulp)
			* You should see a Chrome browser window open up and navigate to the todo list in the AngularJS page, then close itself (this should be very fast!).

## License

Distributed under MIT license.


## Author
This was written by [Luvina Software Company](http:///www.luvina.net).

Enjoy!