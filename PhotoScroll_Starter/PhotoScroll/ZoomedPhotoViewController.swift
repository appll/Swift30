/// Copyright (c) 2019 Razeware LLC
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import UIKit

class ZoomedPhotoViewController: UIViewController {
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageViewLeading: NSLayoutConstraint!
  @IBOutlet weak var imageViewTrailing: NSLayoutConstraint!
  @IBOutlet weak var imageViewTop: NSLayoutConstraint!
  @IBOutlet weak var imageViewBottom: NSLayoutConstraint!
  
  var photoName: String?
  
  override func viewDidLoad() {
    if let photoName = photoName {
      imageView.image = UIImage(named: photoName)
    }
    initScale(view.bounds.size)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    print("viewDidLayoutSubviews imageview bounds : \(imageView.bounds.size) frame : \(imageView.frame.size)")
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    print("viewWillLayoutSubviews imageview bounds : \(imageView.bounds.size) frame : \(imageView.frame.size)")
  }
  
  func initScale(_ size: CGSize) {
    let widthScale = size.width / imageView.bounds.width
    let heightScale = size.height / imageView.bounds.height
    let minScale = min(widthScale, heightScale)
    scrollView.minimumZoomScale = minScale
    scrollView.zoomScale = minScale
    //在这里有个奇怪的现象，bounds.size和frame.size居然不一样，目前还未知其原因
    print("initScale imageview bounds : \(imageView.bounds.size) frame : \(imageView.frame.size)")
  }
  
  func updateScrollViewLayout() {
    let top = max(0, (view.frame.height - imageView.frame.height) / 2.0)
    imageViewTop.constant = top
    imageViewBottom.constant = top
    
    let leading = max(0, (view.frame.width - imageView.frame.width) / 2.0)
    imageViewLeading.constant = leading
    imageViewTrailing.constant = leading
    view.layoutIfNeeded()
    print("updateScrollViewLayout imageview bounds : \(imageView.bounds.size) frame : \(imageView.frame.size)")
  }
}

extension ZoomedPhotoViewController: UIScrollViewDelegate {
  func viewForZooming(in scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidZoom(_ scrollView: UIScrollView) {
    updateScrollViewLayout()
  }
}
