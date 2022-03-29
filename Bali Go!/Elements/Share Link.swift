//
//  Share Link.swift
//  Bali Go!
//
//  Created by Nizami Tagiyev on 15.01.2022.
//

import Foundation
import LinkPresentation
import SwiftUI

final class LinkMetadataManager: NSObject,  UIActivityItemSource {

  var linkMetadata: LPLinkMetadata

  let appTitle = "Bali Go!"
  let appleStoreProductURL = "https://apps.apple.com/app/bali-go/id1580667720"  // The url of your app in Apple Store
  let iconImage = "bali-go-cover-1024px" // The name of the image file in your directory
  let png = "png"  // The extension of the image

  init(linkMetadata: LPLinkMetadata = LPLinkMetadata()) {
    self.linkMetadata = linkMetadata
  }
}

// MARK: - Setup
extension LinkMetadataManager {
  /// Creating metadata to population in the share sheet.
  ///
  func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {

    guard let url = URL(string: appleStoreProductURL) else { return linkMetadata }

    linkMetadata.originalURL = url
    linkMetadata.url = linkMetadata.originalURL
    linkMetadata.title = appTitle
    linkMetadata.iconProvider = NSItemProvider(
            contentsOf: Bundle.main.url(forResource: iconImage, withExtension: png))

    return linkMetadata
  }

  /// Showing empty string returns a share sheet with the minimum requirement.
  ///
  func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
    return String()
  }

  /// Sharing url of the application.
  ///
  func activityViewController(_ activityViewController: UIActivityViewController,
                              itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
    return linkMetadata.url
  }
}

extension View {

  /// Populate Apple share sheet to enable user to share Apple Store link.
  ///
  func showAppShareSheet() {
    guard let source = UIApplication.shared.windows.first?.rootViewController else {
      return
    }

    let activityItemMetadata = LinkMetadataManager()

    let activityVC = UIActivityViewController(
      activityItems: [activityItemMetadata],
      applicationActivities: nil)

    if let popoverController = activityVC.popoverPresentationController {
      popoverController.sourceView = source.view
      popoverController.permittedArrowDirections = []
      popoverController.sourceRect = CGRect(x: source.view.bounds.midX,
                                            y: source.view.bounds.midY,
                                            width: .zero, height: .zero)
    }
    source.present(activityVC, animated: true)
  }
}






// Первый вариант листа
//func shareButton() {
//    /// сыпит ошибками в консоль, не показывает картинку приложения
//        let url = URL(string: "https://apps.apple.com/app/bali-go/id1580667720")
//        let activityController = UIActivityViewController(activityItems: [url!], applicationActivities: nil)
//
//        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
//}
