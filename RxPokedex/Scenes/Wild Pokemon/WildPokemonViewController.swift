//
//  ViewController.swift
//  RxPokedex
//
//  Created by Carl Brenneisen on 10/26/17.
//  Copyright © 2017 carl.brenneisen. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

final class WildPokemonViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var pokemonCollectionView: UICollectionView!
    @IBOutlet weak var refreshButton: UIButton!
    
    //MARK: Flow
    var presenter: WildPokemonPresenter!
    static let identifier = "WildPokemonViewController"
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.update(viewController: self)
        
        setupUI()
        setupBindings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupBindings(){
        presenter
            .sections
            .bind(to: pokemonCollectionView.rx.items(
                dataSource: presenter.cvDataSource))
            .disposed(by: disposeBag)
    }
    
    private func setupUI(){
        
        //background
        if let image = UIImage(named: "grass") {
            view.backgroundColor = UIColor(patternImage: image)
        }

        navigationItem.hidesBackButton = true
        guard let nav = navigationController else { return }
        nav.navigationBar.isHidden = true
        nav.navigationBar.tintColor = UIColor.white
        nav.navigationBar.barTintColor = UIColor.navColor
        nav.navigationBar.isTranslucent = false
        nav.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
    }
}

