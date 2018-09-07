//
//  ViewController.swift
//  OPOP
//
//  Created by Nathakorn on 8/23/18.
//  Copyright © 2018 Nathakorn. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class Interactor: UIPercentDrivenInteractiveTransition {
    var presenting = false
}

class ViewController: UIViewController {
    
    @IBOutlet weak var v: DashView!
    @IBOutlet weak var tx: UITextField!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var imv: UIImageView!
    
    var obsevrable = PublishSubject<UIImage>()
    var t = PublishSubject<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let db = DisposeBag()
        
        obsevrable
            .asObservable()
            .bind(to: imv.rx.image)
            .disposed(by: db)
        
        obsevrable
            .subscribe { d in
            print(d)
        }.disposed(by: db)
        
        tx.rx.text.orEmpty.bind(to: t)
        
        t.subscribe { (t) in
            print(t)
        }
        
    }
    
    @IBAction func tap() {
        guard let url = tx.text else { return }
        guard let u = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: u) { data, res, err in
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            print("Its doen")
            self.obsevrable.onNext(image)
            self.t.onNext(image.description)
        }.resume()
    }
}
