import SwiftUI
import UIKit

struct SearchRepresentable: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct SearchRepresentable_Preview: PreviewProvider {
    static var previews: some View {
        SearchRepresentable()
    }
}
