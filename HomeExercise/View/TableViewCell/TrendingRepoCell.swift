//
//  TrendingRepoCell.swift
//  HomeExercise
//
//  Created by Junaid on 12/07/2022.
//

import UIKit
import SkeletonView
import Kingfisher
class TrendingRepoCell: UITableViewCell {

    // MARK: -  UIView Properties
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

     // MARK: -  Configure UI  Method
    private func configureUI() {
        userImageView.clipsToBounds = true
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
    }
}

// MARK:- Binding Cell
extension TrendingRepoCell {
    func populateUI(with viewModel: TrendingRepoCellViewModelPresentable) {
        userNameLabel.text      = viewModel.getUserName()
        repoNameLabel.text      = viewModel.getRepoName()
        descriptionLabel.text  = viewModel.getRepoDescription()
        languageLabel.text      = viewModel.getLanguage()
        gradeLabel.addImageTOLeft(of: UIImage(named: "grade")!, text: " \(viewModel.getGrade())")
        guard let url = URL(string: viewModel.getUserAvatarURL()) else { return }
        userImageView.kf.setImage(with: url)

    }
}
