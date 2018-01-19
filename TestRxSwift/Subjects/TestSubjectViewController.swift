//
//  TestSubjectViewController.swift
//  TestRxSwift
//
//  Created by Poorva on 19/01/18.
//  Copyright © 2018 Poorva. All rights reserved.
//

import UIKit
import RxSwift

class TestSubjectViewController: UIViewController {
    var viewModel:TestSubjectViewModel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var publishSubjectLabel: UILabel!
    @IBOutlet weak var publishSubjButton: UIButton!
    @IBOutlet weak var variableLabel: UILabel!

    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bind(publishSubj: publishSubjButton.rx.tap.asDriver(), text: textfield.rx.text)
        viewModel.publishSubj.asObservable().bind(to: publishSubjectLabel.rx.text).disposed(by: bag)
        viewModel.textValue.asObservable().bind(to: variableLabel.rx.text).disposed(by: bag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
