# Refreshable Widget

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)
[![License: MIT][license_badge]][license_link]

Refreshable widget

## Goal 🏹
Refreshable Widget built for these two Stackoverflow issues, and also for my personal usage.
https://stackoverflow.com/q/72025771
https://stackoverflow.com/q/66539533

Possible use case:
You have a widget you use with FutureBuilder, shows an async data. But you need to update it periodically because there's no socket or stream that you can listen to.
For example a progress for user in a game, which requires you to fetch whole game periodically, like every 20 seconds.

## Installation 💻

**❗ In order to start using Refreshable Widget you must have the [Flutter SDK][flutter_install_link] installed on your machine.**

Add `refreshable_builder` to your `pubspec.yaml`:

```yaml
dependencies:
  refreshable_builder:
```

Install it:

```sh
flutter packages get
```

---

## Usage 🛞
```dart
/// pass the type, [num] in below, which is a return type for [refreshCall] and [value] in [builder]
RefreshableWidget<num>(
  // optional initial value if you have
  initialValue: challenge.userParticipation!.donePercent,
  // your API call or logic to refresh
  refreshCall: () async {
    final challenge = await cadoo.getChallenge(id: widget.challengeId); 
    return challenge.userParticipation!.donePercent;
   },
  refreshRate: const Duration(seconds: 20),
  builder: (context, value) {
    return ProgressWidget(
      percent: value,
    );
  },
  // optional error and loading widgets
),
```



[flutter_install_link]: https://docs.flutter.dev/get-started/install
[github_actions_link]: https://docs.github.com/en/actions/learn-github-actions
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[logo_black]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_black.png#gh-light-mode-only
[logo_white]: https://raw.githubusercontent.com/VGVentures/very_good_brand/main/styles/README/vgv_logo_white.png#gh-dark-mode-only
[mason_link]: https://github.com/felangel/mason
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://pub.dev/packages/very_good_cli
[very_good_coverage_link]: https://github.com/marketplace/actions/very-good-coverage
[very_good_ventures_link]: https://verygood.ventures
[very_good_ventures_link_light]: https://verygood.ventures#gh-light-mode-only
[very_good_ventures_link_dark]: https://verygood.ventures#gh-dark-mode-only
[very_good_workflows_link]: https://github.com/VeryGoodOpenSource/very_good_workflows
