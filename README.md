# 📰 Tech Tinder ❤️

### Swipe Your Way Through Tech News

**Tech Tinder** reimagines the way you consume technology news. Instead of endlessly scrolling through a feed, simply **swipe left or right**—just like Tinder—and the app adapts to your interests.

> 🚀 Built with **Flutter**, powered by **NewsAPI**, and designed to make news discovery fun and personalized.


<img width="334" height="665" alt="2026-07-07_20-45-07" src="https://github.com/user-attachments/assets/bc88012c-c9e5-4a56-914d-e5e5cff936b4" />


---

## ✨ Features

🔥 **Real-Time Tech News**

* Stay updated with the latest technology headlines from **NewsAPI**.

❤️ **Swipe Right = Like**

* Enjoyed an article? Swipe right and the app fetches more news on similar topics using keyword-based recommendations.

❌ **Swipe Left = Dislike**

* Not interested? Swipe left to reduce articles from that news source in future recommendations.

📖 **Read Without Leaving the App**

* Every news card is fully scrollable, allowing you to read the article content directly inside the app.

🌐 **Open Original Article**

* Double-tap any card to instantly open the complete article in your browser.

♾️ **Infinite Swiping**

* The app automatically loads more articles as you swipe, ensuring a seamless experience.

🧠 **Personalized Experience**

* Your swipe history gradually influences the news you see, creating a simple yet effective recommendation system.

---

## 🛠️ Tech Stack

* 💙 Flutter
* 🎯 Dart
* 🌍 NewsAPI
* 🖼️ Cached Network Image
* 🔗 URL Launcher
* 🃏 Flutter Card Swiper

---

## 🚀 Getting Started

### 1️⃣ Get a Free NewsAPI Key

Visit **https://newsapi.org/register**

Create a free account and copy your API key.

> Free plan includes **100 API requests per day.**

---

### 2️⃣ Add Your API Key

Open:

```text
lib/services/news_service.dart
```

Replace:

```dart
YOUR_NEWSAPI_KEY_HERE
```

with your own NewsAPI key.

---

### 3️⃣ Run the Project

```bash
flutter pub get
flutter run
```

Or simply open the project in **Android Studio**, choose a device/emulator, and press **▶ Run**.

---

## 📱 How It Works

```
Swipe Right ❤️
        ↓
Extract Keywords
        ↓
Fetch Similar Articles

Swipe Left ❌
        ↓
Block News Source
        ↓
Show Fewer Articles From That Source
```

A lightweight recommendation engine keeps improving your feed based on your interactions.

---

## 📌 Important Notes

⚠️ The free **NewsAPI** plan is intended for development and demo projects only.

⚠️ If the API reaches its daily request limit, the app automatically falls back to fetching regular technology headlines, ensuring the experience remains uninterrupted.

⚠️ Make sure your Android app has Internet permission when building release APKs.

---

## 🌟 Future Improvements

* 🤖 AI-powered recommendation engine
* 🔐 User authentication
* ☁️ Cloud sync for preferences
* 🌙 Dark Mode
* 🔖 Save & Bookmark articles
* 🔍 Smart Search
* 📂 Multiple news categories
* 🔔 Push notifications

---

## ⭐ If you like this project...

Please consider giving it a **⭐ Star** on GitHub—it helps others discover the project and motivates future improvements!
