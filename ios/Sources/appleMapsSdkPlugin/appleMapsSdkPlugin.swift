import Foundation
import Capacitor
import MapKit
import CoreLocation

@objc(appleMapsSdkPlugin)
public class appleMapsSdkPlugin: CAPPlugin, CAPBridgedPlugin, CLLocationManagerDelegate {
    var mapView: MKMapView?
    var locationManager: CLLocationManager?
    
    public let identifier = "appleMapsSdkPlugin"
    public let jsName = "appleMapsSdk"
    public let pluginMethods: [CAPPluginMethod] = [
        CAPPluginMethod(name: "echo", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "initAppleMaps", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "showAppleMaps", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "hideAppleMaps", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setValuesAppleMaps", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "setCenterPoint", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "closeAppleMaps", returnType: CAPPluginReturnPromise),
        CAPPluginMethod(name: "isAppleMapsVisible", returnType: CAPPluginReturnPromise)
    ]

    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve(["value": value])
    }

    @objc func initAppleMaps(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            // If already initialized return sucess
            if self.mapView != nil {
                call.resolve(["status": "success"])
                return
            }
            
            // Location Manager Setup
            self.locationManager = CLLocationManager()
            self.locationManager?.delegate = self
            self.locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager?.requestWhenInUseAuthorization()
            
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager?.startUpdatingLocation()
                call.resolve(["status": "success"])
            } else {
                call.reject("Location services are not enabled")
            }
        }
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        guard self.mapView == nil else {
            manager.stopUpdatingLocation()
            return
        }
        
        let coordinates = CLLocationCoordinate2D(
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude
        )
        let region = MKCoordinateRegion(
            center: coordinates,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
        
        let screenWidth = UIScreen.main.bounds.width
        let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 500))
        self.mapView = mapView
        
        mapView.setRegion(region, animated: false)
        mapView.showsUserLocation = true
        mapView.isHidden = true  // Initial versteckt
        
        if let viewController = bridge?.viewController {
            viewController.view.addSubview(mapView)
        }
        
        manager.stopUpdatingLocation()
    }

    @objc func showAppleMaps(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if self.mapView == nil {
                call.reject("Map is not initialized. Please call initAppleMaps first.")
                return
            }
            
            self.mapView?.isHidden = false
            call.resolve(["status": "success"])
        }
    }

    @objc func hideAppleMaps(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if self.mapView == nil {
                call.reject("Map is not initialized. Please call initAppleMaps first.")
                return
            }
            
            self.mapView?.isHidden = true
            call.resolve(["status": "success"])
        }
    }

    @objc func closeAppleMaps(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            // Location Manager clean up
            self.locationManager?.stopUpdatingLocation()
            self.locationManager?.delegate = nil
            self.locationManager = nil
            
            self.mapView?.removeFromSuperview()
            self.mapView = nil
            
            call.resolve(["status": "success"])
        }
    }

    @objc func isAppleMapsVisible(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            if self.mapView == nil {
                call.resolve(["status": 0])  // not initialized
            } else if self.mapView?.isHidden ?? true {
                call.resolve(["status": 1])  // not visible
            } else {
                call.resolve(["status": 2])  // visible
            }
        }
    }

    @objc func setValuesAppleMaps(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            guard let dataPoints = call.getArray("dataPoints") as? [[String: Any]] else {
                call.reject("DataPoints are required")
                return
            }

            if self.mapView == nil {
                call.reject("Map is not initialized. Please call initAppleMaps first.")
                return
            }

            self.mapView?.removeAnnotations(self.mapView?.annotations ?? [])

            for point in dataPoints {
                if let lat = point["latitude"] as? Double,
                   let lon = point["longitude"] as? Double,
                   let label = point["label"] as? String {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                    annotation.title = label
                    self.mapView?.addAnnotation(annotation)
                }
            }

            call.resolve(["status": "success"])
        }
    }

    @objc func setCenterPoint(_ call: CAPPluginCall) {
        DispatchQueue.main.async {
            guard let latitude = call.getDouble("latitude"),
                  let longitude = call.getDouble("longitude") else {
                call.reject("Latitude and Longitude are required")
                return
            }

            if self.mapView == nil {
                call.reject("Map is not initialized. Please call initAppleMaps first.")
                return
            }

            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(
                center: coordinates,
                span: self.mapView!.region.span
            )
            self.mapView?.setRegion(region, animated: true)

            call.resolve(["status": "success"])
        }
    }
}
