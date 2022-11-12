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
    
    private lazy var bgSearchBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var btnClear: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: "mug.fill"), for: .normal)
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
        search.translatesAutoresizingMaskIntoConstraints = false
        search.enablesReturnKeyAutomatically = true
        search.textContentType = .location
        search.placeholder = "Location"
        return search
    }()
    
    private lazy var tbCity: UITableView = {
       let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorColor = UIColor(named: "Home-Header")!
        tb.selectionFollowsFocus = true
        return tb
    }()
    
    typealias tbDelegateAndDataSource = (UITableViewDelegate&UITableViewDataSource)
    
    init(tbDelegateDataSource: tbDelegateAndDataSource){
        super.init(frame: .zero)
        addSubviews()
        addConstraints()
        tbCity.delegate = tbDelegateDataSource
        tbCity.dataSource = tbDelegateDataSource
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews(){
        addSubview(vwHeader)
        vwHeader.addSubview(lblTitle)
        addSubview(bgSearchBar)
        bgSearchBar.addSubview(btnClear)
        bgSearchBar.addSubview(sbSearch)
        addSubview(tbCity)
    }
    
    private func addConstraints(){
        setConstraintsVwHeader()
        setConstraintsLbltitle()
        setConstraintsBgSearchView()
        setConstraintsBtnClear()
        setConstraintsSearchBar()
        setConstraintTbCity()
    }
    
    private func registerCell(){}
    private func reloadTb(){}
    private func addAditionalConfiguration(){}
    
    
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
    private func setConstraintsBtnClear(){
        btnClear.heightAnchor.constraint(equalToConstant: 32).isActive = true
        btnClear.widthAnchor.constraint(equalToConstant: 32).isActive = true
        btnClear.centerYAnchor.constraint(equalTo: bgSearchBar.centerYAnchor).isActive = true
        btnClear.leadingAnchor.constraint(equalTo: bgSearchBar.leadingAnchor, constant: 16).isActive = true
    }
    private func setConstraintsSearchBar(){
        sbSearch.leadingAnchor.constraint(equalTo: btnClear.trailingAnchor, constant: 8).isActive = true
        sbSearch.centerYAnchor.constraint(equalTo: bgSearchBar.centerYAnchor).isActive = true
        sbSearch.trailingAnchor.constraint(lessThanOrEqualTo: bgSearchBar.trailingAnchor,constant: -16).isActive = true
    }
    private func setConstraintTbCity(){
        tbCity.topAnchor.constraint(equalTo: bgSearchBar.bottomAnchor).isActive = true
        tbCity.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        tbCity.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        tbCity.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
