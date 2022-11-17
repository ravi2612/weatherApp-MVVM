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
    
    func configCell(_ obj: HomeWeatherModel?){
        lblCity.text = obj?.city
        lblTemp.text = obj?.temp
        imgWeather.image = UIImage(named: "Sol")!
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
