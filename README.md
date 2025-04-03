# Diamond Catalog

A Flutter application designed to manage a diamond catalog with advanced filtering, sorting, and cart management features.

---

## Key Features

- **Advanced Filtering**: Filter diamonds by carat weight, lab, shape, color, and clarity.
- **Sorting Options**: Sort diamonds by price or carat weight in ascending or descending order.
- **Shopping Cart**: Add diamonds to the cart, view totals, and summaries.
- **Theme Switching**: Toggle between light and dark themes.

---

## Project Overview

The project is structured using a clean architecture approach, ensuring modularity and scalability.

### Core
- **Theme**: Manages light and dark theme configurations.

### Data
- **Models**: Defines the `Diamond` model.
- **Data**: Contains the diamond dataset.

### Logic
- **Blocs**: Implements state management using the BLoC pattern.
  - **ThemeBloc**: Handles theme toggling (light/dark).
  - **CartBloc**: Manages shopping cart operations.
  - **DiamondFilterBloc**: Handles diamond filtering logic.
  - **DiamondSortBloc**: Manages sorting functionality.

### Presentation
- **Screens**: Contains the main UI screens.
  - **FilterPage**: Provides filtering options for diamonds.
  - **ResultPage**: Displays filtered diamonds with sorting options.
  - **CartPage**: Shows cart items and summary details.
- **Widgets**: Reusable UI components.
  - **DiamondCard**: Displays diamond details in a card format.
  - **CartSummaryCard**: Shows cart summary and statistics.
  - **SortOptionsDialog**: Dialog for selecting sorting preferences.

---

## Getting Started

Follow these steps to set up and run the application:

1. Ensure Flutter is installed (version `3.27.3` or newer).
2. Clone this repository:
   ```bash
   git clone <repository-url>
3. Run `flutter pub get` to install dependencies
4. Run `flutter run` to start the application

## Dependencies

- `flutter_bloc`: For state management
- `equatable`: For value comparison in state management
- `hydrated_bloc`: For state persistence in blocs
- `path_provider`: For accessing the file system



## Flutter Version 
- `Flutter`: 3.27.3
- `Dart`: 3.6.1