import UIKit

class DetailCityViewController: UIViewController{
    
    var city: City!
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationItem.title = "Detail"
        setupLayout()
    }
    
    func setupLayout(){
        let countryValue = label(flag[city.icon] ?? city.icont)
        let cityName = label(city.name)
        let cityTemp = label(String.init(format: "%0.2f", city.temp))
        let citySummary = label(city.summary)
        
        let stack = UIStackView.init(arrangedSubviews: [labelCountry, countryValue,
                                                        labelCity, cityName,
                                                        labelTemperature, cityTemp,
                                                        labelSummary, citySummary,])
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalSpacing
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),
        ])
    }

    
    let labelCountry = labelTitle("Country")
    let labelCity = labelTitle("City")
    let labelTemperature = labelTitle("Temperature")
    let labelSummary = labelTitle("Summary")
    
    let flag = ["canada": "🇨🇦",
        "italy": "🇮🇹",
        "brazil": "🇧🇷",
        "skorea": "🇰🇷",
        "japan": "🇯🇵",
    ]
}

func labelTitle(_ text:String) -> UILabel {
    let title:UILabel = label(text)
    title.font = .boldSystemFont(ofSize: 16)
    return title
}

func label(_ text:String) -> UILabel {
    let label = UILabel.init()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = text
    return label
}
