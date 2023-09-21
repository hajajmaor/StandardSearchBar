# Standard SearchBar

A simple and very customizable search bar widget for Flutter.

<table>
  <tr>
    <th>Preview</th>
    <th>Code</th>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/ManelRosPuig/StandardSearchBar/main/images/Standard%20SearchBar%202.0.gif"></td>
    <td><img src="https://raw.githubusercontent.com/ManelRosPuig/StandardSearchBar/main/images/Standard%20SearchBar%202.0%20Code.png"></td>
  </tr>
</table>

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
  standard_searchbar: ^2.0.0
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
  width: 360,
  suggestions: [
    'apple',
    'banana',
    'melon',
    'orange',
    'pineapple',
    'strawberry',
    'watermelon'
  ],
),
```

## Contributing

Contributions are welcome! Please fork the repository and open a pull request with your changes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
