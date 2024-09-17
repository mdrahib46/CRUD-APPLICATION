# CRUD App

This is a simple Flutter-based CRUD (Create, Read, Update, Delete) application that allows users to manage products. The app interacts with a backend server to perform CRUD operations on a product database.

## Features

- **Create Products**: Add new products with details such as name, code, unit price, quantity, and total price.
- **Read Products**: View a list of all the products.
- **Update Products**: Modify the details of existing products.
- **Delete Products**: Remove a product from the list.

## Project Structure

```
├── lib
│   ├── models
│   │   └── product.dart            # Defines the Product model
│   ├── screens
│   │   ├── add_new_productScreen.dart  # Screen for adding a new product
│   │   ├── productlist_scrren.dart     # Screen displaying list of products
│   │   └── update_product_Screen.dart  # Screen for updating an existing product
│   ├── widgets
│   │   └── product_item.dart       # Widget to display individual product item
│   └── app.dart                    # Main app widget
├── main.dart                       # Application entry point
├── pubspec.yaml                    # Project configuration and dependencies
```

## Getting Started

### Prerequisites

To run this project, you need to have Flutter installed. If Flutter is not installed on your machine, follow the instructions [here](https://flutter.dev/docs/get-started/install).

### Installation

1. Clone this repository:

```bash
git clone https://github.com/your-username/crudapp.git
```

2. Navigate to the project directory:

```bash
cd crudapp
```

3. Install the required dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

### Backend Setup

The application interacts with a REST API hosted at `http://164.68.107.70:6060/api/v1/`. Ensure that this API is running and accessible.

API endpoints used in this project:

- `GET /api/v1/ReadProduct`: Fetches the list of products.
- `POST /api/v1/CreateProduct`: Creates a new product.
- `POST /api/v1/UpdateProduct/{id}`: Updates an existing product.
- `GET /api/v1/DeleteProduct/{id}`: Deletes a product.

### Screens
1. **Product List Screen**: Displays the list of products and allows navigation to add or update products.
# ![homescreen](https://github.com/user-attachments/assets/e73723ab-dcd4-476d-8f0a-b2ca8d34533a)
2. **Add Product Screen**: Lets users input new product information.
# ![add product Screen](https://github.com/user-attachments/assets/c4d50d57-0aff-4ffb-8e70-4c8449216a18)
3. **Update Product Screen**: Allows editing of an existing product's details.
# ![update product screen](https://github.com/user-attachments/assets/cba5ab39-3c8c-4c0c-96bf-1eff96f9f881)
4. **Delete Product Screen**: Allows deleting of a product which you want to delete.
# ![delete product screen](https://github.com/user-attachments/assets/aedc1fa1-f288-4ee2-9348-921610c6c0f0)


### Widgets

- **ProductItem**: A reusable widget to display individual product details, along with edit and delete options.

## Dependencies

The project uses the following Flutter packages:

- `flutter/material.dart`: For building the user interface.
- `http`: For making HTTP requests to the REST API.
- `dart:convert`: For encoding and decoding JSON data.

## How It Works

1. When the app starts, the `ProductListScreen` fetches the product list from the server using the `_getProduct` method and displays it in a list.
2. The floating action button navigates to the `AddNewProductScreen`, where a user can input product details. Upon submission, the product is added to the server.
3. Users can update a product by tapping the "Edit" button in the product list, which navigates to the `UpdateProductScreen`.
4. The "Delete" button removes the selected product from the server after user confirmation.

## Error Handling

- API request failures are handled by showing appropriate messages to the user using `SnackBar`.
- Input validation is performed on form fields to ensure valid data entry.

## Future Improvements

- Implement user authentication.
- Add image upload functionality.
- Improve UI/UX design for better user interaction.



Thank you for using CRUD App!
