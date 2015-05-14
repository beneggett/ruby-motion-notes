class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UIViewController.alloc.init
    rootViewController.title = 'HelloMotion'
    rootViewController.view.backgroundColor = UIColor.whiteColor

    navigationController = UINavigationController.alloc.initWithRootViewController(rootViewController)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = navigationController
    @window.makeKeyAndVisible

    alert = UIAlertView.alloc.initWithTitle("Hello",
      message:"Hello there cody",
      delegate:nil,
      cancelButtonTitle:'Close',
      otherButtonTitles:nil
    )
    alert.show
    puts "Hello from the console"

    true
  end
end
