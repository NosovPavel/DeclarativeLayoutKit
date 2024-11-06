import Foundation

extension UITableView {

    public enum Style : Int, @unchecked Sendable {

        case plain = 0

        case grouped = 1

        @available(iOS 13.0, *)
        case insetGrouped = 2
    }

    public enum ScrollPosition : Int, @unchecked Sendable {

        case none = 0

        case top = 1

        case middle = 2

        case bottom = 3
    }

    public enum RowAnimation : Int, @unchecked Sendable {

        case fade = 0

        case right = 1

        case left = 2

        case top = 3

        case bottom = 4

        case none = 5

        case middle = 6

        case automatic = 100
    }

    @available(iOS 3.0, *)
    public class let indexSearch: String

    @available(iOS 5.0, *)
    public class let automaticDimension: CGFloat

    nonisolated public class let selectionDidChangeNotification: NSNotification.Name

    @available(iOS 11.0, *)
    public enum SeparatorInsetReference : Int, @unchecked Sendable {

        case fromCellEdges = 0

        case fromAutomaticInsets = 1
    }

    @available(iOS 16.0, *)
    public enum SelfSizingInvalidation : Int, @unchecked Sendable {

        //\/ No updates will take place when -invalidateIntrinsicContentSize is called on a self-sizing cell or its contentView.
        case disabled = 0

        //\/ Calling -invalidateIntrinsicContentSize on a self-sizing cell or its contentView will cause it to be resized if necessary.
        case enabled = 1

        //\/ Calling -invalidateIntrinsicContentSize on a self-sizing cell or its contentView will cause it to be resized if necessary, and
        //\/ any Auto Layout changes within the contentView of a self-sizing cell will automatically trigger -invalidateIntrinsicContentSize.
        case enabledIncludingConstraints = 2
    }
}

//\/ A setting for which items in the table view should tightly hug their content
@available(iOS 18.0, *)
public struct UITableViewContentHuggingElements : OptionSet, @unchecked Sendable {

    public init(rawValue: Int)

    //\/ A content hugging mode where section headers in the table view tightly hug their content
    public static var sectionHeaders: UITableViewContentHuggingElements { get }
}

extension UITableViewRowAction {

    @available(iOS, introduced: 8.0, deprecated: 13.0, message: \"Use UIContextualAction and related APIs instead.\")
    public enum Style : Int, @unchecked Sendable {

        case `default` = 0

        public static var destructive: UITableViewRowAction.Style { get }

        case normal = 1
    }
}

@available(iOS, introduced: 8.0, deprecated: 13.0, message: \"Use UIContextualAction and related APIs instead.\")
@MainActor open class UITableViewRowAction : NSObject, NSCopying {

    public convenience init(style: UITableViewRowAction.Style, title: String?, handler: @escaping (UITableViewRowAction, IndexPath) -> Void)

    open var style: UITableViewRowAction.Style { get }

    open var title: String?

    @NSCopying open var backgroundColor: UIColor?

    @NSCopying open var backgroundEffect: UIVisualEffect?
}

@available(iOS 9.0, *)
@MainActor open class UITableViewFocusUpdateContext : UIFocusUpdateContext {

    open var previouslyFocusedIndexPath: IndexPath? { get }

    open var nextFocusedIndexPath: IndexPath? { get }
}

@MainActor public protocol UITableViewDelegate : UIScrollViewDelegate {

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int)

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat

    @available(iOS 7.0, *)
    optional func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat

    @available(iOS 7.0, *)
    optional func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat

    @available(iOS 7.0, *)
    optional func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath)

    @available(iOS 6.0, *)
    optional func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath?

