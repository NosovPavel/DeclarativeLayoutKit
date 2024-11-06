import Foundation

extension UICollectionView {

    public typealias LayoutInteractiveTransitionCompletion = (Bool, Bool) -> Void

    public struct ScrollPosition : OptionSet, @unchecked Sendable {

        public init(rawValue: UInt)

        public static var top: UICollectionView.ScrollPosition { get }

        public static var centeredVertically: UICollectionView.ScrollPosition { get }

        public static var bottom: UICollectionView.ScrollPosition { get }

        public static var left: UICollectionView.ScrollPosition { get }

        public static var centeredHorizontally: UICollectionView.ScrollPosition { get }

        public static var right: UICollectionView.ScrollPosition { get }
    }

    @available(iOS 11.0, *)
    public enum ReorderingCadence : Int, @unchecked Sendable {

        case immediate = 0

        case fast = 1

        case slow = 2
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

@available(iOS 9.0, *)
@MainActor open class UICollectionViewFocusUpdateContext : UIFocusUpdateContext {

    open var previouslyFocusedIndexPath: IndexPath? { get }

    open var nextFocusedIndexPath: IndexPath? { get }
}

@MainActor public protocol UICollectionViewDataSource : NSObjectProtocol {

    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int

    @available(iOS 8.0, *)
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell

    @available(iOS 6.0, *)
    optional func numberOfSections(in collectionView: UICollectionView) -> Int

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)

    //\/ Returns a list of index titles to display in the index view (e.g. [\"A\", \"B\", \"C\" ... \"Z\", \"#\"])
    @available(iOS 14.0, *)
    optional func indexTitles(for collectionView: UICollectionView) -> [String]?

    //\/ Returns the index path that corresponds to the given title \/ index. (e.g. \"B\",1)
    //\/ Return an index path with a single index to indicate an entire section, instead of a specific item.
    @available(iOS 14.0, *)
    optional func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath
}

@MainActor public protocol UICollectionViewDataSourcePrefetching : NSObjectProtocol {

    @available(iOS 10.0, *)
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath])

    @available(iOS 10.0, *)
    optional func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath])
}

