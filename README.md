MigrationViewController
=======================

This library is a thing of the order to ensure a smooth migration of CoreData.


## Installation

### CocoaPods

``` ruby
pod 'MigrationViewController'
```

## How to use

Migration takes place if as follows . This library is considered to limit start-up of iOS. It does not end with one start-up time limit due to migration (maybe) .
What display will not be due to migration in this library . By inheriting the MigrationViewController, you should be an indication that is some migration when it is actually used .

``` objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MigrationViewController setUpWithWindow:self.window];
    
    return YES;
}
```

## NOTE

This library uses the MagicalRecord. If you do not want to install the MagicalRecord , please as follows .

* Install only the Core

	``` ruby
	pod 'MigrationViewController/Core'
	```

* Create a ViewController that inherits MigrationBaseViewController
* Describe the setup of the database code to override the setup

## License

MIT