    @available(iOS 3.0, *)
    optional func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath?

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)

    @available(iOS 3.0, *)
    optional func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath)

    /**
     * @abstract Called to determine if a primary action can be performed for the row at the given indexPath.
     * See @c tableView:performPrimaryActionForRowAtIndexPath: for more details about primary actions.
     *
     * @param tableView This UITableView
     * @param indexPath NSIndexPath of the row
     *
     * @return `YES` if the primary action can be performed; otherwise `NO`. If not implemented defaults to `YES` when not editing
     * and `NO` when editing.
     */
    @available(iOS 16.0, *)
    optional func tableView(_ tableView: UITableView, canPerformPrimaryActionForRowAt indexPath: IndexPath) -> Bool

    /**
     * @abstract Called when the primary action should be performed for the row at the given indexPath.
     *
     * @discussion Primary actions allow you to distinguish between a change of selection (which can be based on focus changes or
     * other indirect selection changes) and distinct user actions. Primary actions are performed when the user selects a cell without extending
     * an existing selection. This is called after @c willSelectRow and @c didSelectRow , regardless of whether the cell's selection
     * state was allowed to change.
     *
     * As an example, use @c didSelectRowAtIndexPath for updating state in the current view controller (i.e. buttons, title, etc) and
     * use the primary action for navigation or showing another split view column.
     *
     * @param tableView This UITableView
     * @param indexPath NSIndexPath of the row to perform the action on
     */
    @available(iOS 16.0, *)
    optional func tableView(_ tableView: UITableView, performPrimaryActionForRowAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle

    @available(iOS 3.0, *)
    optional func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String?

    @available(iOS, introduced: 8.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?

    @available(iOS 11.0, *)
    optional func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?

    @available(iOS 11.0, *)
    optional func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?)

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool

    @available(iOS, introduced: 5.0, deprecated: 13.0)
    optional func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?)

    @available(iOS 9.0, *)
    optional func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    optional func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool

    @available(iOS 9.0, *)
    optional func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)

    @available(iOS 9.0, *)
    optional func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath?

    //\/ Determines if the row at the specified index path should also become selected when focus moves to it.
    //\/ If the table view's global selectionFollowsFocus is enabled, this method will allow you to override that behavior on a per-index path basis. This method is not called if selectionFollowsFocus is disabled. 
    @available(iOS 15.0, *)
    optional func tableView(_ tableView: UITableView, selectionFollowsFocusForRowAt indexPath: IndexPath) -> Bool

    @available(iOS 11.0, *)
    optional func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: any UISpringLoadedInteractionContext) -> Bool

    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool

    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath)

    @available(iOS 13.0, *)
    optional func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView)

    /**
     * @abstract Called when the interaction begins.
     *
     * @param tableView  This UITableView.
     * @param indexPath  IndexPath of the row for which a configuration is being requested.
     * @param point      Location of the interaction in the table view's coordinate space
     *
     * @return A UIContextMenuConfiguration describing the menu to be presented. Return nil to prevent the interaction from beginning.
     *         Returning an empty configuration causes the interaction to begin then fail with a cancellation effect. You might use this
     *         to indicate to users that it's possible for a menu to be presented from this element, but that there are no actions to
     *         present at this particular time.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?

    /**
     * @abstract Called when the interaction begins. Return a UITargetedPreview to override the default preview created by the table view.
     *
     * @param tableView      This UITableView.
     * @param configuration  The configuration of the menu about to be displayed by this interaction.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    /**
     * @abstract Called when the interaction is about to dismiss. Return a UITargetedPreview describing the desired dismissal target.
     * The interaction will animate the presented menu to the target. Use this to customize the dismissal animation.
     *
     * @param tableView      This UITableView.
     * @param configuration  The configuration of the menu displayed by this interaction.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    /**
     * @abstract Called when the interaction is about to \"commit\" in response to the user tapping the preview.
     *
     * @param tableView      This UITableView.
     * @param configuration  Configuration of the currently displayed menu.
     * @param animator       Commit animator. Add animations to this object to run them alongside the commit transition.
     */
    @available(iOS 13.0, *)
    optional func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating)

    /**
     * @abstract Called when the table view is about to display a menu.
     *
     * @param tableView       This UITableView.
     * @param configuration   The configuration of the menu about to be displayed.
     * @param animator        Appearance animator. Add animations to run them alongside the appearance transition.
     */
    @available(iOS 14.0, *)
    optional func tableView(_ tableView: UITableView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?)

    /**
     * @abstract Called when the table view's context menu interaction is about to end.
     *
     * @param tableView       This UITableView.
     * @param configuration   Ending configuration.
     * @param animator        Disappearance animator. Add animations to run them alongside the disappearance transition.
     */
    @available(iOS 14.0, *)
    optional func tableView(_ tableView: UITableView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?)
}

@available(iOS 2.0, *)
@MainActor open class UITableView : UIScrollView, NSCoding, UIDataSourceTranslating {

