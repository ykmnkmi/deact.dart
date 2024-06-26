import 'dart:async';

import 'package:deact/deact.dart';
import 'package:deact/deact_html52.dart';

void main() {
  deact('#root', (_) {
    return fc(
      (ctx) {
        final asc = ctx.state('asc', true);
        final counters = ctx.state('counter', [
          // components without a key lose its state if moved inside a list (thus inside the DOM)
          counter('1', 1, null),
          counter('2', -1, null),
          counter('3', 10, 'key1'),
          counter('4', -10, 'key2'),
        ]);

        return div(children: [
          ...(asc.value ? counters.value : counters.value.reversed),
          button(
            onclick: (_) => asc.value = !asc.value, // toggle the list direction
            children: [
              txt('Toggle Direction (index 1 and 2 lose their state)')
            ],
          ),
        ]);
      },
    );
  });
}

DeactNode counter(String index, int delta, String? key) {
  return fc((ctx) {
    final counter = ctx.state('counter', 0);

    ctx.effect('init', () {
      Timer.periodic(
        Duration(seconds: 1),
        (_) => counter.value = counter.value + delta,
      );
      return null;
    }, dependsOn: []);

    return div(key: index, children: [txt('$index: ${counter.value}')]);
  }, key: key);
}
