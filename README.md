[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

# DePlug

DePlug is a decentralized energy management systesm.

## Installation

First you need to setup flutter on your system. This link will guide you how to do
that. [Install Flutter](https://flutter.dev/docs/get-started/install)

After install check if your installation is successful or not by running this command in terminal /
cmd.

```bash
flutter doctor -v
```

After setting up the environment clone this project to your desired location.

```bash
git clone https://bitbucket.org/rnssol/mobile-app.git
```

After cloning move to the installation folder and run

```bash
flutter clean
flutter pub get
```

Code setup is completed at this stage.

## Usage

We have four environments in our code

* Production
* Development

For building the android and iOS builds for each one of them is given below

**Production**

```bash
flutter build apk --flavor prod -t lib/main/prod.dart   // For android
flutter build ios --flavor prod -t lib/main/prod.dart   // For ios
```

**Development**

```bash
flutter build apk --flavor development -t lib/main/development.dart   // For android
flutter build ios --flavor development -t lib/main/development.dart   // For ios
```

## Running

**Production**

```bash
flutter run --flavor prod -t lib/main/prod.dart   
```

**Development**

```bash
flutter run --flavor development -t lib/main/development.dart   
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would
like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)