//
//  ViewController.swift
//  TableStory-JESSE
//
//  Created by Williams, Jesse on 3/22/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
//array objects of our data.
let data = [
    Item(name: "Pepe's Tacos", neighborhood: "Downtown", desc: "This food truck offers delicious birria tacos served with a warm consomme.", lat: 30.273320, long: -97.753550, imageName: "rest1"),
    Item(name: "Biscuits + Groovy", neighborhood: "Hyde Park", desc: "Groovy little neighborhood truck serving up biscuits in a variety of styles.", lat: 30.313960, long: -97.719760, imageName: "rest2"),
    Item(name: "Veracruz All Natural", neighborhood: "Mueller", desc: "This is one of many locations for the beloved taco mavens of Austin.", lat: 30.2962244, long: -97.7079799, imageName: "rest3"),
    Item(name: "Vaquero Taquero", neighborhood: "UT", desc: "Delicious tacos with a convenient walk up window. ", lat: 30.295190, long: -97.736540, imageName: "rest4"),
    Item(name: "Uncle Nicky's", neighborhood: "Hyde Park", desc: "Serving up Italian specialties and drinks.", lat: 30.304890, long: -97.726220, imageName: "rest5")
   
]

struct Item {
    var name: String
    var neighborhood: String
    var desc: String
    var lat: Double
    var long: Double
    var imageName: String
}