@MainActor public protocol UICollectionViewDelegate : UIScrollViewDelegate {

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)

    /**
     * @abstract Called to determine if a primary action can be performed for the item at the given indexPath.
     * See @c collectionView:performPrimaryActionForItemAtIndexPath: for more details about primary actions.
     *
     * @param collectionView This UICollectionView
     * @param indexPath NSIndexPath of the item
     *
     * @return `YES` if the primary action can be performed; otherwise `NO`. If not implemented, defaults to `YES` when not editing
     * and `NO` when editing.
     */
    @available(iOS 16.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canPerformPrimaryActionForItemAt indexPath: IndexPath) -> Bool

    /**
     * @abstract Called when the primary action should be performed for the item at the given indexPath.
     *
     * @discussion Primary actions allow you to distinguish between a change of selection (which can be based on focus changes or
     * other indirect selection changes) and distinct user actions. Primary actions are performed when the user selects a cell without extending
     * an existing selection. This is called after @c shouldSelectItem and @c didSelectItem , regardless of whether the cell's selection
     * state was allowed to change.
     *
     * As an example, use @c didSelectItemAtIndexPath for updating state in the current view controller (i.e. buttons, title, etc) and
     * use the primary action for navigation or showing another split view column.
     *
     * @param collectionView This UICollectionView
     * @param indexPath NSIndexPath of the item to perform the action on
     */
    @available(iOS 16.0, *)
    optional func collectionView(_ collectionView: UICollectionView, performPrimaryActionForItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath)

    @available(iOS 8.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath)

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    optional func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    optional func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool

    @available(iOS, introduced: 6.0, deprecated: 13.0)
    optional func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?)

    @available(iOS 7.0, *)
    optional func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)

    @available(iOS 9.0, *)
    optional func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath?

    //\/ Determines if the item at the specified index path should also become selected when focus moves to it.
    //\/ If the collection view's global selectionFollowsFocus is enabled, this method will allow you to override that behavior on a per-index path basis. This method is not called if selectionFollowsFocus is disabled.
    @available(iOS 15.0, *)
    optional func collectionView(_ collectionView: UICollectionView, selectionFollowsFocusForItemAt indexPath: IndexPath) -> Bool

    @available(iOS 15.0, *)
    optional func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveOfItemFromOriginalIndexPath originalIndexPath: IndexPath, atCurrentIndexPath currentIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath

    @available(iOS, introduced: 9.0, deprecated: 15.0)
    optional func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt currentIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath

    @available(iOS 9.0, *)
    optional func collectionView(_ collectionView: UICollectionView, targetContentOffsetForProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint

    @available(iOS 14.0, *)
    optional func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool

    @available(iOS 11.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldSpringLoadItemAt indexPath: IndexPath, with context: any UISpringLoadedInteractionContext) -> Bool

    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool

    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath)

    @available(iOS 13.0, *)
    optional func collectionViewDidEndMultipleSelectionInteraction(_ collectionView: UICollectionView)

    /**
     * @abstract Called when a context menu is invoked from this collection view.
     *
     * @param collectionView  The @c UICollectionView.
     * @param indexPaths      An array of index paths on which the menu acts.
     * @param point           Touch location in the collection view's coordinate space.
     *
     * @return A @c UIContextMenuConfiguration describing the menu to be presented. Return nil to prevent the interaction from beginning.
     *         Returning an empty configuration causes the interaction to begin then fail with a cancellation effect. You might use this
     *         to indicate to users that it's possible for a menu to be presented from this element, but that there are no actions to
     *         present at this particular time.
     *
     * @discussion  The @c indexPaths array may contain 0-many items:
     *              - An empty array indicates that the menu was invoked in the space between cells (or any location that does not map to an item index path).
     *              - An array with multiple index paths indicates that the menu was invoked on an item within a multiple selection.
     */
    @available(iOS 16.0, *)
    optional func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration?

    /**
     * @abstract Called when a context menu interaction begins in this collection view to request a preview for the interaction's initial highlight effect.
     *           Return a @c UITargetedPreview corresponding to the item at the given indexPath.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   Configuration of the menu that will be presented if the interaction proceeds.
     * @param indexPath       Index path of the item at which the interaction is occurring.
     */
    @available(iOS 16.0, *)
    optional func collectionView(_ collectionView: UICollectionView, contextMenuConfiguration configuration: UIContextMenuConfiguration, highlightPreviewForItemAt indexPath: IndexPath) -> UITargetedPreview?

    /**
     * @abstract Called when a context menu presented from this collection view is dismissed. Return a @c UITargetedPreview corresponding to the item at the given indexPath.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   Configuration of the menu being dismissed.
     * @param indexPath       Index path of the item to which the menu is being dismissed.
     */
    @available(iOS 16.0, *)
    optional func collectionView(_ collectionView: UICollectionView, contextMenuConfiguration configuration: UIContextMenuConfiguration, dismissalPreviewForItemAt indexPath: IndexPath) -> UITargetedPreview?

    /**
     * @abstract Called when the interaction is about to \"commit\" in response to the user tapping the preview.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   Configuration of the currently displayed menu.
     * @param animator        Commit animator. Add animations to this object to run them alongside the commit transition.
     */
    @available(iOS 13.0, *)
    optional func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating)

    /**
     * @abstract Called when the collection view is about to display a menu.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   The configuration of the menu about to be displayed.
     * @param animator        Appearance animator. Add animations to run them alongside the appearance transition.
     */
    @available(iOS 13.2, *)
    optional func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?)

    /**
     * @abstract Called when the collection view's context menu interaction is about to end.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   Ending configuration.
     * @param animator        Disappearance animator. Add animations to run them alongside the disappearance transition.
     */
    @available(iOS 13.2, *)
    optional func collectionView(_ collectionView: UICollectionView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?)

    /**
     * @abstract Return a valid @c UIWindowSceneActivationConfiguration to allow for the cell to be expanded into a new scene. Return nil to prevent the interaction from starting.
     *
     * @param collectionView The collection view
     * @param indexPath The index path of the cell being interacted with
     * @param point The centroid of the interaction in the collection view's coordinate space.
     */
    @available(iOS 15.0, *)
    optional func collectionView(_ collectionView: UICollectionView, sceneActivationConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIWindowScene.ActivationConfiguration?

    /**
     * @abstract Called when the interaction begins.
     *
     * @param collectionView  The @c UICollectionView.
     * @param indexPath       IndexPath of the item for which a configuration is being requested.
     * @param point           Touch location in the collection view's coordinate space
     *
     * @return A UIContextMenuConfiguration describing the menu to be presented. Return nil to prevent the interaction from beginning.
     *         Returning an empty configuration causes the interaction to begin then fail with a cancellation effect. You might use this
     *         to indicate to users that it's possible for a menu to be presented from this element, but that there are no actions to
     *         present at this particular time. If the non-deprecated replacement for the configuration, highlight preview, or dismissal preview methods is implemented this method is not called.
     */
    @available(iOS, introduced: 13.0, deprecated: 16.0)
    optional func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration?

    /**
     * @abstract Called when the interaction begins. Return a UITargetedPreview describing the desired highlight preview.
     *           If the non-deprecated replacement for the configuration, highlight preview, or dismissal preview methods is implemented this method is not called.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   The configuration of the menu about to be displayed by this interaction.
     */
    @available(iOS, introduced: 13.0, deprecated: 16.0)
    optional func collectionView(_ collectionView: UICollectionView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?

    /**
     * @abstract Called when the interaction is about to dismiss. Return a UITargetedPreview describing the desired dismissal target.
     *           The interaction will animate the presented menu to the target. Use this to customize the dismissal animation.
     *           If the non-deprecated replacement for the configuration, highlight preview, or dismissal preview methods is implemented this method is not called.
     *
     * @param collectionView  The @c UICollectionView.
     * @param configuration   The configuration of the menu displayed by this interaction.
     */
    @available(iOS, introduced: 13.0, deprecated: 16.0)
    optional func collectionView(_ collectionView: UICollectionView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview?
}

@available(iOS 6.0, *)
@MainActor open class UICollectionView : UIScrollView, UIDataSourceTranslating {

    public init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout)

    public init?(coder: NSCoder)

    open var collectionViewLayout: UICollectionViewLayout

    weak open var delegate: (any UICollectionViewDelegate)?

    weak open var dataSource: (any UICollectionViewDataSource)?

    @available(iOS 10.0, *)
    weak open var prefetchDataSource: (any UICollectionViewDataSourcePrefetching)?

    @available(iOS 10.0, *)
    open var isPrefetchingEnabled: Bool

    @available(iOS 11.0, *)
    weak open var dragDelegate: (any UICollectionViewDragDelegate)?

    @available(iOS 11.0, *)
    weak open var dropDelegate: (any UICollectionViewDropDelegate)?

    @available(iOS 11.0, *)
    open var dragInteractionEnabled: Bool

    @available(iOS 13.2, *)
    open var contextMenuInteraction: UIContextMenuInteraction? { get }

    @available(iOS 11.0, *)
    open var reorderingCadence: UICollectionView.ReorderingCadence

    @available(iOS 16.0, *)
    open var selfSizingInvalidation: UICollectionView.SelfSizingInvalidation

    open var backgroundView: UIView?

    open func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String)

    open func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)

    open func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String)

    open func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String)

    open func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell

    open func dequeueReusableSupplementaryView(ofKind elementKind: String, withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionReusableView

    open var allowsSelection: Bool

    open var allowsMultipleSelection: Bool

    open var indexPathsForSelectedItems: [IndexPath]? { get }

    open func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition)

    open func deselectItem(at indexPath: IndexPath, animated: Bool)

    @available(iOS 11.0, *)
    open var hasUncommittedUpdates: Bool { get }

    open func reloadData()

    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool)

    @available(iOS 7.0, *)
    open func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool, completion: ((Bool) -> Void)? = nil)

    @available(iOS 7.0, *)
    open func startInteractiveTransition(to layout: UICollectionViewLayout, completion: UICollectionView.LayoutInteractiveTransitionCompletion? = nil) -> UICollectionViewTransitionLayout

    @available(iOS 7.0, *)
    open func finishInteractiveTransition()

    @available(iOS 7.0, *)
    open func cancelInteractiveTransition()

    open var numberOfSections: Int { get }

    open func numberOfItems(inSection section: Int) -> Int

    open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

    open func layoutAttributesForSupplementaryElement(ofKind kind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes?

    open func indexPathForItem(at point: CGPoint) -> IndexPath?

    open func indexPath(for cell: UICollectionViewCell) -> IndexPath?

    //\/ Gets the index path of the specified supplementary view.
    //\/ @param supplementaryView The supplementary or decoration view whose index path you want.
    //\/ @return The index path of the specified view if it is in the collection view, else `nil`.
    open func indexPath(forSupplementaryView supplementaryView: UICollectionReusableView) -> IndexPath?

    open func cellForItem(at indexPath: IndexPath) -> UICollectionViewCell?

    open var visibleCells: [UICollectionViewCell] { get }

    open var indexPathsForVisibleItems: [IndexPath] { get }

    @available(iOS 9.0, *)
    open func supplementaryView(forElementKind elementKind: String, at indexPath: IndexPath) -> UICollectionReusableView?

    @available(iOS 9.0, *)
    open func visibleSupplementaryViews(ofKind elementKind: String) -> [UICollectionReusableView]

    @available(iOS 9.0, *)
    open func indexPathsForVisibleSupplementaryElements(ofKind elementKind: String) -> [IndexPath]

    open func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool)

    open func insertSections(_ sections: IndexSet)

    open func deleteSections(_ sections: IndexSet)

    open func moveSection(_ section: Int, toSection newSection: Int)

    open func reloadSections(_ sections: IndexSet)

    open func insertItems(at indexPaths: [IndexPath])

    open func deleteItems(at indexPaths: [IndexPath])

    open func moveItem(at indexPath: IndexPath, to newIndexPath: IndexPath)

    open func reloadItems(at indexPaths: [IndexPath])

    @available(iOS 15.0, *)
    open func reconfigureItems(at indexPaths: [IndexPath])

    open func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil)

    @available(iOS 9.0, *)
    open func beginInteractiveMovementForItem(at indexPath: IndexPath) -> Bool

    @available(iOS 9.0, *)
    open func updateInteractiveMovementTargetPosition(_ targetPosition: CGPoint)

    @available(iOS 9.0, *)
    open func endInteractiveMovement()

    @available(iOS 9.0, *)
    open func cancelInteractiveMovement()

    @available(iOS 9.0, *)
    open var remembersLastFocusedIndexPath: Bool

    //\/ When enabled, the collection view ensures that selection is automatically triggered when focus moves to a cell.
    //\/ Defaults to a system derived value based on platform and other properties of the collection view.
    @available(iOS 14.0, *)
    open var selectionFollowsFocus: Bool

    //\/ Determines if the collection view allows its cells to become focused.
    //\/ When collectionView:canFocusItemAtIndexPath: is implemented, its return value takes precedence over this method.
    //\/ Defaults to a system derived value based on platform and other properties of the collection view.
    @available(iOS 15.0, *)
    open var allowsFocus: Bool

    //\/ Determines if the collection view allows its cells to become focused while editing.
    //\/ When collectionView:canFocusItemAtIndexPath: is implemented, its return value takes precedence over this method.
    //\/ Defaults to a system derived value based on platform and other properties of the collection view.
    @available(iOS 15.0, *)
    open var allowsFocusDuringEditing: Bool

    @available(iOS 11.0, *)
    open var hasActiveDrag: Bool { get }

    @available(iOS 11.0, *)
    open var hasActiveDrop: Bool { get }

    @available(iOS 14.0, *)
    open var isEditing: Bool

    @available(iOS 14.0, *)
    open var allowsSelectionDuringEditing: Bool

    @available(iOS 14.0, *)
    open var allowsMultipleSelectionDuringEditing: Bool
}

