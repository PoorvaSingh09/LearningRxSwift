//
//  TestSubjectViewModel.swift
//  TestRxSwift
//
//  Created by Poorva on 19/01/18.
//  Copyright © 2018 Poorva. All rights reserved.
//

import  RxSwift
import RxCocoa

class TestSubjectViewModel {
    let publishSubj = PublishSubject<String?>()
    let behaviorSubj = BehaviorSubject(value: "test")
    let textValue = Variable<String?>("Initial variable value")
    let replaySubj = ReplaySubject<String>.create(bufferSize: 4)
    let bag = DisposeBag()
    
    func bind(publishSubj: Driver<Void>, text: ControlProperty<String?>) {
        publishSubj.drive(onNext: { [unowned self] in
            self.publishSubj.onNext(self.textValue.value)
        }).disposed(by: bag)
        
        text.asObservable().skip(1).subscribe(onNext: { [unowned self] text in
            self.publishSubj.onNext(text)
        }).disposed(by: bag)
        
        text.skip(1).bind(to: textValue).disposed(by: bag)
        
        behaviorSubj.asObservable().subscribe(onNext: {value in
            print(value) //test
        }).disposed(by: bag)

        
        behaviorSubj.onNext("Second value")
        
        behaviorSubj.asObservable().subscribe(onNext: {value in
            print(value) //Second value
        }).disposed(by: bag)
        
        replaySubj.onNext("1")
        replaySubj.onNext("2")
        replaySubj.onNext("3")
        replaySubj.onNext("4")
        replaySubj.asObservable().subscribe(onNext: {value in
            print(value)
        }).disposed(by: bag)
    }
}
