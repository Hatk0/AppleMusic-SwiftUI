import SwiftUI

final class HostingViewController: UIHostingController<CategoryDetailView> {
    
    init() {
        super.init(rootView: CategoryDetailView())
    }
    
    @objc
    required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