@available(iOS 14.0, tvOS 14.0, *)
extension UICollectionView {

    public struct CellRegistration<Cell, Item> where Cell : UICollectionViewCell {

        public typealias Handler = (_ cell: Cell, _ indexPath: IndexPath, _ itemIdentifier: Item) -> Void

        public init(handler: @escaping UICollectionView.CellRegistration<Cell, Item>.Handler)

        @available(visionOS, introduced: 1.0, deprecated: 1.0, message: \"Loading Interface Builder products will not be supported in a future version of visionOS.\")
        public init(cellNib: UINib, handler: @escaping UICollectionView.CellRegistration<Cell, Item>.Handler)
    }

    public struct SupplementaryRegistration<Supplementary> where Supplementary : UICollectionReusableView {

        public typealias Handler = (_ supplementaryView: Supplementary, _ elementKind: String, _ indexPath: IndexPath) -> Void

        public init(elementKind: String, handler: @escaping UICollectionView.SupplementaryRegistration<Supplementary>.Handler)

        @available(visionOS, introduced: 1.0, deprecated: 1.0, message: \"Loading Interface Builder products will not be supported in a future version of visionOS.\")
        public init(supplementaryNib: UINib, elementKind: String, handler: @escaping UICollectionView.SupplementaryRegistration<Supplementary>.Handler)
    }

