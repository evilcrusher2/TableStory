//
//  DetailViewController.swift
//  TableStory-JESSE
//
//  Created by Williams, Jesse on 3/29/23.
//

import UIKit
import MapKit
class DetailViewController: UIViewController {
    var item: Item?
    
    @IBOutlet weak var detailName: UILabel!
    
    @IBOutlet weak var detailDesc: UILabel!
    
    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailWebaddress: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailName?.text = item?.name
        textView?.text = item?.webaddress
        textView.isEditable = false
        textView.dataDetectorTypes = .link
        textView.textContainer.maximumNumberOfLines = 1
        detailDesc?.text = item?.desc
        detailImage?.image = UIImage(named: item?.imageName ?? "")
        // code for map
        let latitude = item?.lat ?? 0.0
        let longitude = item?.long ?? 0.0
        
        if latitude == 0.0 && longitude == 0.0 {
            mapView.isHidden = true
            
        } else {
            //mapView.isHidden = false
            let coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            let annotation = MKPointAnnotation()
            
            // Set the region of the map view
            mapView.setRegion(region, animated: false)
            
            // Create a map annotation for your location
            annotation.coordinate = coordinate
            annotation.title = item?.name
            
            // Add the annotation to the map view
            mapView.addAnnotation(annotation)
        }
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    
    */


