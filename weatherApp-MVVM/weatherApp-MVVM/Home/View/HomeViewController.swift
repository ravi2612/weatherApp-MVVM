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
                                HomeWeatherViewModelDelegate{

    var viewModel: HomeWeatherViewModel?
    var wetharList: [HomeWeatherModel]?
    var customView: HomeView?
    
    override func loadView() {
        view = HomeView(tbDelegateDataSource: self)
        customView = view as? HomeView
    }
    
    override func viewDidLoad() {
        customView?.registerCell()
    }
    
    
    //-----------------------------------------------------------------------
    //    MARK: Custom methods
    //-----------------------------------------------------------------------
    
    
    //-----------------------------------------------------------------------
    //    MARK: TableView Delegate
    //-----------------------------------------------------------------------
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.weatherList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HomeWeatherCell.self), for: indexPath) as? HomeWeatherCell {
            cell.configCell(viewModel?.weatherList?[indexPath.row])
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
        customView?.reloadTb()
    }
}
