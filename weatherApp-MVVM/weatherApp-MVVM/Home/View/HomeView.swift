//
//  HomeView.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import UIKit

struct ConstantsHomeView {
    static var HeaderColor: UIColor = UIColor(named: "Home-Header")!
    static var TitleLabel = "Weather App"
    static var BtnSettings = "Settings"
    static var BtnPlus = "plus.app"
}

class HomeView: UIView {
    
    private lazy var vwBgHeader: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ConstantsHomeView.HeaderColor
        return view
    }()
    
    private lazy var lbltitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .white
        label.text = ConstantsHomeView.TitleLabel
        return label
    }()
    
    private lazy var btnPlus: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: ConstantsHomeView.BtnPlus), for: .normal)
        btn.setTitle("", for: .normal)
        btn.tintColor = .white
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private lazy var tbWeather: UITableView = {
        var tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorColor = ConstantsHomeView.HeaderColor
        return tb
    }()
    
    private lazy var btnSettings: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("", for: .normal)
        btn.tintColor = .white
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFit
        btn.setImage(.init(systemName: "gearshape"), for: .normal)
        return btn
    }()
    
    //-----------------------------------------------------------------------
    //  MARK: - Init View
    //-----------------------------------------------------------------------
    
    typealias tbDelegateAndDataSource = (UITableViewDelegate&UITableViewDataSource)
    
    init(tbDelegateDataSource: tbDelegateAndDataSource){
        super.init(frame: .zero)
        
        tbWeather.delegate = tbDelegateDataSource
        tbWeather.dataSource = tbDelegateDataSource
        registerCell()
        addSubViews()
        addConstraints()
        addAditionalConfiguration()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-----------------------------------------------------------------------
    //  MARK: - Custhom Methods
    //-----------------------------------------------------------------------
    
    private func registerCell(){
        tbWeather.register(HomeWeatherCell.self, forCellReuseIdentifier: String(describing: HomeWeatherCell.self))
    }
    
    private func addSubViews(){
        addSubview(vwBgHeader)
        addSubview(tbWeather)
        vwBgHeader.addSubview(lbltitle)
        vwBgHeader.addSubview(btnPlus)
        vwBgHeader.addSubview(btnSettings)
    }
    private func addConstraints(){
        setConstraintsLblTitle()
        setConstraintsPlusBtn()
        setConstraintVwBgHeader()
        setConstraintSettingsBtn()
        setConstraintsTbWeather()
    }
    private func addAditionalConfiguration(){
        backgroundColor = .white

    }
    private func setConstraintsLblTitle(){
        lbltitle.centerXAnchor.constraint(equalTo: vwBgHeader.centerXAnchor).isActive = true
        lbltitle.bottomAnchor.constraint(equalTo: vwBgHeader.bottomAnchor, constant: -4).isActive = true
    }
    private func setConstraintsPlusBtn(){
        btnPlus.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btnPlus.widthAnchor.constraint(equalToConstant: 24).isActive = true
        btnPlus.bottomAnchor.constraint(equalTo: vwBgHeader.bottomAnchor,constant: -8).isActive = true
        btnPlus.trailingAnchor.constraint(equalTo: vwBgHeader.trailingAnchor, constant: -16).isActive = true
    }
    private func setConstraintSettingsBtn(){
        btnSettings.heightAnchor.constraint(equalToConstant: 24).isActive = true
        btnSettings.widthAnchor.constraint(equalToConstant: 24).isActive = true
        btnSettings.leadingAnchor.constraint(equalTo: vwBgHeader.leadingAnchor, constant: 16).isActive = true
        btnSettings.trailingAnchor.constraint(lessThanOrEqualTo: lbltitle.leadingAnchor, constant: -8).isActive = true
        btnSettings.bottomAnchor.constraint(equalTo: vwBgHeader.bottomAnchor, constant: -8).isActive = true
    }
    private func setConstraintVwBgHeader(){
        vwBgHeader.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -60).isActive = true
        vwBgHeader.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor).isActive = true
        vwBgHeader.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor).isActive = true
        vwBgHeader.heightAnchor.constraint(equalToConstant: 144).isActive = true
    }
    private func setConstraintsTbWeather(){
        tbWeather.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24).isActive = true
        tbWeather.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tbWeather.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        tbWeather.topAnchor.constraint(equalTo: vwBgHeader.bottomAnchor, constant: 16).isActive = true
    }
}
