//
//  UITableView + Ext.swift
//  HomeExercise
//
//  Created by Junaid on 12/07/2022.
//

import UIKit
import SkeletonView
extension UITableView {

    func showSkeletonAnimation() {
        self.isSkeletonable = true
        self.showAnimatedSkeleton()
//        self.visibleCells.forEach { $0.showAnimatedGradientSkeleton() }
    }

    func hideSkeletonAnimation() {
        self.stopSkeletonAnimation()
        self.hideSkeleton()
//        self.visibleCells.forEach { $0.stopSkeletonAnimation()}
//        self.visibleCells.forEach { $0.hideSkeleton()}

    }
}
