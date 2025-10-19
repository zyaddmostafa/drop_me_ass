# Drop Me 🌱♻️

A Flutter mobile app for recycling plastic bottles through Reverse Vending Machines (RVMs). Scan QR codes, earn points, and redeem rewards.

---

## 📱 Features

- Home dashboard with points balance and nearby RVMs
- QR code scanning with smooth animations
- Rewards marketplace with category filtering
- Points-based reward redemption system
- Skeleton loading states for better UX

---

## 🚀 Setup Instructions

### Prerequisites
- Flutter SDK 3.9.2+
- Android Emulator / iOS Simulator / Physical Device

### Installation

```bash
# Clone repository
git clone <repository-url>
cd drop_me_ass

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### Project Structure
```
lib/
├── core/
│   ├── di/                 # Dependency injection (GetIt setup)
│   ├── helpers/            # Extension methods & utilities
│   ├── routing/            # App navigation & routes
│   ├── theme/              # Colors & text styles
│   └── widgets/            # Reusable UI components
├── features/
│   ├── home/
│   │   ├── data/
│   │   │   ├── models/     # User & RVM models
│   │   │   └── repo/       # RVM repository
│   │   └── ui/
│   │       ├── cubit/      # User data & home state
│   │       ├── screens/    # Home screen
│   │       └── widgets/    # Home UI components
│   ├── qr_scan/
│   │   ├── cubit/          # QR scanning state management
│   │   └── ui/
│   │       ├── screen/     # Scanning & confirmation screens
│   │       └── widgets/    # QR scanning UI components
│   ├── rewards/
│   │   ├── data/
│   │   │   ├── models/     # Reward models
│   │   │   └── repo/       # Rewards repository
│   │   └── ui/
│   │       ├── cubit/      # Rewards state management
│   │       ├── screen/     # Reward list & details screens
│   │       └── widgets/    # Reward UI components
│   └── navigation/
│       └── ui/             # Bottom navigation bar
├── drop_me_app.dart        # Main app widget
├── main.dart               # App entry point
└── my_bloc_observer.dart   # BLoC event observer
```

---

## 🏗️ Technical Choices

**State Management:** Flutter BLoC (Cubit pattern)
- Clean separation of UI and business logic
- Predictable state management
- Easy to test

**Architecture:** Feature-based
- Self-contained modules
- Scalable and maintainable

**Key Libraries:**
- `flutter_bloc` - State management
- `get_it` - Dependency injection
- `flutter_screenutil` - Responsive UI
- `google_fonts` - Typography
- `skeletonizer` - Loading states

---

## 🎯 Challenges

### QR Scanning Simulation with Animation

**Challenge:** Creating a realistic QR scanning experience without actual camera integration.

**Solution:**
- Implemented `AnimationController` with 2-second duration
- Used `Tween<double>` (-1.0 to 1.0) for smooth vertical scanning line movement
- Applied `Curves.easeInOut` with `repeat(reverse: true)` for continuous scanning effect
- Synchronized animation with BLoC state changes (loading → scanning → success/error)

**Key Issues Solved:**
- Animation lifecycle management (proper disposal)
- State coordination between animation and Cubit
- Balancing animation speed for realistic UX
- Retry mechanism with animation reset

**Result:** Realistic scanning simulation without camera permissions, ideal for demos.

---

## 🔮 Future Improvements

If given more time, these features would enhance the app:

- **Real QR Scanning** - Integrate camera with `mobile_scanner` package
- **Backend Integration** - REST API/Firebase for real-time data sync
- **Real-time Point System** - Live point updates and transaction syncing across devices
- **User Authentication** - Login system with OAuth or Firebase Auth
- **Gamification** - Achievements, leaderboards, and daily challenges

---

## 🎬 Demo Video

https://github.com/user-attachments/assets/4643e94a-4328-40ee-9300-844989b8cb9c

> **Note:** Video should be max 2 minutes showing:
> - Home screen navigation
> - QR scanning animation
> - Confirmation flow
> - Rewards browsing and redemption

---

## 📄 License

This project is for educational/demonstration purposes.
