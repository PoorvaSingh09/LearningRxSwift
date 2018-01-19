//
//  ViewController.swift
//  TestRxSwift
//
//  Created by Poorva on 19/01/18.
//  Copyright © 2018 Poorva. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.rx.tap.asDriver().drive(onNext: {[unowned self] in
            
            guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "TestSubjectViewController") as? TestSubjectViewController else { return }
            viewController.viewModel = TestSubjectViewModel()
            self.navigationController?.pushViewController(viewController, animated: true)
        }).disposed(by: bag)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
