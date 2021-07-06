import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

     GMSServices.provideAPIKey("AIzaSyCDEy9U1U-vGx6VmZtlwlg_0ujs_AfZu5Q")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
