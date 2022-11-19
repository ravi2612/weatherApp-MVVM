//
//  HomeView.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import UIKit

protocol HomeViewDelegate {
    func btnPlusTapped()
}

class HomeView: UIView {
    
    enum Constants {
        static let HeaderColor: UIColor = UIColor(named: "Home-Header")!
        static let TitleLabel = "Weather App"
        static let BtnPlus = "plus.app"
    }
    
    var delegate: HomeViewDelegate?
    
    private lazy var vwBgHeader: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Constants.HeaderColor
        return view
    }()
    
    private lazy var lbltitle: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .white
        label.text = Constants.TitleLabel
        return label
    }()
    
    private lazy var btnPlus: UIButton = {
        var btn = UIButton()
        btn.setImage(UIImage(systemName: Constants.BtnPlus), for: .normal)
        btn.setTitle("", for: .normal)
        btn.tintColor = .white
        btn.contentHorizontalAlignment = .fill
        btn.contentVerticalAlignment = .fill
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnPlusTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var tbWeather: UITableView = {
        var tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.separatorColor = Constants.HeaderColor
        tb.selectionFollowsFocus = true
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
    
    init(tbDelegateDataSource: tbDelegateAndDataSource, delegate: HomeViewDelegate){
        super.init(frame: .zero)
        self.delegate = delegate
        tbWeather.delegate = tbDelegateDataSource
        tbWeather.dataSource = tbDelegateDataSource
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
    
    func registerCell(){
        tbWeather.register(HomeWeatherCell.self, forCellReuseIdentifier: String(describing: HomeWeatherCell.self))
    }
    
    func reloadTb(){
        tbWeather.reloadData()
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
    
    @objc private func btnPlusTapped(){
        delegate?.btnPlusTapped()
    }
    
    private func addAditionalConfiguration(){
        backgroundColor = .white
        tbWeather.allowsSelection = false
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
        vwBgHeader.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
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
