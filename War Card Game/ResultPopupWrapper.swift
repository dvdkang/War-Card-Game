import SwiftUI
import UIKit

struct ResultPopupWrapper: UIViewControllerRepresentable {
    
    @Binding var isPresented: Bool

    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController() // Placeholder, will be replaced when shown
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            let popupVC = Result_Popup()
            popupVC.modalPresentationStyle = .overFullScreen
            popupVC.modalTransitionStyle = .crossDissolve
            
            uiViewController.present(popupVC, animated: true) {
                DispatchQueue.main.async {
                    self.isPresented = false // Close after showing
                }
            }
        }
    }
}

