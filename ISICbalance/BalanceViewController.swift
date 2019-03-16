//
//  BalanceViewController.swift
//  ISICbalance
//
//  Created by Rostislav Babáček on 12/03/2019.
//  Copyright © 2019 Rostislav Babáček. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {

    let balanceView = BalanceView()
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(balanceView)
        balanceView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        self.balanceView.accountButton?.addTarget(self, action: #selector(accountBtnHandle), for: .touchDown)
    }
    
    @objc func accountBtnHandle() {
        let VC = AccountViewController()
        navigationController?.pushViewController(VC, animated: true)
    }
}