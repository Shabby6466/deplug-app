[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)

# DePlug (Project Structure Only)

DePlug is a **decentralized energy management system** built using **Flutter**.  
> _⚠️ This version is redacted for portfolio purposes. All client-sensitive code, APIs, and business logic have been removed._

This repository is intended to showcase the **folder structure**, **build environment setup**, and my **code organization practices** for Flutter-based production apps.

---

## 🚧 What's Included

- Clean modular folder layout
- Environment-based build system (`prod`, `development`)
- Sample main entry points for each flavor
- CI-ready structure for scalable Flutter apps
-  Modular architecture for scalable development
- Dependency Injection (DI) structure with `di.config.dart`, `register_modules.dart`
- Isolated network layer using `dio_wrapper`
- Folder-based separation of:
  - `datasources`, `repository`, `usecases`
  - `wallet_adapter_service`, `permissions`, and `l10n`
- Strong use of reusable **widgets** and **utils**
- Environment-specific configuration using `base_env.dart`
- Custom routing with `go_router`


---

## ❌ What's Removed (for confidentiality)

- Business logic, UI code, API calls
- Client assets, endpoints, auth flows
- Actual functionality (this is not a runnable app)

---

## 🚀 Tech Stack

- **Flutter** (Stable Channel)
- **Dart**
- **Flavor-based environment config**
- **Lint** for code consistency ([package](https://pub.dev/packages/lint))

---

## 📂 Folder Overview

