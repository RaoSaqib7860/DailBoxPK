import UIKit
import Flutter
import GoogleMaps
import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    GMSServices.provideAPIKey("AIzaSyAbTaqS99X-gMbJNWDjDfn76P36Sy5YNe8")
    GeneratedPluginRegistrant.register(with: self)
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
    }
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    override func applicationDidBecomeActive(_ application: UIApplication) {
           signal(SIGPIPE, SIG_IGN);
       }
    override func applicationWillEnterForeground(_ application: UIApplication) {
           signal(SIGPIPE, SIG_IGN);
       }
}


