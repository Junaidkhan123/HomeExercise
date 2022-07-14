//
//  HomeViewController.swift
//  HomeExercise
//
//  Created by Junaid on 11/07/2022.
//

import UIKit
import SkeletonView
class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: ErrorView!
    @IBOutlet weak var titleLabel: UILabel!
    var viewModel: TrendingRepoViewModelPresentable?
    var expandedCellHeight: CGFloat = 180
    var collapsedCellHeight: CGFloat = 80
    var isCollapsed = false
    var selectedIndex = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        titleLabel.text = viewModel?.getTitle()
        bindData()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.showSkeletonAnimation()
        performRequest()
    }

    private func setupTableView() {
        tableView.register(UINib(nibName: "TrendingRepoCell", bundle: nil), forCellReuseIdentifier: "TrendingRepoCell")

    }

    func performRequest() {
        viewModel?.fetchTrendingData()
    }
}

//MARK:- TableViewDelagate and DataSoources
extension HomeViewController: SkeletonTableViewDelegate, SkeletonTableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.numberOfRepo() ?? 0
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "TrendingRepoCell"
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingRepoCell", for: indexPath) as? TrendingRepoCell else { return UITableViewCell()}

        guard let cellViewModel = viewModel?.trendingCellViewModel(for: indexPath.row) else {
            return UITableViewCell()
        }

        cell.populateUI(with: cellViewModel)
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndex == indexPath.row {
            isCollapsed.toggle()
        }
        else {
            isCollapsed = true
        }
        selectedIndex = indexPath.row
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath.row && isCollapsed {
            return expandedCellHeight

        }
        else { return collapsedCellHeight }

    }
}

//MARK:- Binding Data
extension HomeViewController {

    func bindData() {

        viewModel?.reloadTableViewData = { [weak self] in
            guard let `self` = self else { return }

            DispatchQueue.main.async {
                `self`.tableView.hideSkeletonAnimation()
                `self`.tableView.reloadData()
            }
        }

        viewModel?.updateLoadingStatus = { [weak self] in
            guard let `self` = self else { return }
            DispatchQueue.main.async {
                `self`.errorView.isHidden = false
                `self`.errorView.playAnimation(animationView: `self`.errorView.animationView)
            }
        }

        errorView.retryNetworkRequest = { [weak self] in
            guard let `self` = self else { return }
            `self`.errorView.isHidden = true
            `self`.tableView.showSkeletonAnimation()
            `self`.performRequest()
        }
    }
}