    public init(frame: CGRect, style: UITableView.Style)

    public init?(coder: NSCoder)

    open var style: UITableView.Style { get }

    weak open var dataSource: (any UITableViewDataSource)?

    weak open var delegate: (any UITableViewDelegate)?

    @available(iOS 10.0, *)
    weak open var prefetchDataSource: (any UITableViewDataSourcePrefetching)?

    @available(iOS 15.0, *)
    open var isPrefetchingEnabled: Bool

    @available(iOS 11.0, *)
    weak open var dragDelegate: (any UITableViewDragDelegate)?

    @available(iOS 11.0, *)
    weak open var dropDelegate: (any UITableViewDropDelegate)?

    open var rowHeight: CGFloat

    open var sectionHeaderHeight: CGFloat

    open var sectionFooterHeight: CGFloat

    @available(iOS 7.0, *)
    open var estimatedRowHeight: CGFloat

    @available(iOS 7.0, *)
    open var estimatedSectionHeaderHeight: CGFloat

    @available(iOS 7.0, *)
    open var estimatedSectionFooterHeight: CGFloat

    //\/ The height for filler rows added below the last row when there aren't enough rows to fill a plain style table view.
    //\/ Set 0 to disable filler rows entirely, use `UITableViewAutomaticDimension` for the default height.
    @available(iOS 15.0, *)
    open var fillerRowHeight: CGFloat

    //\/ Padding above each section header. The default value is `UITableViewAutomaticDimension`.
    @available(iOS 15.0, *)
    open var sectionHeaderTopPadding: CGFloat

    @available(iOS 7.0, *)
    open var separatorInset: UIEdgeInsets

    @available(iOS 11.0, *)
    open var separatorInsetReference: UITableView.SeparatorInsetReference

    @available(iOS 16.0, *)
    open var selfSizingInvalidation: UITableView.SelfSizingInvalidation

    @available(iOS 3.2, *)
    open var backgroundView: UIView?

    @available(iOS 14.0, *)
    open var contextMenuInteraction: UIContextMenuInteraction? { get }

    open var numberOfSections: Int { get }

    open func numberOfRows(inSection section: Int) -> Int

    open func rect(forSection section: Int) -> CGRect

    open func rectForHeader(inSection section: Int) -> CGRect

    open func rectForFooter(inSection section: Int) -> CGRect

    open func rectForRow(at indexPath: IndexPath) -> CGRect

    open func indexPathForRow(at point: CGPoint) -> IndexPath?

    open func indexPath(for cell: UITableViewCell) -> IndexPath?

    open func indexPathsForRows(in rect: CGRect) -> [IndexPath]?

    open func cellForRow(at indexPath: IndexPath) -> UITableViewCell?

    open var visibleCells: [UITableViewCell] { get }

    open var indexPathsForVisibleRows: [IndexPath]? { get }

    @available(iOS 6.0, *)
    open func headerView(forSection section: Int) -> UITableViewHeaderFooterView?

    @available(iOS 6.0, *)
    open func footerView(forSection section: Int) -> UITableViewHeaderFooterView?

