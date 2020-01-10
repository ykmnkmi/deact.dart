part of deact;

class _DeactInstance {
  final String selector;
  final Node rootNode;
  final Logger logger;
  final Map<_TreeLocation, ComponentRenderContext> contexts = {};

  _DeactInstance(this.selector, this.rootNode) : logger = Logger('deact.$selector');
}