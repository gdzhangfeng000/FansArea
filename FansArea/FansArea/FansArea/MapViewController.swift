//
//  MapViewController.swift
//  FansArea
//
//  Created by 123 on 2017/6/7.
//  Copyright © 2017年 Zhang Feng. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, MKMapViewDelegate {
    
    var area: Area!

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //设置地图显示比例尺、指南针、交通、用户位置、大厦
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsTraffic = true
        mapView.showsUserLocation = true
        mapView.showsBuildings = true

        //使用guard绑定
        let coder = CLGeocoder()
        coder.geocodeAddressString(area.name) { (ps, error) in
            guard let ps = ps else {
                print(error ?? "未知错误")// 如果错误没有值，就打印这个“未知错误”
                return
            }
            
            let place = ps.first
            let annotation = MKPointAnnotation()
            annotation.title = self.area.name
            annotation.subtitle = self.area.province
            
            if let loc = place?.location{
                annotation.coordinate = loc.coordinate
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
            }
        }
        
    }
    
    //设置地图显示图片，图钉颜色
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //当前位置
        if annotation is MKUserLocation{
            return nil
        }
        
        let id = "myid"
        var av = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView
        
        if av == nil{
            av = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            av?.canShowCallout = true
        }
        
        let leftIconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 53, height: 53))
        leftIconView.image = UIImage(named: area.image)
        av?.leftCalloutAccessoryView = leftIconView
        av?.pinTintColor = UIColor.blue
        
        return av
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
