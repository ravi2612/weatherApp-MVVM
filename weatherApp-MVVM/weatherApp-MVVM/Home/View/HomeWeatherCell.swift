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
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var lblCity: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(_ obj: HomeWeatherModel?){
        lblCity.text = obj?.city
        lblTemp.text = obj?.temp
    }
    
    private func addSubviews(){
        addSubview(lblTemp)
        addSubview(lblCity)
    }
    
    private func configConstraints(){
        setConstraintLblCity()
        setConstraintLblTemp()
    }
    
    private func setConstraintLblCity(){
        lblCity.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        lblCity.heightAnchor.constraint(equalToConstant: 42).isActive = true
//        lblCity.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32).isActive = true
    }
    
    private func setConstraintLblTemp(){
        lblTemp.leadingAnchor.constraint(equalTo: lblCity.trailingAnchor, constant: 8).isActive = true
        lblTemp.centerYAnchor.constraint(equalTo: lblCity.centerYAnchor).isActive = true
    }
}
