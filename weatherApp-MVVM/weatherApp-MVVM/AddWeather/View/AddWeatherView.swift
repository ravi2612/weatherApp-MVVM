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
    
    
    private lazy var lblTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .heavy)
        label.text = ConstantsAddWeatherView.title
        label.textColor = .white
        return label
    }()
    
    private lazy var vwHeader: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "Home-Header")!
        return view
    }()
    
    private lazy var vwBottom: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var bgSearchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var btnWeather: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(named: "Icon-WeathersLauchScreen")!, for: .normal)
        btn.setTitle("", for: .normal)
        btn.tintColor = UIColor(named: "Home-Header")!
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var sbSearch: UISearchBar = {
       let search = UISearchBar()
        search.barTintColor = .white
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    init(searchBarDelegate: UISearchBarDelegate){
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
        sbSearch.delegate = searchBarDelegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        addSubview(vwHeader)
        addSubview(bgSearchBar)
        addSubview(vwBottom)
        vwHeader.addSubview(lblTitle)
        bgSearchBar.addSubview(btnWeather)
        bgSearchBar.addSubview(sbSearch)
    }
    
    private func addConstraints(){
        setConstraintsVwHeader()
        setConstraintsLbltitle()
        setConstraintsBgSearchView()
        setConstraintsBtnWeather()
        setConstraintsSearchBar()
        setConstraintVwBottom()
    }

    private func addAditionalConfiguration(){
        sbSearch.searchBarStyle = .prominent
        sbSearch.isTranslucent = false
        sbSearch.enablesReturnKeyAutomatically = true
        sbSearch.textContentType = .location
        sbSearch.placeholder = "Location..."
        
        sbSearch.clipsToBounds = true
        sbSearch.layer.cornerRadius = 15
    }
    
    func sbSearchErrorHandler(){
        sbSearch.searchTextField.textColor = .systemRed
    }
    func sbSearchToggleColor(){
        sbSearch.searchTextField.textColor = UIColor(named: "Home-Header")!
    }
    
    private func setConstraintVwBottom(){
        vwBottom.topAnchor.constraint(equalTo: bgSearchBar.bottomAnchor).isActive = true
        vwBottom.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        vwBottom.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        vwBottom.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setConstraintsVwHeader(){
        vwHeader.topAnchor.constraint(equalTo: topAnchor).isActive = true
        vwHeader.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        vwHeader.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        vwHeader.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setConstraintsLbltitle(){
        lblTitle.centerXAnchor.constraint(equalTo: vwHeader.centerXAnchor).isActive = true
        lblTitle.centerYAnchor.constraint(equalTo: vwHeader.centerYAnchor).isActive = true
    }
    private func setConstraintsBgSearchView(){
        bgSearchBar.topAnchor.constraint(equalTo: vwHeader.bottomAnchor).isActive = true
        bgSearchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        bgSearchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        bgSearchBar.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    private func setConstraintsBtnWeather(){
        btnWeather.heightAnchor.constraint(equalToConstant: 46).isActive = true
        btnWeather.widthAnchor.constraint(equalToConstant: 46).isActive = true
        btnWeather.centerYAnchor.constraint(equalTo: bgSearchBar.centerYAnchor).isActive = true
        btnWeather.leadingAnchor.constraint(equalTo: bgSearchBar.leadingAnchor, constant: 16).isActive = true
    }
    private func setConstraintsSearchBar(){
        sbSearch.leadingAnchor.constraint(equalTo: btnWeather.trailingAnchor, constant: 8).isActive = true
        sbSearch.centerYAnchor.constraint(equalTo: bgSearchBar.centerYAnchor).isActive = true
        sbSearch.trailingAnchor.constraint(equalTo: bgSearchBar.trailingAnchor,constant: -16).isActive = true
        sbSearch.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
