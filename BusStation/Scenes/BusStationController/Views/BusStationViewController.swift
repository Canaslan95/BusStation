//
//  BusStationViewController.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 20.09.2021.
//

import UIKit

class BusStationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = BusStationViewModel()
    var headerView: SectionHeaderView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView = SectionHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        registerCells()
        tableView.delegate = self
        tableView.dataSource = self

        viewModel.getStations { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
    
    func registerCells() {
        tableView.register(UINib(nibName: "BusStationTableViewCell", bundle: nil), forCellReuseIdentifier: "BusStationTableViewCell")
    }

}

extension BusStationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.stationResponse.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stationResponse[section].buses?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        headerView?.populate(sectionName: viewModel.stationResponse[section].stationName)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusStationTableViewCell") as? BusStationTableViewCell
        let cellViewModel = viewModel.stationResponse[indexPath.section].buses?[indexPath.row] ?? Bus()
        cell?.populate(viewModel: cellViewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let location = self.viewModel.stationResponse[indexPath.section].location ?? Location()
        let stationName = viewModel.stationResponse[indexPath.section].stationName
        let viewModel = BusLocationViewModel(location: location, stationName: stationName)
        let controller = BusLocationViewController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

