# Standard SearchBar

<!-- [![Pub Version](https://img.shields.io/pub/v/easy_search_bar.svg)](https://pub.dev/packages/easy_search_bar) -->
<!-- [![GitHub](https://img.shields.io/github/license/ManelRosPuig/StandardSearchBar)](https://github.com/ManelRosPuig/StandardSearchBar/blob/main/LICENSE) -->

A simple and customizable search bar widget for Flutter.

## Features

- Implement a search bar with ease.
- Customize the search bar's appearance:
  - Change the search icon.
  - Adjust size and color.
  - Personalize placeholder text.

## Installation

Add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  easy_search_bar: ^1.0.0
```

Then, run flutter pub get to install the package.

## Usage

Import the package:

```dart
import 'package:standard_searchbar/standard_searchbar.dart';
```

Create a `StandardSearchBar` widget:

```dart
StandardSearchBar(
  onChanged: (value) {
    // Handle search input change
  },
  onSubmitted: (value) {
    // Handle search submission
  },
),
```

## Examples

```dart
StandardSearchBar(
  width: MediaQuery.of(context).size.width * 0.9,
  backgroundColor: const Color(0xFF35404D),
  hintText: 'Search Packages',
  cursorColor: Colors.white,
  hintStyle: const TextStyle(color: Color(0xFF8d9399)),
  startIconSize: 16,
  startIconPaddingRight: 0,
  startIconColor: const Color(0xFF848B92),
  textStyle: const TextStyle(color: Colors.white),
),
```

## Contributing

Contributions are welcome! Please fork the repository and open a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.