//
//  ViewController.swift
//  SpreadSheetView
//
//  Created by Truong Trung Kien on 14/10/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel: [[String]] = [
        ["Kho", "Có thể đặt", "Tồn"],
        ["Kho Cầu Giấy", "50", "50"],
        ["Kho Ba Đình", "50", "50"],
        ["Kho Thanh Xuân", "", "Hết hàng"],
        ["Tổng", "100", "100"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpCollectionView()
    }

    private func setUpCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: "LabelCell", bundle: nil), forCellWithReuseIdentifier: "LabelCell")
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.collectionView.collectionViewLayout = flowLayout
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.viewModel[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelCell", for: indexPath) as? LabelCell else {return UICollectionViewCell()}
        if indexPath.section == 0 {
            cell.isFirstLine = true
        }
        if indexPath.section == self.viewModel.count - 1 {
            cell.isLastLine = true
        }
        if indexPath.section == 0 && indexPath.row == 0 {
            cell.isFirstItemFirstLine = true
        }
        if indexPath.row == 0 {
            cell.isItemFirstRow = true
        }
        cell.bindingData(title: self.viewModel[indexPath.section][indexPath.row])
        
        cell.didReload = {[weak self] in
            if indexPath.section == 0 && indexPath.row == 0 {
                guard let self = self else {return}
                print("Did reload cell")
            }
        }
        
        cell.didSelectUsageUnitIDText = {[weak self] in
            if indexPath.section == 0 && indexPath.row == 0 {
                guard let self = self else {return}
                print("Did Select UsageUnitITText")
            }
        }
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        self.viewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            print("First: \(self.viewModel[indexPath.section][indexPath.row])")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 4
        switch indexPath.row {
        case 0:
            return CGSize(width: width * 2, height: 100)
        case 1:
            return CGSize(width: width, height: 100)
        case 2:
            return CGSize(width: width, height: 100)
        default:
            return CGSize(width: width, height: 100)
        }
        
    }
}			
