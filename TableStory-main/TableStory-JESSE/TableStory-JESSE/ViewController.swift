//
//  ViewController.swift
//  TableStory-JESSE
//
//  Created by Williams, Jesse on 3/22/23.
//

import UIKit
import MapKit


let data = [
    Item(name: "SPONSOR: Thrive Apothecary", webaddress: "https://thrivetx.com/?ref=txcannaco.com", desc: "Thrive Apothecary is a sponsor of TXCANNACO. Visit their website to see their products and schedule an appointment with a medical cannabis doctor today. Use code TXCANNACO for a discount on your next appointment. Veterans first appointments are donated by Thrive. Click the link above to for more information.", lat: 32.75750605282996, long: -97.35474826054455, imageName: "thrive-stacked-website-logo"),
    Item(name: "Despite being popular among voters, marijuana legalization is long overdue in Texas", webaddress: "https://www.vapingpost.com/2023/02/17/despite-being-popular-among-voters-marijuana-legalization-is-long-overdue-in-texas/", desc: "Republican-held Texas is slow to legalize recreational marijuana and regulate it. This is long overdue, as most people in the state support eventual legalization. Click the link above to read more.", lat: 0, long: -0, imageName: "vaping"),
    Item(name: "Legalization, medical, & hemp bills assigned to Texas Senate commitees", webaddress: "https://txcannaco.com/legalization-medical-hemp-bills-assigned-to-texas-senate-committees/", desc: "TSB 209 (Legalization), SB 264 (Hemp – Perry) and SJR 22 (Legalization) were referred to Senate committees this week. Several bills were referred to committee this week, but these three...Click the link above to read more.", lat: 0, long: 0, imageName: "billsassigned"),
    Item(name: "U.S. Senate Comittee approves bipartisan marijuana research bill focused on military veterans", webaddress: "https://www.marijuanamoment.net/u-s-senate-committee-approves-bipartisan-marijuana-research-bill-focused-on-military-veterans-with-ptsd-and-pain/?ref=txcannaco.com", desc: "A U.S. Senate committee approved a bipartisan bill on Thursday to promote marijuana research for military veterans—becoming the first piece of standalone cannabis legislation ever to advance through a committee in the chamber. Click the link above to read more.", lat: 0, long: 0, imageName: "ussenate"),
    Item(name: "Police: Vapes with high THC", webaddress: "https://www.cbs19.tv/article/news/local/vapes-with-high-thc-levels-being-found-on-kilgore-isd-campus/501-d80098b6-179d-42b5-b8bc-1d9442442684", desc: "In Texas, the possession of any amount of THC is a felony, according to criminal defense law firm Guest & Gray. Click the link above to read more.", lat: 0, long: 0, imageName: "highschool"),
    Item(name: "Man arrested in East Texas after THC edibles seized in traffic stop", webaddress: "https://www.ketk.com/news/local-news/man-arrested-in-east-texas-after-thc-edibles-seized-in-traffic-stop/", desc: "TEXARKANA, Texas (KETK) – A man was arrested in Texarkana Monday morning after police found what looked like candy but was later found to be a box of THC edibles during a traffic stop on Jarvis Parkway. Click the link above to read more.", lat: 0, long: 0, imageName: "edibles")
   
]

struct Item {
    var name: String
    var webaddress: String
    var desc: String
    var lat: Double
    var long: Double
    var imageName: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var theTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        let item = data[indexPath.row]
        cell?.textLabel?.text = item.name
        //Add image references
        let image = UIImage(named: item.imageName)
        cell?.imageView?.image = image
        cell?.imageView?.layer.cornerRadius = 10
        cell?.imageView?.layer.borderWidth = 5
        cell?.imageView?.layer.borderColor = UIColor.white.cgColor
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        performSegue(withIdentifier: "ShowDetailSegue", sender: item)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            if let selectedItem = sender as? Item, let detailViewController = segue.destination as? DetailViewController {
                // Pass the selected item to the detail view controller
                detailViewController.item = selectedItem
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        theTable.delegate = self
        theTable.dataSource = self
        // Loop through the data array and add annotations for each non-zero latitude and longitude
            for item in data {
                if item.lat != 0 && item.long != 0 {
                    let coordinate = CLLocationCoordinate2D(latitude: item.lat, longitude: item.long)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = coordinate
                    annotation.title = item.name
                    mapView.addAnnotation(annotation)
                    let centerCoordinate = CLLocationCoordinate2D(latitude: 32.0, longitude: -97.0)
                    let span = MKCoordinateSpan(latitudeDelta: 5.0, longitudeDelta: 5.0)
                    let region = MKCoordinateRegion(center: centerCoordinate, span: span)

                    mapView.region = region

                }
            }
    }
}

            
        



//array objects of our data.




