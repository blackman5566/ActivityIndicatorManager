//
//  ActivityIndicatorManager.swift
//  ActivityIndicatorManager
//
//  Created by Allen_Hsu on 2025/5/19.
//

import UIKit

class ActivityIndicatorManager {
    static let shared = ActivityIndicatorManager()
    private var activityIndicator: UIActivityIndicatorView?
    private var backgroundView: UIView?
    private let serialQueue = DispatchQueue(label: "com.yourapp.activityIndicatorManager")

    private init() {}

    func start() {
        serialQueue.async {
            self.stopInternal()

            DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                      let window = windowScene.windows.first(where: { $0.isKeyWindow }) else { return }

                let bgView = UIView(frame: window.bounds)
                bgView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                bgView.isUserInteractionEnabled = true
                window.addSubview(bgView)
                self.backgroundView = bgView
                
                let activityIndicator = UIActivityIndicatorView(style: .large)
                activityIndicator.center = window.center
                activityIndicator.color = .white
                activityIndicator.startAnimating()
                window.addSubview(activityIndicator)
                self.activityIndicator = activityIndicator
            }
        }
    }

    func stop() {
        serialQueue.async {
            self.stopInternal()
        }
    }

    private func stopInternal() {
        DispatchQueue.main.sync {
            self.activityIndicator?.stopAnimating()
            self.activityIndicator?.removeFromSuperview()
            self.activityIndicator = nil
            
            self.backgroundView?.removeFromSuperview()
            self.backgroundView = nil
        }
    }
}
