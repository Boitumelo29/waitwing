# WaitWing

**WaitWing** is a queueing system application tailored for business owners. It streamlines client management, business onboarding, and scheduling — making it easier to organize and optimize your business operations.

---

## Features

- **Client Management** — Add and manage clients efficiently.
- **Business Onboarding** — Seamlessly onboard your business onto the platform.
- **Timetable Blocking** — Block out time slots to manage appointments and prevent overbooking.
- **Queue System** — Organize and monitor real-time client queues.

---

## Tech Stack

- **Flutter** — Cross-platform mobile app development
- **Supabase** — Backend-as-a-Service (auth, database, and real-time)
- **BLoC** — Scalable and testable state management
- **`.env`** — Secure environment variable management

---

## Getting Started

### Prerequisites

- [Flutter](https://docs.flutter.dev/get-started/install)
- A [Supabase](https://supabase.com) account

---

### 🔧 Setup

1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/waitwing.git
   cd waitwing

2. **Install dependencies**  
```
flutter pub get

```
3. **Configure environment variables**  
Create a .env file in the root directory and add your Supabase credentials:
```
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your_supabase_anon_key

```

4. **Run the app**  
```
flutter run
```

Folder Structure
- lib/ - Main application code
- lib/feature/ - Feature modules (auth, clients, home, store, user, etc.)
- lib/core/ - Core utilities, routing, dependency injection
- lib/common_widgets/ - Reusable UI components