    open func scrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool)

    open func scrollToNearestSelectedRow(at scrollPosition: UITableView.ScrollPosition, animated: Bool)

    @available(iOS 11.0, *)
    open func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    open func beginUpdates()

    open func endUpdates()

    open func insertSections(_ sections: IndexSet, with animation: UITableView.RowAnimation)

    open func deleteSections(_ sections: IndexSet, with animation: UITableView.RowAnimation)

    @available(iOS 5.0, *)
    open func moveSection(_ section: Int, toSection newSection: Int)

    @available(iOS 3.0, *)
    open func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation)

    open func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    open func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    @available(iOS 5.0, *)
    open func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath)

    @available(iOS 3.0, *)
    open func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation)

    @available(iOS 15.0, *)
    open func reconfigureRows(at indexPaths: [IndexPath])

    @available(iOS 11.0, *)
    open var hasUncommittedUpdates: Bool { get }

    open func reloadData()

    @available(iOS 3.0, *)
    open func reloadSectionIndexTitles()

    open var isEditing: Bool

    open func setEditing(_ editing: Bool, animated: Bool)

    @available(iOS 3.0, *)
    open var allowsSelection: Bool

    open var allowsSelectionDuringEditing: Bool

    @available(iOS 5.0, *)
    open var allowsMultipleSelection: Bool

    @available(iOS 5.0, *)
    open var allowsMultipleSelectionDuringEditing: Bool

    open var indexPathForSelectedRow: IndexPath? { get }

    @available(iOS 5.0, *)
    open var indexPathsForSelectedRows: [IndexPath]? { get }

    open func selectRow(at indexPath: IndexPath?, animated: Bool, scrollPosition: UITableView.ScrollPosition)

    open func deselectRow(at indexPath: IndexPath, animated: Bool)

    open var sectionIndexMinimumDisplayRowCount: Int

    @available(iOS 6.0, *)
    open var sectionIndexColor: UIColor?

    @available(iOS 7.0, *)
    open var sectionIndexBackgroundColor: UIColor?

    @available(iOS 6.0, *)
    open var sectionIndexTrackingBackgroundColor: UIColor?

    open var separatorStyle: UITableViewCell.SeparatorStyle

    open var separatorColor: UIColor?

    @available(iOS 8.0, *)
    @NSCopying open var separatorEffect: UIVisualEffect?

    @available(iOS 9.0, *)
    open var cellLayoutMarginsFollowReadableWidth: Bool

    @available(iOS 11.0, *)
    open var insetsContentViewsToSafeArea: Bool

    open var tableHeaderView: UIView?

    open var tableFooterView: UIView?

    open func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell?

    @available(iOS 6.0, *)
    open func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell

    @available(iOS 6.0, *)
    open func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView?

    @available(iOS 5.0, *)
    open func register(_ nib: UINib?, forCellReuseIdentifier identifier: String)

    @available(iOS 6.0, *)
    open func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)

    @available(iOS 6.0, *)
    open func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String)

    @available(iOS 6.0, *)
    open func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)

    @available(iOS 9.0, *)
    open var remembersLastFocusedIndexPath: Bool

    //\/ When enabled, the table view ensures that selection is automatically triggered when focus moves to a cell.
    //\/ Defaults to a system derived value based on platform and other properties of the table view.
    @available(iOS 14.0, *)
    open var selectionFollowsFocus: Bool

    //\/ Determines if the table view allows its cells to become focused.
    //\/ When tableView:canFocusRowAtIndexPath: is implemented, its return value takes precedence over this method.
    //\/ Defaults to a system derived value based on platform and other properties of the table view.
    @available(iOS 15.0, *)
    open var allowsFocus: Bool

    //\/ Determines if the table view allows its cells to become focused while editing.
    //\/ When tableView:canFocusRowAtIndexPath: is implemented, its return value takes precedence over this method.
    //\/ Defaults to a system derived value based on platform and other properties of the table view.
    @available(iOS 15.0, *)
    open var allowsFocusDuringEditing: Bool

    @available(iOS 11.0, *)
    open var dragInteractionEnabled: Bool

    @available(iOS 11.0, *)
    open var hasActiveDrag: Bool { get }

    @available(iOS 11.0, *)
    open var hasActiveDrop: Bool { get }

    //\/ Determines the type of items that will tightly hug their content.
    //\/
    //\/ The default value for this property is `UITableViewContentHuggingElementsSectionHeaders` on visionOS for plain style table views and `UITableViewContentHuggingElementsNone` on all other platforms.
    //\/ When the value of this property is `UITableViewContentHuggingElementsSectionHeaders`, any header view will not stretch the width of the table view if their content's intrinsic content size is less than the table view's width.
    @available(iOS 18.0, *)
    open var contentHuggingElements: UITableViewContentHuggingElements
}

extension UITableView : UISpringLoadedInteractionSupporting {
}

@MainActor public protocol UITableViewDataSource : NSObjectProtocol {

    @available(iOS 2.0, *)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int

    @available(iOS 8.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell

    @available(iOS 2.0, *)
    optional func numberOfSections(in tableView: UITableView) -> Int

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool

    @available(iOS 2.0, *)
    optional func sectionIndexTitles(for tableView: UITableView) -> [String]?

    @available(iOS 2.0, *)
    optional func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
}

@MainActor public protocol UITableViewDataSourcePrefetching : NSObjectProtocol {

