


import UIKit

final class ImageViewController: UIViewController {

    fileprivate var imageView: UIImageView!

}

struct ImageProvider {

    let newImage: UIImage

    func updateImage(in viewController: ImageViewController) {
        // As we used fileprivate, we can now access the imageView property.
        viewController.imageView.image = newImage
    }
}
