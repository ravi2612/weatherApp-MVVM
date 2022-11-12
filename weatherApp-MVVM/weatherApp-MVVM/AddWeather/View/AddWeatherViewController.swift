//
//  AddWeatherViewController.swift
//  WeatherApp-MVVM
//
//  Created by Ravi navarro on 10/11/22.
//

import UIKit

final class AddWeatherViewController: UIViewController,
                                      UITableViewDelegate,
                                      UITableViewDataSource {
    
    var customView: AddWeatherView?
    
    override func loadView() {
        super.loadView()
        
        view = AddWeatherView(tbDelegateDataSource: self)
        customView = view as? AddWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
