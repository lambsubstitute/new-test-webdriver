# new-test-webdriver

To be able to run these tests in chrome you must have the chrome driver downloaded and the location added to your path, the download can be found here https://sites.google.com/a/chromium.org/chromedriver/downloads

To run these tests you must first have Ruby 2.2.2 installed. 
To check if you do, open up a command line /terminal and run ```ruby -v```

Once confirmed, open the terminal in the root of project folder and run ```bundle install``` to make sure you have the required dependencies.

Once confirmed you can run all the tests by typing ```cucumber```, which will start the test running in chrome. 


Test suite code hierarchy
```
---->>> Cucucmber feature file: holds the scenarios and steps, these call the step definitions
  |
  |
---->>> Step definitions: we conduct assertions and expectations at this level by calling the helpers
  |
  |
---->>> Helpers: using page objects user flows can be built, conditional logic about flows can also be added here. most of the complicated work will be done at this level. if the logical flow of functionality is to be changed it can be handled here
  |
  |
---->> Page objects: UI Interactions level, here we have the pure interactions that keep element identifiers for specific pages or page areas, which cuts down code reuse and improves maintainability
```
