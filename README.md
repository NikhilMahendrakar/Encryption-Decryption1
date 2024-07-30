# Encryption/Decryption Flutter Application

This repository contains a Flutter application that demonstrates text and PDF file encryption and decryption using the AES algorithm. The app provides functionality for encrypting and decrypting text inputs and PDF files.

## Introduction

This application allows users to encrypt and decrypt text and PDF files using AES encryption. The app provides a simple user interface to enter text, encrypt it, and decrypt it back to the original form. For larger text files, the application supports converting them to PDF format and performing encryption/decryption on the PDF files.

## Features

- **Text Encryption/Decryption**: Encrypt and decrypt text inputs.
- **PDF Encryption/Decryption**: Encrypt and decrypt PDF files.
- **Permission Handling**: Request and handle storage permissions for file operations.

## Installation

To run this project locally, follow these steps:

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/encryption_app.git
    cd encryption_app
    ```

2. **Install Flutter**: If you haven't already, install Flutter by following the instructions on the [official Flutter website](https://flutter.dev/docs/get-started/install).

3. **Install dependencies**:
    ```sh
    flutter pub get
    ```

4. **Run the application**:
    ```sh
    flutter run
    ```

## Usage

### Encrypting Text

1. Enter the text you want to encrypt in the text field.
2. Click the "Encrypt" button to encrypt the text.
3. The encrypted text will be displayed in the dialog.

### Decrypting Text

1. After encrypting text, click the "Decrypt" button to decrypt the text back to its original form.
2. The decrypted text will be displayed in the dialog.

### Encrypting PDF Files

1. Click the "Encrypt PDF files" button to navigate to the PDF encryption page.
2. Click the "Encrypt & Download" button to download and encrypt the PDF file from the given URL.
3. The encrypted PDF file will be saved in the specified directory.

### Decrypting PDF Files

1. Click the "Decrypt file" button to decrypt the previously encrypted PDF file.
2. The decrypted PDF file will be saved in the specified directory.


### Main Files

- `main.dart`: Entry point of the application. Sets up the main widget and home screen.
- `my_encryption.dart`: Contains the logic for encrypting and decrypting text using AES encryption.
- `pdfencryption.dart`: Contains the logic for encrypting and decrypting PDF files and handling file operations.

## Contributing

Contributions are welcome! If you would like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/your-feature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/your-feature`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

Feel free to adjust any section as needed. This README file provides a comprehensive overview of the project, including installation steps, usage instructions, and a brief description of the main files and features.


