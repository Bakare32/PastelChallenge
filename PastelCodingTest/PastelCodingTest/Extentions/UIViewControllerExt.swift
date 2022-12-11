//
//  UIViewControllerExt.swift
//  PastelCodingTest
//
//  Created by mac on 10/12/2022.
//

import UIKit

extension UIViewController {
    
    func setBackgroundColor() {
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = WHITE_COLOR
        }
    }
    
}

class SpinnerViewController: UIViewController {

    // MARK: - Properties
    private let spinnerView = UIView().manualLayoutable()
    private let spinner = UIActivityIndicatorView().manualLayoutable()
    
    // MARK: - Variables
    
    // MARK: - Init
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        configureUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch? = touches.first
        //location is relative to the current view
        // do something with the touched point
        if touch?.view != spinnerView {
            print("------Modal Dismissed------")
            //self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Visual Setup
    func setupView() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        spinnerView.roundedBg(bgColor: UIColor.white.withAlphaComponent(0.8))
        if #available(iOS 13.0, *) {
            spinner.style = .large
        } else {
            // Fallback on earlier versions
        }

        spinner.startAnimating()
    }
    
    func animateView() {
        self.spinnerView.frame.origin.y = self.spinnerView.frame.origin.y + 1
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
            self.spinnerView.alpha = 1.0;
            self.spinnerView.frame.origin.y = self.spinnerView.frame.origin.y - 1
        })
    }
    
    private func configureUI() {
        setBackgroundColor()
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
    }
    
    private func setUpProperties() {
        spinnerView.apply {
            $0.layer.cornerRadius = 24.0
        }
        
        spinner.apply {
            $0.color = .gray
        }
    }
    
    private func setupHierarchy() {
        view.addSubview(spinnerView)
        spinnerView.addSubview(spinner)
    }
    
    private func setUpAutoLayout() {
        spinnerView.apply {
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
            $0.heightAnchor.constraint(equalToConstant: 80.0).activate()
            $0.widthAnchor.constraint(equalToConstant: 80.0).activate()
        }
        
        spinner.apply {
            $0.centerXAnchor.constraint(equalTo: view.centerXAnchor).activate()
            $0.centerYAnchor.constraint(equalTo: view.centerYAnchor).activate()
        }
    }

}

extension UIViewController {
    
    func showSpinnerView() {
        let progressAlert = SpinnerViewController()
        progressAlert.providesPresentationContextTransitionStyle = true
        progressAlert.definesPresentationContext = true
        progressAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        progressAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(progressAlert, animated: true, completion: nil)
    }
    
    func showSpinnerOver() {
        let progressAlert = SpinnerViewController()
        progressAlert.providesPresentationContextTransitionStyle = true
        progressAlert.definesPresentationContext = true
        progressAlert.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        progressAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        present(progressAlert, animated: true, completion: nil)
    }
    
}