    @available(iOS 8.0, *)
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath])

    @available(iOS 8.0, *)
    optional func tableView(_ tableView: UITableView, cancelPrefetchingForRowsAt indexPaths: [IndexPath])
}

@available(iOS 11.0, *)
@MainActor public protocol UITableViewDragDelegate : NSObjectProtocol {

    func tableView(_ tableView: UITableView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem]

    optional func tableView(_ tableView: UITableView, itemsForAddingTo session: any UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem]

    optional func tableView(_ tableView: UITableView, dragPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters?

    optional func tableView(_ tableView: UITableView, dragSessionWillBegin session: any UIDragSession)

    optional func tableView(_ tableView: UITableView, dragSessionDidEnd session: any UIDragSession)

    optional func tableView(_ tableView: UITableView, dragSessionAllowsMoveOperation session: any UIDragSession) -> Bool

    optional func tableView(_ tableView: UITableView, dragSessionIsRestrictedToDraggingApplication session: any UIDragSession) -> Bool
}

@available(iOS 11.0, *)
@MainActor public protocol UITableViewDropDelegate : NSObjectProtocol {

    func tableView(_ tableView: UITableView, performDropWith coordinator: any UITableViewDropCoordinator)

    optional func tableView(_ tableView: UITableView, canHandle session: any UIDropSession) -> Bool

    optional func tableView(_ tableView: UITableView, dropSessionDidEnter session: any UIDropSession)

    optional func tableView(_ tableView: UITableView, dropSessionDidUpdate session: any UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal

    optional func tableView(_ tableView: UITableView, dropSessionDidExit session: any UIDropSession)

    optional func tableView(_ tableView: UITableView, dropSessionDidEnd session: any UIDropSession)

    optional func tableView(_ tableView: UITableView, dropPreviewParametersForRowAt indexPath: IndexPath) -> UIDragPreviewParameters?
}

extension UITableViewDropProposal {

    @available(iOS 11.0, *)
    public enum Intent : Int, @unchecked Sendable {

        case unspecified = 0

        case insertAtDestinationIndexPath = 1

        case insertIntoDestinationIndexPath = 2

        case automatic = 3
    }
}

@available(iOS 11.0, *)
@MainActor open class UITableViewDropProposal : UIDropProposal {

    public init(operation: UIDropOperation, intent: UITableViewDropProposal.Intent)

    open var intent: UITableViewDropProposal.Intent { get }
}

@available(iOS 11.0, *)
@MainActor public protocol UITableViewDropCoordinator : NSObjectProtocol {

    var items: [any UITableViewDropItem] { get }

    var destinationIndexPath: IndexPath? { get }

    var proposal: UITableViewDropProposal { get }

    var session: any UIDropSession { get }

    func drop(_ dragItem: UIDragItem, to placeholder: UITableViewDropPlaceholder) -> any UITableViewDropPlaceholderContext

    func drop(_ dragItem: UIDragItem, toRowAt indexPath: IndexPath) -> any UIDragAnimating

    func drop(_ dragItem: UIDragItem, intoRowAt indexPath: IndexPath, rect: CGRect) -> any UIDragAnimating

    func drop(_ dragItem: UIDragItem, to target: UIDragPreviewTarget) -> any UIDragAnimating
}

@available(iOS 11.0, *)
@MainActor open class UITableViewPlaceholder : NSObject {

    public init(insertionIndexPath: IndexPath, reuseIdentifier: String, rowHeight: CGFloat)

    open var cellUpdateHandler: ((UITableViewCell) -> Void)?
}

@available(iOS 11.0, *)
@MainActor open class UITableViewDropPlaceholder : UITableViewPlaceholder {

    open var previewParametersProvider: ((UITableViewCell) -> UIDragPreviewParameters?)?
}

@available(iOS 11.0, *)
@MainActor public protocol UITableViewDropItem : NSObjectProtocol {

    var dragItem: UIDragItem { get }

    var sourceIndexPath: IndexPath? { get }

    var previewSize: CGSize { get }
}

@available(iOS 11.0, *)
@MainActor public protocol UITableViewDropPlaceholderContext : UIDragAnimating {

    var dragItem: UIDragItem { get }

    func commitInsertion(dataSourceUpdates: (IndexPath) -> Void) -> Bool

    func deletePlaceholder() -> Bool
}

,
extension UITableView: Chainable {}
