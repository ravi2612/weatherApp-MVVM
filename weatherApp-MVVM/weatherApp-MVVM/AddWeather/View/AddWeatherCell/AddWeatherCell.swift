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
        return label
    }()
    
    private func addSubviews(){
        addSubview(lblState)
    }
    
    private func addConstraints(){}
    private func registerCell(){}
    private func reloadTb(){}
    private func addAditionalConfiguration(){}
    
}
