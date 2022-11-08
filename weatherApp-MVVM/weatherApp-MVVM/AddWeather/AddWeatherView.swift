//
//  AddWeatherView.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import UIKit

struct ConstantsAddWeatherView {
    static let title = "Add City"
}

final class AddWeatherView: UIView {
    
    private lazy var lbltitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.text = ConstantsAddWeatherView.title
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
