//
//  AddWeatherCell.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 10/11/22.
//

import UIKit

class AddWeatherCell: UITableViewCell {


    private lazy var lblState: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = ConstantsHome.HeaderColor
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        addSubview(lblState)
    }
    
    private func addConstraints(){
        configConstraintsLblState()
    }
    
    func configCell(city: String){
        lblState.text = city
    }

    private func addAditionalConfiguration(){}
    
    private func configConstraintsLblState(){
        lblState.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        lblState.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        lblState.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
