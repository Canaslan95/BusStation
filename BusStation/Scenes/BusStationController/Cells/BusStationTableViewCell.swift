//
//  BusStationTableViewCell.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 20.09.2021.
//

import UIKit
import Kingfisher


class BusStationTableViewCell: UITableViewCell {
    @IBOutlet private weak var iconImage: UIImageView!
    @IBOutlet private weak var routeLabel: UILabel!
    @IBOutlet private weak var remaningTimeLabel: UILabel!
    @IBOutlet private weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.backgroundColor = .systemGroupedBackground
        containerView.layer.cornerRadius = 15
        iconImage.contentMode = .center
    }
     
    func populate(viewModel: Bus) {
        let imageUrl = URL(string: viewModel.icon ?? "")
        routeLabel.text = viewModel.routeCode
        remaningTimeLabel.text = viewModel.remainingTime?.description
        iconImage.kf.setImage(with: imageUrl)
    }
}
