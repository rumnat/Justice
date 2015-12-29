//
//  MapViewController.swift
//  Justice
//
//  Created by Anton Muratov on 12/13/15.
//  Copyright © 2015 muratov. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: JBaseViewController, GMSMapViewDelegate {
    var count = 0
    @IBOutlet weak var mapView: GMSMapView!
    
    var offenses: [Offense]!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchOffenses()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // Установить карту в центр Харькова
        mapView.delegate = self
        let camera = GMSCameraPosition.cameraWithLatitude(49.98081, longitude:36.25272, zoom:10.5)
        
        mapView.animateToCameraPosition(camera)
    }
    
    // MARK: - GMSMapViewDelegate
    
    @objc func mapView(mapView: GMSMapView!, didTapAtCoordinate coordinate: CLLocationCoordinate2D) {
        switch count {
        case 0:
            let marker = GMSMarker(position: coordinate)
            marker.title = offenses[0].offenseType.typeName
            marker.icon = offenses[0].offenseType.typeImage
            marker.map = mapView
        case 1:
            let marker = GMSMarker(position: coordinate)
            marker.title = offenses[1].offenseType.typeName
            marker.icon = offenses[1].offenseType.typeImage
            marker.map = mapView
        case 2:
            let marker = GMSMarker(position: coordinate)
            marker.title = offenses[2].offenseType.typeName
            marker.icon = offenses[2].offenseType.typeImage
            marker.map = mapView
        case 3:
            let marker = GMSMarker(position: coordinate)
            marker.title = offenses[3].offenseType.typeName
            marker.icon = offenses[3].offenseType.typeImage
            marker.map = mapView
        case 4:
            let marker = GMSMarker(position: coordinate)
            marker.title = offenses[4].offenseType.typeName
            marker.icon = offenses[4].offenseType.typeImage
            marker.map = mapView
        default:
            break
        }
        count++
    }
    
    // MARK: - Requests
    
    private func fetchOffenses() -> Void {
        // Получаем правонарушения от сервера
        APIClient.fetchOffenses({ (response) -> Void in
            if let responseOffenses = response as? [Offense] {
                self.offenses = responseOffenses
                //self.establishMarkers()
            }
            }) { () -> Void in
                
        }
    }
    
    // MARK: -  Private
    
    private func establishMarkers() -> Void {
        // Расставляем маркеры на карте
        for offense in offenses {
            let marker = GMSMarker()
            marker.title = offense.offenseType.typeName
            marker.icon = offense.offenseType.typeImage
            marker.map = mapView
        }
    }
}
