# Tanveer Ahmad - Flutter Web Portfolio

Personal portfolio website for **Tanveer Ahmad**, Flutter Developer and Software Engineer, built with **Flutter 3 (Web)**, **Dart**, and **Material 3**.

---

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (version 3.0.0 or higher)
- [Google Chrome](https://www.google.com/chrome/) (for Flutter Web development)
- [VS Code](https://code.visualstudio.com/) with the official **Flutter** and **Dart** extensions

### Running Locally

1. Open this project directory in VS Code:
   ```bash
   code .
   ```

2. Fetch Flutter dependencies:
   ```bash
   flutter pub get
   ```

3. Run the portfolio on Chrome:
   ```bash
   flutter run -d chrome
   ```
   Or simply press `F5` in VS Code to launch with hot reload and debugging!

---

## 📁 Architecture & Folder Structure

```
tanveer_portfolio/
├── pubspec.yaml            # Flutter project dependencies & configuration
├── analysis_options.yaml   # Flutter & Dart linter rules
├── web/
│   ├── index.html          # Web entry point
│   └── manifest.json       # Web App Manifest & PWA config
└── lib/
    ├── main.dart           # Application entry point
    ├── constants/
    │   ├── app_colors.dart        # Theme colors, gradients & surface tokens
    │   ├── app_constants.dart     # Personal info, links, texts & breakpoints
    │   └── app_text_styles.dart   # Typography definitions (Inter)
    ├── theme/
    │   └── app_theme.dart         # Material 3 ThemeData with dark styling
    ├── models/
    │   ├── project_model.dart     # Project details & repository data
    │   ├── skill_model.dart       # Technical skills & category data
    │   ├── service_model.dart     # Engineering offerings data
    │   ├── experience_model.dart  # Work history & internship details
    │   └── education_model.dart   # Degree & coursework data
    ├── widgets/
    │   ├── custom_button.dart     # Animated primary & outlined action buttons
    │   ├── social_icon_button.dart# Interactive GitHub & LinkedIn link buttons
    │   ├── glass_card.dart        # Reusable dark container with hover elevation
    │   ├── section_header.dart    # Badge chip & section heading
    │   ├── skill_card.dart        # Responsive skill tile with icon
    │   ├── project_card.dart      # Portfolio project card with tech chips
    │   ├── service_card.dart      # Offering card with icon badge
    │   ├── experience_timeline_tile.dart # Vertical timeline component
    │   ├── education_card.dart    # Academic achievements & CGPA card
    │   ├── nav_bar.dart           # Desktop header with smooth scroll hooks
    │   └── mobile_drawer.dart     # Mobile responsive navigation drawer
    ├── sections/
    │   ├── hero_section.dart      # Hero greeting, role, bio & action buttons
    │   ├── about_section.dart     # Bio narrative & focus pillars
    │   ├── skills_section.dart    # Responsive 14-skill grid
    │   ├── projects_section.dart  # E-Commerce & Retinal Disease Detection
    │   ├── experience_section.dart# Vantedge AI Software Engineering Internship
    │   ├── education_section.dart # BS IT, University of Education Lahore
    │   ├── services_section.dart  # 6 core engineering services
    │   ├── contact_section.dart   # Contact inquiry form & social links
    │   └── footer_section.dart    # Copyright & Back-to-Top trigger
    └── screens/
        └── home_screen.dart       # Main single-page scroll view & navigation
```

---

## 🛠️ Building for Production / Web Deployment

To compile a minified, production-ready web build:

```bash
flutter build web --release
```

The compiled files will be output to `build/web/`. You can deploy this folder directly to:
- **Firebase Hosting**: `firebase deploy`
- **GitHub Pages**
- **Vercel** / **Netlify** / **Cloudflare Pages**

---

## 👤 Profile Details Included

- **Name**: Tanveer Ahmad
- **Role**: Flutter Developer | Software Engineer
- **Location**: Lahore, Pakistan
- **Education**: BS Information Technology, University of Education Lahore (CGPA 3.35 / 4.0)
- **Experience**: Software Engineering Intern at Vantedge AI (May 2026 – Present)
- **GitHub**: [github.com/tanveer3894](https://github.com/tanveer3894)
- **LinkedIn**: [linkedin.com/in/tanveer-ahmad-3b440b375](https://linkedin.com/in/tanveer-ahmad-3b440b375/)
- **Projects**:
  1. Flutter E-Commerce App
  2. Retinal Disease Detection (AI / Computer Vision)

---

© 2026 Tanveer Ahmad. All rights reserved.
