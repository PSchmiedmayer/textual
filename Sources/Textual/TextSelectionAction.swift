import SwiftUI

/// An action offered on the menu for a text selection, alongside the platform's own.
///
/// The system already provides copying, sharing, look-up and translation for selected text; a selection
/// action adds what the app can do with that text (quote it, search it, save it) without replacing the
/// platform's selection handling.
public struct TextSelectionAction: Identifiable, Sendable {
  public let id: String
  /// The menu item's title.
  public let title: String
  /// The name of an SF Symbol shown with the title, where the platform's menu shows images.
  public let systemImage: String?
  /// Runs with the plain text of the selection when the item is chosen.
  public let handler: @MainActor @Sendable (String) -> Void

  public init(
    id: String? = nil,
    title: String,
    systemImage: String? = nil,
    handler: @escaping @MainActor @Sendable (String) -> Void
  ) {
    self.id = id ?? title
    self.title = title
    self.systemImage = systemImage
    self.handler = handler
  }
}

extension EnvironmentValues {
  @Entry var textSelectionActions: [TextSelectionAction] = []
}
