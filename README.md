<div align="center">

# 📰 Tech Tinder

### Swipe. Discover. Personalize.

A Tinder-inspired **Flutter** news application that personalizes your feed based on your swipe preferences.

<img width="320" alt="Tech Tinder" src="https://github.com/user-attachments/assets/bc88012c-c9e5-4a56-914d-e5e5cff936b4" />
<img width="1792" height="1120" alt="2026-07-07_20-46-24" src="https://github.com/user-attachments/assets/510c843a-a5ca-4224-b734-0919f48fc7ef" />
<img width="1792" height="1120" alt="2026-07-07_20-46-36" src="https://github.com/user-attachments/assets/31cfabd4-0925-48cf-8c89-54f95d09dd70" />


<br>

![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)
![Platform](https://img.shields.io/badge/Platform-Android-success)
![License](https://img.shields.io/badge/License-MIT-green)

</div>

---

## ✨ Overview

**Tech Tinder** transforms traditional news browsing into a swipe-based experience.

Instead of scrolling endlessly, simply:

- ❤️ **Swipe Right** → Get more articles related to your interests.
- ❌ **Swipe Left** → Reduce recommendations from similar sources.

The recommendation engine continuously adapts to your preferences, making every swipe smarter than the last.

---

## 🚀 Features

- 📰 Real-time technology news
- ❤️ Swipe-based personalization
- 🧠 Lightweight recommendation engine
- 📖 Scrollable article cards
- 🌐 Open full articles in browser
- ♾️ Infinite news feed
- ⚡ Smooth Tinder-style card animations
- 🖼️ Cached network images for faster loading

---

## 🏗 Tech Stack

| Technology | Purpose |
|------------|---------|
| 💙 Flutter | Cross-platform UI |
| 🎯 Dart | Programming Language |
| 🌍 NewsAPI | News Provider |
| 🃏 flutter_card_swiper | Swipe Experience |
| 🖼 cached_network_image | Image Caching |
| 🔗 url_launcher | Open Articles |

---

# 📱 App Flow

```text
                ❤️ Swipe Right
                       │
                       ▼
           Extract Article Keywords
                       │
                       ▼
        Recommend Similar News Articles


                ❌ Swipe Left
                       │
                       ▼
           Reduce Similar Recommendations
```

---

## 🚀 Getting Started

### Clone the repository

```bash
git clone https://github.com/rajkumar1325/Tech-Tinder.git
cd Tech-Tinder
```

### Install dependencies

```bash
flutter pub get
```

### Configure NewsAPI

Create a free API key from

```
https://newsapi.org/register
```

Replace the key inside:

```text
lib/services/news_service.dart
```

### Run

```bash
flutter run
```

---

## 📦 Download

Download the latest Android APK from the **Releases** section.

👉 **Latest Release**

*(Add the release link after publishing.)*

---

## 🧠 Recommendation Logic

Unlike traditional feeds, recommendations evolve through user interaction.

| Action | Behavior |
|---------|----------|
| ❤️ Swipe Right | Extracts keywords from liked articles and fetches similar news |
| ❌ Swipe Left | Reduces future recommendations from that source |

This creates a lightweight preference-based recommendation system without requiring user accounts or machine learning.

---

## ⚠️ Notes

- NewsAPI Free Plan is intended for development and demonstration purposes.
- If recommendation requests fail or rate limits are reached, the app gracefully falls back to the latest technology headlines.

---

## 🔮 Roadmap

- [ ] Dark Mode
- [ ] Bookmarks
- [ ] AI-powered recommendations
- [ ] Multiple news categories
- [ ] User authentication
- [ ] Push notifications
- [ ] Offline reading

---

<div align="center">

### ⭐ If you found this project interesting, consider giving it a star!

It helps others discover the project and motivates future improvements.

</div>





## 📥 Live Demo

📱 Download APK
👉 https://github.com/rajkumar1325/Tech-Tinder/releases/latest
