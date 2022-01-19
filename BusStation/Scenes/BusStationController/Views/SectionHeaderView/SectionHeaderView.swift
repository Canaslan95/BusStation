//
//  SectionHeaderView.swift
//  BusStation
//
//  Created by Oğulcan Aslan on 22.09.2021.
//

import UIKit

class SectionHeaderView: UIView {
    
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    @IBOutlet weak var remaningTime: UILabel!
    @IBOutlet var contentView: SectionHeaderView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let nib = UINib(nibName: "SectionHeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        sectionLabel.textAlignment = .center
        sectionLabel.font = .boldSystemFont(ofSize: 20)
        routeLabel.text = "Route"
        routeLabel.font = .boldSystemFont(ofSize: 12)
        remaningTime.text = "Remaning Time"
        remaningTime.numberOfLines = 2
        remaningTime.lineBreakMode = .byTruncatingTail
        remaningTime.textAlignment = .center
        remaningTime.font = .boldSystemFont(ofSize: 12)
    }
    
    func populate(sectionName: String) {
        sectionLabel.text = sectionName
    }
    
}
