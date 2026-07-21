# Qamar Zaman — Flutter Developer Portfolio

Professional portfolio website built with **Flutter Web**, ready to deploy on **Firebase Hosting** (free tier).

## Sections

- Hero (intro, stats, photo)
- About & experience timeline
- Skills with progress bars
- Featured projects (MeetFlow, Inviter, FitCoach, BookEasy, CRM, Portfolio)
- Services (dev, publishing, maintenance)
- Contact (email, phone, LinkedIn, GitHub, WhatsApp)

## Quick Start (Local)

### 1. Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and in PATH
- Chrome browser

### 2. Setup project

```bash
cd "c:\Flutter\ projects\my_portfolio"

# If platform folders are missing, run once:
flutter create . --platforms=web

flutter pub get
flutter run -d chrome
```

### 3. Build for production

```bash
flutter build web --release
```

Output: `build/web/`

---

## Update Your Real Data

Edit **`lib/data/portfolio_data.dart`** — all dummy data is in one file:

| What to update | Where |
|----------------|-------|
| Name, bio, experience | `profile`, `aboutParagraphs`, `experiences` |
| Email, phone, social links | `contact` |
| Projects, store links, descriptions | `projects` list |
| Skills | `skills` list |
| Services | `services` list |

### Add your photo & screenshots

1. Put images in `assets/images/` (e.g. `profile.jpg`, `meetflow.png`)
2. In `portfolio_data.dart`, set:
   - `profileImageAsset: 'assets/images/profile.jpg'`
   - Per project: `imageAsset: 'assets/images/meetflow.png'` (remove `imageUrl` when using assets)

---

## Deploy to Firebase Hosting (Free)

### Step 1 — Firebase project

1. Go to [Firebase Console](https://console.firebase.google.com)
2. Create project (e.g. `qamar-zaman-portfolio`)
3. Enable **Hosting** (Build → Hosting → Get started)

### Step 2 — Install Firebase CLI

```bash
npm install -g firebase-tools
firebase login
```

### Step 3 — Link project

Edit `.firebaserc` and set your real Firebase project ID:

```json
{
  "projects": {
    "default": "YOUR-FIREBASE-PROJECT-ID"
  }
}
```

### Step 4 — Build & deploy

```bash
flutter build web --release
firebase deploy --only hosting
```

Your site will be live at:

- `https://YOUR-PROJECT-ID.web.app`
- `https://YOUR-PROJECT-ID.firebaseapp.com`

---

## What You Need to Send / Update Later

- [ ] Professional profile photo
- [ ] Real email, phone, LinkedIn, GitHub, WhatsApp
- [ ] Play Store & App Store links for each app
- [ ] Project screenshots (PNG/JPG)
- [ ] CRM live demo URL
- [ ] Resume PDF (optional — add to assets and set `resumeUrl`)

---

## Tech Stack

- Flutter Web
- Google Fonts
- url_launcher
- Font Awesome icons
- Firebase Hosting

---

Built by **Qamar Zaman** — Flutter & Mobile App Developer
