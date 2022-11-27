//
//  HomeViewController.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 07/11/22.
//

import UIKit

final class HomeViewController: UIViewController,
                                UITableViewDataSource,
                                UITableViewDelegate,
                                HomeWeatherViewModelDelegate,
                                AddWeatherObjcDelegate,
                                HomeViewDelegate{
    
    var viewModel: HomeWeatherViewModel?
    var customView: HomeView?
    
    override func loadView() {
        super.loadView()
        view = HomeView(tbDelegateDataSource: self, delegate: self)
        customView = view as? HomeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customView?.registerCell()
    }
    
    //-----------------------------------------------------------------------
    //    MARK: Custom methods
    //-----------------------------------------------------------------------
    
    //-----------------------------------------------------------------------
    //    MARK: TableView Delegate
    //-----------------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeWeatherCell.self), for: indexPath) as? HomeWeatherCell {
            cell.configCell(viewModel?.weatherList[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    
    //-----------------------------------------------------------------------
    //    MARK: ViewModel Delegate
    //-----------------------------------------------------------------------
    
    func loading(_ show: Bool) {}
    
    func weatherloaded(_ loaded: Bool) {
        DispatchQueue.main.async {
            self.customView?.reloadTb()
        }
    }
    
    //-----------------------------------------------------------------------
    //    MARK: AddWeatherObjc Delegate
    //-----------------------------------------------------------------------
    
    func weatherObjc(objc: WeatherObjc) {
        viewModel?.loadWeatherCity(objc.name)
    }
    
    //-----------------------------------------------------------------------
    //    MARK: HomeView Delegate
    //-----------------------------------------------------------------------
    
    func btnPlusTapped() {
        viewModel?.showAddWeatherView(self)
    }
}
