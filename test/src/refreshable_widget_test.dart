// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:refreshable_widget/refreshable_widget.dart';

void main() {
  group('RefreshableWidget', () {
    test('can be instantiated', () {
      expect(
        RefreshableWidget<int>(
          refreshCall: () async {
            await Future<void>.delayed(const Duration(seconds: 2));
            return 5;
          },
          builder: (BuildContext context, value) {
            return Text('$value');
          },
        ),
        isNotNull,
      );
    });
  });
}
