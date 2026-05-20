# Multi-Session AI Chatbot (Local-First Architecture)

A robust Flutter application showcasing clean architecture, offline-first local data caching, and reactive state
management. The app integrates with a multimodal Large Language Model (LLM) via OpenRouter to support dual text and
image inputs while seamlessly backing up application state to the cloud.

---

## 🛠 Architecture Overview

This project strictly adheres to a **Layered Clean Architecture** combined with a **Repository Pattern**. This
guarantees a strict separation of concerns, compile-time type safety, and makes the codebase highly testable and
maintainable.

```
┌────────────────────────────────────────────────────────┐
│                    UI Layer (Views)                    │
│           (Stateless & Consumer Widgets)               │
└───────────────────────────┬────────────────────────────┘
                            │ Watches/Reads State
                            ▼
┌────────────────────────────────────────────────────────┐
│          State Management Layer (Riverpod)             │
│            (Notifiers & AsyncNotifier)                 │
└───────────────────────────┬────────────────────────────┘
                            │ Invokes Business Logic
                            ▼
┌────────────────────────────────────────────────────────┐
│                   Repository Layer                     │
│         (Data Coordination & Orchestration)            │
└───────────────────────────┬────────────────────────────┘
                            │
              ┌─────────────┴─────────────┐
              ▼                           ▼
┌───────────────────────────┐┌───────────────────────────┐
│     Local Data Source     ││    Remote Data Source     │
│  (Sembast Document Store) ││   (Firebase/OpenRouter)   │
└───────────────────────────┘└───────────────────────────┘
```

---

## 🚀 Key Engineering Highlights

### ⚡ Reactive State Management (Riverpod)

* Implemented unidirectional data flow utilizing **Riverpod (Notifiers and AsyncNotifiers)**.
* Decoupled UI components entirely from business logic, ensuring widgets only rebuild when their targeted data streams
  update.
* Managed complex multi-layered loading and error processing states uniformly across async network boundaries.

### 🤖 Multimodal LLM Integration (OpenRouter)

* Streamlined communication with reasoning LLMs via **OpenRouter SDK**, supporting both **Text** and **Image**
  multimodal payloads within a single model context.
* Structured data transformation layers to map raw user inputs and image attachments into deterministic JSON payloads
  required by the LLM gateway.

### 🔐 Secure Authentication & Firebase Integration

* Built a reliable user onboarding experience using **Firebase Auth** with **Google Sign-In**.
* Integrated **Cloud Firestore** for secure, user-scoped document management, utilizing server-side timestamps to
  prevent clock-skew errors during cross-device synchronization.

### 💾 Local-First Data Persistence

* Designed an offline-first storage architecture using **Sembast** as a local embedded document database.
* All conversations, context, and configurations are cached instantly to disk, ensuring zero interface lag and immediate
  app readiness upon launch.

### ☁️ Robust Backup & Restore Mechanics

* Built an idempotent data synchronization pipeline allowing users to back up their local histories and restore them
  seamlessly onto new devices.
* **Defensive UX Engineering:** Designed isolated async sequence flows using state guards (`context.mounted`) and
  synchronous result-passing to eliminate navigation stack race conditions and hanging progress bars entirely.

---

## 📈 Planned Roadmap

To further expand the application into a commercially complete digital product, the following infrastructure additions
are under active development:

* **🌐 Native Localization (i18n):** Migrating hardcoded system strings into an automated type-safe localization
  pipeline (`flutter_localizations`) using `.arb` templates to provide full multi-language capabilities.
* **💰 Monetization & Ad Integration:** Integrating a non-intrusive mobile advertising framework (Google Mobile Ads SDK)
  to implement adaptive banner placements and rewarded session tokens without disrupting user core chat workspaces.

---

## 📦 Tech Stack & Libraries

* **Framework:** Flutter (Dart)
* **State Management:** Flutter Riverpod / Riverpod Generator
* **Database (Local):** Sembast (NoSQL Embedded Database)
* **Backend BaaS:** Firebase Auth, Cloud Firestore, Cloud Functions
* **AI Engine Gateway:** OpenRouter SDK