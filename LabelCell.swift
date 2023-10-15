//
//  LabelCell.swift
//  SpreadSheetView
//
//  Created by Truong Trung Kien on 14/10/2023.
//

import UIKit

class LabelCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var nstWidthImgArrowDown: NSLayoutConstraint!
    @IBOutlet weak var nstWidthImgReload: NSLayoutConstraint!
    @IBOutlet weak var lineTop: UIView!
    @IBOutlet weak var lineBottom: UIView!
    @IBOutlet weak var imgArrowDown: UIImageView!
    @IBOutlet weak var imgReload: UIImageView!
    
    var isFirstLine = false
    var isLastLine = false
    var isFirstItemFirstLine = false
    var isItemFirstRow = false
    
    var didSelectUsageUnitIDText: (() -> Void)?
    var didReload: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        self.label.setContentCompressionResistancePriority(.required, for: .horizontal)
        self.label.translatesAutoresizingMaskIntoConstraints = false
        self.nstWidthImgReload.constant = 0
        self.nstWidthImgArrowDown.constant = 0
        
        self.imgReload.addTapGesture(tapNumber: 1, target: self, action: #selector(self.actionReload(_:)))
        self.imgArrowDown.addTapGesture(tapNumber: 1, target: self, action: #selector(self.actionShowUsageUnitIDText(_:)))
    }
    
    @objc func actionReload(_ sender: Any) {
        self.didReload?()
    }
    
    @objc func actionShowUsageUnitIDText(_ sender: Any) {
        self.didSelectUsageUnitIDText?()
    }

    func bindingData(title: String) {
        self.label.text = title
        
        if self.isFirstLine || self.isLastLine {
            self.mainView.backgroundColor = .lightGray
            self.label.font = .boldSystemFont(ofSize: 15)
        }
        
        if self.isFirstItemFirstLine {
            self.nstWidthImgReload.constant = 20
            self.nstWidthImgArrowDown.constant = 20
            self.label.textColor = .red
            self.lineTop.isHidden = false
        }
        
        if self.isItemFirstRow {
            self.label.textAlignment = .left
        }
    }
}
