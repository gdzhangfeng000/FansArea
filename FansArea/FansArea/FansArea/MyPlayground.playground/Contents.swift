//: Playground - noun: a place where people can play

import UIKit
import MapKit

let coder = CLGeocoder()
var placemark : CLPlacemark?

coder.geocodeAddressString("") { (placemarks, error) in
    if error != nil {
        
        print(error ?? "错误")
    }
    
    if let ps = placemarks{
        placemark = ps.first
    }
}

placemark?.location?.coordinate