    @MainActor @preconcurrency public func dequeueConfiguredReusableCell<Cell, Item>(using registration: UICollectionView.CellRegistration<Cell, Item>, for indexPath: IndexPath, item: Item?) -> Cell where Cell : UICollectionViewCell

    @MainActor @preconcurrency public func dequeueConfiguredReusableSupplementary<Supplementary>(using registration: UICollectionView.SupplementaryRegistration<Supplementary>, for indexPath: IndexPath) -> Supplementary where Supplementary : UICollectionReusableView
}

extension UICollectionView : UISpringLoadedInteractionSupporting {
}

@available(iOS 11.0, *)
@MainActor public protocol UICollectionViewDragDelegate : NSObjectProtocol {

    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: any UIDragSession, at indexPath: IndexPath) -> [UIDragItem]

    optional func collectionView(_ collectionView: UICollectionView, itemsForAddingTo session: any UIDragSession, at indexPath: IndexPath, point: CGPoint) -> [UIDragItem]

    optional func collectionView(_ collectionView: UICollectionView, dragPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters?

    optional func collectionView(_ collectionView: UICollectionView, dragSessionWillBegin session: any UIDragSession)

    optional func collectionView(_ collectionView: UICollectionView, dragSessionDidEnd session: any UIDragSession)

    optional func collectionView(_ collectionView: UICollectionView, dragSessionAllowsMoveOperation session: any UIDragSession) -> Bool

    optional func collectionView(_ collectionView: UICollectionView, dragSessionIsRestrictedToDraggingApplication session: any UIDragSession) -> Bool
}

@available(iOS 11.0, *)
@MainActor public protocol UICollectionViewDropDelegate : NSObjectProtocol {

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: any UICollectionViewDropCoordinator)

