import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var prefectureLabel: UILabel!
    
    @IBOutlet weak var tommorrowWeatherImageView: UIImageView!
    @IBOutlet weak var tomorrowWeatherLabel: UILabel!
    
    @IBOutlet weak var dayAfterTomorrowWeatherImageView: UIImageView!
    @IBOutlet weak var dayAfterTomorrowWeatherLabel: UILabel!
    
    let sunnyImage = UIImage(named: "sunny")
    let cloudyImage = UIImage(named: "cloudy")
    let rainyImage = UIImage(named: "rainy")
    let cloudAndRainyImage = UIImage(named: "cloudyAndRainy")
    let sunAndRainImage = UIImage(named: "sunAndRain")
    let sunAndCloudImage = UIImage(named: "sunAndCloud")
    
    var prefectures = Prefecture()
    var prefectureName: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = view.backgroundColor
        
        getJSONData()
    }
    
    func getJSONData() {
        guard let prefectureId = prefectures.prefectures[prefectureName] else { return }
        
        let url = URL(string: "http://weather.livedoor.com/forecast/webservice/json/v1?city=\(prefectureId)")!
        let task: URLSessionTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, res, err) in
            if let data = data {
                do {
                    let json = try JSON(data: data)
                    
                    DispatchQueue.main.async {
                        if let prefectureText = json["location"]["prefecture"].string {
                            self.prefectureLabel.text = prefectureText
                        }
                        if let weathertText = json["forecasts"][0]["telop"].string {
                            self.cloudLabel.text = weathertText
                            self.getTodayWeatherImage(weatherCondition: weathertText)
                        }
                        if let tomorrowWeatherText = json["forecasts"][1]["telop"].string {
                            self.tomorrowWeatherLabel.text = tomorrowWeatherText
                            self.getTomorrowWeatherImage(weatherCondition: tomorrowWeatherText)
                        }
                        if let dayAfterTomorrowWeatherText = json["forecasts"][2]["telop"].string {
                            self.dayAfterTomorrowWeatherLabel.text = dayAfterTomorrowWeatherText
                            self.getDayAfterTomorrowWeatherImage(weatherCondition: dayAfterTomorrowWeatherText)
                        }
                    }
                    
                } catch(let err) {
                    print(err)
                }
            }
        })
        task.resume()
    }
    
    func getTodayWeatherImage(weatherCondition: String) {
        if  weatherCondition == "雨" {
            DispatchQueue.main.async {
                self.imageView.image = self.rainyImage
            }
        } else if weatherCondition == "晴れ" {
            DispatchQueue.main.async {
                self.imageView.image = self.sunnyImage
            }
        } else if weatherCondition == "曇り" {
            DispatchQueue.main.async {
                self.imageView.image = self.cloudyImage
            }
        } else if weatherCondition == "雨時々曇" || weatherCondition == "曇時々雨" || weatherCondition == "曇のち雨" || weatherCondition == "晴のち雨" {
            DispatchQueue.main.async {
                self.imageView.image = self.cloudAndRainyImage
            }
        } else if weatherCondition == "晴のち雨" || weatherCondition == "雨のち晴" || weatherCondition == "晴時々雨" || weatherCondition == "雨時々晴" {
            DispatchQueue.main.async {
                self.imageView.image = self.sunAndRainImage
            }//change
        } else if weatherCondition == "晴のち曇" || weatherCondition == "曇のち晴" || weatherCondition == "曇時々晴" || weatherCondition == "晴時々曇" {
            DispatchQueue.main.async {
                self.imageView.image = self.sunAndCloudImage
            }
        }
    }
    
    func getTomorrowWeatherImage(weatherCondition: String) {
        if  weatherCondition == "雨" {
            DispatchQueue.main.async {
                self.tommorrowWeatherImageView.image = self.rainyImage
            }
        } else if weatherCondition == "晴れ" {
            DispatchQueue.main.async {
                self.tommorrowWeatherImageView.image = self.sunnyImage
            }
        } else if weatherCondition == "曇り" {
            DispatchQueue.main.async {
                self.tommorrowWeatherImageView.image = self.cloudyImage
            }
        } else if weatherCondition == "雨時々曇" || weatherCondition == "曇時々雨" || weatherCondition == "曇のち雨" || weatherCondition == "晴のち雨" {
            DispatchQueue.main.async {
                self.tommorrowWeatherImageView.image = self.cloudAndRainyImage
            }
        } else if weatherCondition == "晴のち雨" || weatherCondition == "雨のち晴" || weatherCondition == "晴時々雨" || weatherCondition == "雨時々晴" {
            DispatchQueue.main.async {
                self.tommorrowWeatherImageView.image = self.sunAndRainImage
            }//change
        } else if weatherCondition == "晴のち曇" || weatherCondition == "曇のち晴" || weatherCondition == "曇時々晴" || weatherCondition == "晴時々曇" {
            DispatchQueue.main.async {
                self.tommorrowWeatherImageView.image = self.sunAndCloudImage
            }
        }
    }
    
    func getDayAfterTomorrowWeatherImage(weatherCondition: String) {
        if  weatherCondition == "雨" {
            DispatchQueue.main.async {
                self.dayAfterTomorrowWeatherImageView.image = self.rainyImage
            }
        } else if weatherCondition == "晴れ" {
            DispatchQueue.main.async {
                self.dayAfterTomorrowWeatherImageView.image = self.sunnyImage
            }
        } else if weatherCondition == "曇り" {
            DispatchQueue.main.async {
                self.dayAfterTomorrowWeatherImageView.image = self.cloudyImage
            }
        } else if weatherCondition == "雨時々曇" || weatherCondition == "曇時々雨" || weatherCondition == "曇のち雨" || weatherCondition == "晴のち雨" {
            DispatchQueue.main.async {
                self.dayAfterTomorrowWeatherImageView.image = self.cloudAndRainyImage
            }
        } else if weatherCondition == "晴のち雨" || weatherCondition == "雨のち晴" || weatherCondition == "晴時々雨" || weatherCondition == "雨時々晴" {
            DispatchQueue.main.async {
                self.dayAfterTomorrowWeatherImageView.image = self.sunAndRainImage
            }//change
        } else if weatherCondition == "晴のち曇" || weatherCondition == "曇のち晴" || weatherCondition == "曇時々晴" || weatherCondition == "晴時々曇" {
            DispatchQueue.main.async {
                self.dayAfterTomorrowWeatherImageView.image = self.sunAndCloudImage
            }
        }
    }
}
