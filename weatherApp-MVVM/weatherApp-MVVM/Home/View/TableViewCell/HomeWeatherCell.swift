//
//  WeatherHomeCell.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import UIKit

final class HomeWeatherCell: UITableViewCell {
    
    private lazy var lblTemp: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var bgViewColor: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 16
        view.backgroundColor = UIColor(named: "Home-Header")!
        return view
    }()
    
    private lazy var lblCity: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var imgWeather: UIImageView = {
       var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configConstraints()
        addAditionalConfigs()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(_ obj: WeatherObjc?){
        guard let city = obj else { return }
        lblCity.text = city.name
        if let temperature = city.main.temp {
            lblTemp.text = String(describing: temperature)
        }
        imgWeather.image = filterIconType(city.weather.first?.icon ?? "")
    }
    
    private func filterIconType(_ icon: String)-> UIImage{
        switch icon {
        case "11d":
            return UIImage(named: "chuva forte")!
        case "10d":
            return UIImage(named: "chuva")!
        case "13d":
            return UIImage(named: "neve")!
        case "50d":
            return UIImage(named: "nevoeiro")!
        case "02d", "02n", "03d", "03n", "04d", "04n":
            return UIImage(named: "nublado")!
        default:
            return UIImage(named: "Sol")!
        }
    }
    
    private func addSubviews(){
        addSubview(lblTemp)
        addSubview(lblCity)
        addSubview(imgWeather)
    }
    
    private func configConstraints(){
        setConstraintLblCity()
        setConstraintLblTemp()
        setConstraintsImgWeather()
    }
    
    private func addAditionalConfigs(){
        selectedBackgroundView = bgViewColor
        lblTemp.highlightedTextColor = .white
        lblCity.highlightedTextColor = .white
        imgWeather.tintColor = .white
    }
    
    private func setConstraintLblCity(){
        lblCity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        lblCity.heightAnchor.constraint(equalToConstant: 42).isActive = true
        lblCity.trailingAnchor.constraint(equalTo: imgWeather.leadingAnchor, constant: -8).isActive = true
    }
    
    private func setConstraintsImgWeather(){
        imgWeather.centerYAnchor.constraint(equalTo: lblCity.centerYAnchor).isActive = true
        imgWeather.heightAnchor.constraint(equalToConstant: 32).isActive = true
        imgWeather.widthAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    private func setConstraintLblTemp(){
        lblTemp.leadingAnchor.constraint(equalTo: imgWeather.trailingAnchor, constant: 8).isActive = true
        lblTemp.centerYAnchor.constraint(equalTo: lblCity.centerYAnchor).isActive = true
    }
}

//static let HeavyRain = UIImage(named: "chuva forte")!//11d
//static let Rain = UIImage(named: "chuva")!//10d
//static let Overcast = UIImage(named: "encoberto")!
//static let Frost = UIImage(named: "geada")!
//static let Snow = UIImage(named: "neve")!//13d
//static let Fog = UIImage(named: "nevoeiro")!//50d
//static let Cloudy = UIImage(named: "nublado")!//02d,02n,03d,03n,04d,04n
//static let Sun = UIImage(named: "Sol")!//01d,01n