    optional func collectionView(_ collectionView: UICollectionView, canHandle session: any UIDropSession) -> Bool

    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidEnter session: any UIDropSession)

    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: any UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal

    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidExit session: any UIDropSession)

    optional func collectionView(_ collectionView: UICollectionView, dropSessionDidEnd session: any UIDropSession)

    optional func collectionView(_ collectionView: UICollectionView, dropPreviewParametersForItemAt indexPath: IndexPath) -> UIDragPreviewParameters?
}

extension UICollectionViewDropProposal {

    @available(iOS 11.0, *)
    public enum Intent : Int, @unchecked Sendable {

        case unspecified = 0

        case insertAtDestinationIndexPath = 1

        case insertIntoDestinationIndexPath = 2
    }
}

@available(iOS 11.0, *)
@MainActor open class UICollectionViewDropProposal : UIDropProposal {

    public init(operation: UIDropOperation, intent: UICollectionViewDropProposal.Intent)

    open var intent: UICollectionViewDropProposal.Intent { get }
}

@available(iOS 11.0, *)
@MainActor public protocol UICollectionViewDropCoordinator : NSObjectProtocol {

    var items: [any UICollectionViewDropItem] { get }

    var destinationIndexPath: IndexPath? { get }

    var proposal: UICollectionViewDropProposal { get }

    var session: any UIDropSession { get }

    func drop(_ dragItem: UIDragItem, to placeholder: UICollectionViewDropPlaceholder) -> any UICollectionViewDropPlaceholderContext

    func drop(_ dragItem: UIDragItem, toItemAt indexPath: IndexPath) -> any UIDragAnimating

    func drop(_ dragItem: UIDragItem, intoItemAt indexPath: IndexPath, rect: CGRect) -> any UIDragAnimating

    func drop(_ dragItem: UIDragItem, to target: UIDragPreviewTarget) -> any UIDragAnimating
}

@available(iOS 11.0, *)
@MainActor open class UICollectionViewPlaceholder : NSObject {

    public init(insertionIndexPath: IndexPath, reuseIdentifier: String)

    open var cellUpdateHandler: ((UICollectionViewCell) -> Void)?
}

@available(iOS 11.0, *)
@MainActor open class UICollectionViewDropPlaceholder : UICollectionViewPlaceholder {

    open var previewParametersProvider: ((UICollectionViewCell) -> UIDragPreviewParameters?)?
}

@available(iOS 11.0, *)
@MainActor public protocol UICollectionViewDropItem : NSObjectProtocol {

    var dragItem: UIDragItem { get }

    var sourceIndexPath: IndexPath? { get }

    var previewSize: CGSize { get }
}

@available(iOS 11.0, *)
@MainActor public protocol UICollectionViewDropPlaceholderContext : UIDragAnimating {

    var dragItem: UIDragItem { get }

    func commitInsertion(dataSourceUpdates: (IndexPath) -> Void) -> Bool

    func deletePlaceholder() -> Bool

    func setNeedsCellUpdate()
}

,
extension UICollectionView: Chainable {}
