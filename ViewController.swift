

import UIKit
import CoreData

class ViewController: UIViewController {
    
    private let weatherFetcher = WeatherFetcher.getInstance()
    private var weatherObj = Weather()
    var citySelected = ""

    @IBOutlet var city: UIPickerView!
    @IBOutlet var lblCity: UILabel!
    
    @IBOutlet var lblUVIndex: UILabel!
    @IBOutlet var lblDirection: UILabel!
    @IBOutlet var lblWind: UILabel!
    @IBOutlet var lblFeels: UILabel!
    @IBOutlet var lblEmoji: UILabel!
    @IBOutlet var lblTemp: UILabel!
    
    
    
    @IBOutlet var lbl1: UILabel!
    
    @IBOutlet var lbl2: UILabel!
    
    @IBOutlet var lbl3: UILabel!
    
    @IBOutlet var lbl4: UILabel!
    
    @IBOutlet var lbl5: UILabel!
    
    
    @IBAction func submit(_ sender: Any) {
    


self.lbl1.isHidden = false
self.lbl2.isHidden = false
self.lbl3.isHidden = false
self.lbl4.isHidden = false
self.lbl5.isHidden = false

self.lblCity.isHidden = false
self.lblCity.text = citySelected
self.lblTemp.isHidden = false
self.lblTemp.text = String(weatherFetcher.weatherItem.currentTempurature) + "ºC"
self.lblFeels.isHidden = false
self.lblFeels.text = String(weatherFetcher.weatherItem.currentFeelsLike) + "ºC"
self.lblWind.isHidden = false
self.lblWind.text = String(weatherFetcher.weatherItem.currentWind) + "kp/h"
self.lblDirection.isHidden = false
self.lblDirection.text = weatherFetcher.weatherItem.currentDirection
self.lblUVIndex.isHidden = false
self.lblUVIndex.text = String(weatherFetcher.weatherItem.currentUVIndex)

self.lblEmoji.isHidden = false
if weatherFetcher.weatherItem.currentDay == 0 {
    self.lblEmoji.text = "🌙"
} else {
    self.lblEmoji.text = "☀️"
}
}

let cities = [
    "Toronto",
    "New_York",
    "Tokyo",
    "Seoul",
    "London",
    "Paris",
    "Dallas",
    "Delhi",
    "Bangalore",
    "Chennai",
    "Mysore",
    "Tirupati",
    "Hosur"
    
]

override func viewDidLoad() {
super.viewDidLoad()
    
    

self.city.dataSource = self
self.city.delegate = self

self.lblCity.isHidden = true
self.lblTemp.isHidden = true
self.lblFeels.isHidden = true
self.lblWind.isHidden = true
self.lblDirection.isHidden = true
self.lblUVIndex.isHidden = true
self.lblEmoji.isHidden = true

self.lbl1.isHidden = true
self.lbl2.isHidden = true
self.lbl3.isHidden = true
self.lbl4.isHidden = true
self.lbl5.isHidden = true
    
    
}

    @IBAction func Logout(_ sender: Any) {
      navigationController?.popViewController(animated: true)
        
    }
}

extension ViewController : UIPickerViewDelegate, UIPickerViewDataSource {
func numberOfComponents(in pickerView: UIPickerView) -> Int {
return 1
}

func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
return self.cities.count
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
return self.cities[row]
}
    
    

func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
self.citySelected = self.cities[row] as String
self.weatherFetcher.fetchDataFromAPI(city: self.cities[row])
    CoreDataManager.shared.saveContext()
    CoreDataManager.shared.retrieveData()

}
}
