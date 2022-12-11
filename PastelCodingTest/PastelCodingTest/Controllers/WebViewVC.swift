//
//  WebViewVC.swift
//  PastelCodingTest
//
//  Created by mac on 11/12/2022.
//

import UIKit
import WebKit

class WebViewVC: UIViewController,UIScrollViewDelegate  {
    // MARK: - Properties
    var coordinator: MainCoordinator?
    
    var pageTitle: String?
    var pageUrl: String?
    
    private let btnBack = UIButton().manualLayoutable()
    private let webKit = WKWebView().manualLayoutable()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
        configureUI()
        
        webKit.scrollView.delegate = self
    }
    
    //MARK: - UIScrollViewDelegate
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        scrollView.pinchGestureRecognizer?.isEnabled = false
    }
    
    // MARK: - Visual Setup
    
    private func configureUI() {
        setBackgroundColor()
        setUpProperties()
        setupHierarchy()
        setUpAutoLayout()
        loadUrl()
    }
    
    private func setUpProperties() {

        btnBack.apply {
            $0.backButtonImage()
            $0.addTarget(self, action: #selector(btnDismissPressed), for: .touchUpInside)
        }
        
        webKit.apply {
            $0.navigationDelegate = self
            $0.uiDelegate = self
            $0.viewBackgroundWhite()
            $0.scrollView.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 20, right: 0.0)
            $0.scrollView.contentInsetAdjustmentBehavior = .never
            
            guard let url = URL(string: pageUrl!) else { return }
            let request = URLRequest(url: url)
            webKit.load(request)
        }
        
    }
    
    private func setupHierarchy() {

        view.addSubview(webKit)
        webKit.addSubview(btnBack)
    }
    
    private func setUpAutoLayout() {
        
        btnBack.apply {
            $0.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).activate()
            $0.heightAnchor.constraint(equalToConstant: 32).activate()
            $0.widthAnchor.constraint(equalToConstant: 32).activate()
        }
        
        webKit.apply {
            $0.topAnchor.constraint(equalTo: view.topAnchor).activate()
            $0.bottomAnchor.constraint(equalTo: view.bottomAnchor).activate()
            $0.leadingAnchor.constraint(equalTo: view.leadingAnchor).activate()
            $0.trailingAnchor.constraint(equalTo: view.trailingAnchor).activate()
        }
    }
    
    // MARK: - Handlers
    
    @objc func btnDismissPressed() {
        dismiss(animated: true)
    }
    
    func loadUrl() {
        guard let url = URL(string: pageUrl ?? "") else { return }
        let request = URLRequest(url: url)
        webKit.load(request)
    }
    
}

extension WebViewVC: WKNavigationDelegate, WKUIDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        debugPrint("Finished loading")
        dismiss(animated: true, completion: nil)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showSpinnerView()
        debugPrint("Started loading")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        debugPrint("Failed loading")
    }
    
}

