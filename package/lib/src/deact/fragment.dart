part of deact;

/// A [FragmentNode] is a [DeactNode] with no content except its
/// children.
///
/// You can wrap a list of nodes into a fragment and use
/// the fragment where only a single node is applicable.
class FragmentNode extends DeactNode {
  final Iterable<Object> _children;

  FragmentNode._(this._children) : super._();
}

/// Creates a [Fragement] node with the given [children].
FragmentNode fragment(Iterable<Object> children) {
  return FragmentNode._(children);
}

/// A [FragmentNode] with no children nodes. Renders nothing
/// to the DOM. This is an alternative to providing [null].
FragmentNode empty() => FragmentNode._(<Object>[]);
