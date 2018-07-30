//
//  ViewController.swift
//  rxtest
//
//  Created by Przemyslaw Biskup on 19/01/2018.
//  Copyright © 2018 Przemyslaw Biskup. All rights reserved.
//
import Foundation
import UIKit
import RxSwift
import RxCocoa

final class FirstViewController: UIViewController {
    
    @IBOutlet weak var textF: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        print("kvo")
        print(textF.text)
    }
//    let disposeBag = DisposeBag()
    
//    let publishSubject = PublishSubject<String?>()
    override func viewDidLoad() {
        super.viewDidLoad()
        textF.addObserver(self, forKeyPath: #keyPath(UITextField.text), options: [.new, .old], context: nil)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            print(1)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            print(2)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
            print(3)
        }
        
//                textF.rx.text.asDriver()
//                    .drive(onNext: { text in
//                        self.label.text = text?.uppercased()
//                    })
//                .disposed(by: disposeBag)
        
//        textF.rx.text.asObservable()
//            .map { (str) -> String? in
//                return str?.uppercased() }
//            .bind(to: publishSubject)
//            .disposed(by: disposeBag)
        
        //        publishSubject.subscribe(label.rx.text)
        //        .disposed(by: disposeBag)
//        publishSubject.subscribe(onNext: { (str) in
//            self.label.text = str
//        })
//            .disposed(by: disposeBag)
    }
}
