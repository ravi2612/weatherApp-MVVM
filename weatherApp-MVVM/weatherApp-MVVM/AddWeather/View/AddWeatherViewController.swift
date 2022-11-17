//
//  AddWeatherViewController.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 10/11/22.
//

import UIKit

final class AddWeatherViewController: UIViewController,
                                      UISearchBarDelegate,
                                      AddWeatherViewModelDelegate {

    var customView: AddWeatherView?
    var viewModel: AddWeatherViewModel?
    
    override func loadView() {
        super.loadView()
        
        view = AddWeatherView(searchBarDelegate: self)
        customView = view as? AddWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel?.loadWeatherCity(searchBar.searchTextField.text ?? "")
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        customView?.sbSearchToggleColor()
    }
    
    func weatherLoaded() {
        viewModel?.dismissView()
    }
    
    func error() {
        DispatchQueue.main.async {
            self.customView?.sbSearchErrorHandler()
            self.customView?.layoutIfNeeded()
        }
    }
    
    func loading(_ show: Bool) {}
}
