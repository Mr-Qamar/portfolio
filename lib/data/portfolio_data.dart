import '../models/portfolio_models.dart';

class PortfolioData {
  PortfolioData._();

  static const profile = PortfolioProfile(
    name: 'Qamar Zaman',
    title: 'Flutter Expert & Mobile Developer',
    tagline: 'Building cross-platform apps that solve real business problems across 6 platforms',
    bio:
        '4+ years of mobile development experience — 1 year Android, 3 years Flutter. '
        'I design, build, and ship production apps for Android, iOS, Web, Windows, macOS, and Linux.',
    aboutParagraphs: [
      'I am a passionate Flutter Expert specializing in cross-platform development. '
          'Over the past 4 years, I have delivered apps across video conferencing, fitness, '
          'booking, events, CRM, healthcare, and legal domains.',
      'Beyond development, I handle end-to-end app publishing on Google Play Store and Apple App Store, '
          'including store listings, compliance, updates, and ongoing maintenance.',
      'Whether you need a custom business solution, a startup MVP, or a full-scale enterprise app — '
          'I can build it for Android, iOS, Web, Windows, macOS, and Linux from a single Flutter codebase.',
    ],
    profileImageAsset: 'assets/my pic.webp',
    profileImageUrl: null,
    yearsAndroid: 1,
    yearsFlutter: 3,
    resumeUrl: null,
  );

  static const contact = ContactInfo(
    email: 'qamarzaman.dev1@gmail.com',
    phone: '+92 300 3939282',
    location: 'Pakistan',
    linkedin: 'https://www.linkedin.com/in/qamarzaman-dev1',
    github: 'https://github.com/qamar-zaman',
    whatsapp: 'https://wa.me/923003939282',
  );

  static const experiences = [
    Experience(
      title: 'Flutter Developer',
      company: 'Freelance & Contract',
      period: '2022 – Present',
      description:
          'Building and maintaining cross-platform mobile and web applications for clients worldwide.',
      highlights: [
        'Delivered 7+ production apps across multiple industries',
        'Published apps on Google Play Store and Apple App Store',
        'Integrated Firebase, Supabase, REST APIs, and real-time features',
        'Built enterprise-grade applications with 150k+ lines of code',
      ],
    ),
    Experience(
      title: 'Android Developer',
      company: 'Previous Role',
      period: '2021 – 2022',
      description:
          'Developed native Android applications using Java and Kotlin.',
      highlights: [
        'Built user-facing features with Material Design',
        'Worked with SQLite, Retrofit, and Android SDK',
        'Transitioned to Flutter for cross-platform efficiency',
      ],
    ),
  ];

  static const skills = [
    Skill(name: 'Flutter', level: 0.95, category: 'Mobile'),
    Skill(name: 'Dart', level: 0.95, category: 'Languages'),
    Skill(name: 'Android', level: 0.80, category: 'Mobile'),
    Skill(name: 'Firebase', level: 0.88, category: 'Backend'),
    Skill(name: 'Supabase', level: 0.82, category: 'Backend'),
    Skill(name: 'REST APIs', level: 0.90, category: 'Backend'),
    Skill(name: 'Java', level: 0.75, category: 'Languages'),
    Skill(name: 'JavaScript', level: 0.70, category: 'Languages'),
    Skill(name: 'Python', level: 0.65, category: 'Languages'),
    Skill(name: 'C++', level: 0.60, category: 'Languages'),
    Skill(name: 'Play Store Publishing', level: 0.92, category: 'DevOps'),
    Skill(name: 'App Store Publishing', level: 0.85, category: 'DevOps'),
    Skill(name: 'App Maintenance', level: 0.90, category: 'DevOps'),
  ];

  // ───────────────────────────────────────────────
  // TOP 3 FEATURED PROJECTS (shown as hero cards)
  // ───────────────────────────────────────────────
  static const projects = [
    // ── #1 FEATURED ──────────────────────────────
    Project(
      name: 'Digitron CRM',
      tagline: 'Enterprise Workforce & Client Management Desktop App',
      category: 'Enterprise CRM',
      isFeatured: true,
      role: 'Solo Developer — architected and wrote 150,000+ lines of code single-handedly. Designed all modules, UI/UX, RBAC system, and real-time backend integration.',
      description:
          'An incredibly massive, solo-built enterprise CRM for Windows, macOS, and Linux. '
          'Features a real-time operations dashboard, color-coded attendance calendar, idle-time tracking, '
          'full client/account management, sales pipeline, dialer performance leaderboards, and a '
          'complete multi-department employee directory — all with role-based access control.',
      problemSolved:
          'Mid-to-large companies struggled with fragmented tools for CRM, attendance, and HR. '
          'Digitron unifies all operations in one cross-platform desktop app with live data sync, '
          'RBAC, and a premium dark-themed UI — built 100% solo with 150k+ LOC.',
      techStack: ['Flutter Desktop', 'Dart', 'Supabase', 'PostgreSQL', 'RBAC', 'Real-Time Sync'],
      imageAssets: [
        'assets/crm/1.webp',
        'assets/crm/2.webp',
        'assets/crm/3.webp',
        'assets/crm/4.webp',
        'assets/crm/5.webp',
        'assets/crm/6.webp',
      ],
    ),

    // ── #2 FEATURED ──────────────────────────────
    Project(
      name: 'CAS – LMS & Institute ERP',
      tagline: 'Zoom-Integrated Learning Management System',
      category: 'Education & Enterprise',
      isFeatured: true,
      role: 'Solo Flutter Developer — end-to-end: architecture, UI/UX, Zoom API integration, state management, and scalable database design.',
      description:
          'A massive, full-scale enterprise Learning Management System designed to fully digitize an educational institute. '
          'Features live Zoom video classes, multi-role dashboards (Student, Teacher, Admin, Super Admin), '
          'gamified quizzes, assignment management, attendance tracking, leave requests, and fee management — all under one roof.',
      problemSolved:
          'Educational institutes were drowning in manual paperwork and disconnected tools. '
          'CAS consolidates student management, live virtual classes via Zoom API, fee tracking, '
          'leave workflows, and performance dashboards into a single enterprise-grade mobile platform.',
      techStack: ['Flutter', 'Dart', 'Zoom API', 'Firebase', 'State Management', 'Role-Based Access'],
      imageAssets: [
        'assets/CAS LLM/1.webp',
        'assets/CAS LLM/2.webp',
        'assets/CAS LLM/3.webp',
        'assets/CAS LLM/4.webp',
        'assets/CAS LLM/5.webp',
        'assets/CAS LLM/6.webp',
        'assets/CAS LLM/7.webp',
        'assets/CAS LLM/8.webp',
      ],
    ),

    // ── #3 FEATURED ──────────────────────────────
    Project(
      name: 'AI Fitness Coach',
      tagline: 'Smart Workout & Health Tracker with AI Assistant',
      category: 'Health & Fitness',
      isFeatured: true,
      role: 'Full-Stack Flutter Developer — built complete frontend, Firebase backend integration, AI chat interface, and health metric tracking system.',
      description:
          'Your ultimate personal pocket trainer. Track daily steps, distance, calories, and Heart Points. '
          'Access guided workout plans like "Belly Fit" and "Leg & Lower Body". '
          'Chat 24/7 with an integrated AI fitness assistant for nutrition advice, meal plans, and exercise tips. '
          'Auto-calculates BMI and manages a personalized weekly workout schedule.',
      problemSolved:
          'Users needed a single app that combines real-time health tracking, structured workout guidance, '
          'and AI-powered personal coaching. AI Fitness Coach delivers all three with real-time Firebase sync, '
          'a custom bottom nav bar, and conversational AI streaming.',
      techStack: ['Flutter', 'Firebase', 'Generative AI / LLM', 'Firestore', 'Auth', 'State Management'],
      imageAssets: [
        'assets/fitness coach app/1.webp',
        'assets/fitness coach app/2.webp',
        'assets/fitness coach app/3.webp',
        'assets/fitness coach app/4.webp',
        'assets/fitness coach app/5.webp',
      ],
    ),

    // ── REST OF PROJECTS ──────────────────────────
    Project(
      name: 'Advocate Associates',
      tagline: 'Legal Consultation & Appointment Booking Platform',
      category: 'Legal Tech',
      role: 'Full-Stack Flutter Developer — designed dual-role architecture, hybrid Firebase + Supabase backend, payment gateway integration, and real-time calendar.',
      description:
          'A premium full-stack appointment booking app for legal professionals and IEP advocates. '
          'Dual-role system (Client & Admin/Lawyer) with real-time calendar scheduling, revenue analytics, '
          'graphical earnings dashboards, secure payment gateway, and Google Sign-In authentication.',
      problemSolved:
          'Lawyers were managing consultations manually via phone calls and spreadsheets. '
          'Advocate Associates delivers a professional booking portal with real-time slot management, '
          'payment processing, and an admin revenue dashboard.',
      techStack: ['Flutter', 'Firebase', 'Supabase', 'PostgreSQL', 'Payment Gateway', 'Google Auth'],
      imageAssets: [
        'assets/advocate associates/1.webp',
        'assets/advocate associates/2.webp',
        'assets/advocate associates/3.webp',
        'assets/advocate associates/4.webp',
        'assets/advocate associates/5.webp',
        'assets/advocate associates/6.webp',
      ],
    ),

    Project(
      name: 'CAS Student Management',
      tagline: 'Multi-Role IT Institute Management System',
      category: 'Education',
      role: 'Flutter Developer — built complex draggable role-selection UI, dynamic routing architecture, and form-based leave/fee management modules.',
      description:
          'A comprehensive multi-tier educational management app for IT institutes. '
          'Features a unique "Drag to choose role" onboarding (Super Admin, Admin, Student), '
          'cohort & mentorship management, leave applications, fee & concession tracking, '
          'success stories, virtual class joining, and a public course directory.',
      problemSolved:
          'IT institutes were managing student records, leaves, and fees through manual processes. '
          'CAS Student Management centralizes all operations with role-specific dashboards and '
          'dynamic routing so each user sees exactly what they need.',
      techStack: ['Flutter', 'Dart', 'Firebase', 'Role-Based Routing', 'Custom Widgets'],
      imageAssets: [
        'assets/cas elms/1.webp',
        'assets/cas elms/2.webp',
        'assets/cas elms/3.webp',
        'assets/cas elms/4.webp',
        'assets/cas elms/5.webp',
      ],
    ),

    Project(
      name: 'Invitor',
      tagline: 'Digital Invitation Maker & Event Manager',
      category: 'Events',
      role: 'Flutter Developer — engineered animation-heavy custom UI, dynamic data binding for invitation rendering, local storage system, and led Google Play Store deployment.',
      description:
          'A beautifully crafted, animation-rich app for creating and sharing stunning digital invitations. '
          'Supports weddings, engagements, and birthdays with premium templates, quick customization forms, '
          'standard/gallery views, and easy WhatsApp sharing. Published on Google Play Store.',
      problemSolved:
          'Paper invitations are costly and untrackable. Invitor lets hosts create custom invitations, '
          'share via WhatsApp, and manage all guests from one dashboard — all with fluid 60fps animations.',
      techStack: ['Flutter', 'Dart', 'Custom Animations', 'Local Storage', 'Google Play Store'],
      imageAssets: [
        'assets/inviter/1.webp',
        'assets/inviter/2.webp',
        'assets/inviter/3.webp',
        'assets/inviter/4.webp',
        'assets/inviter/5.webp',
        'assets/inviter/6.webp',
        'assets/inviter/8.webp',
      ],
    ),

    Project(
      name: 'Medica',
      tagline: 'E-Pharmacy & Telehealth Consultation App',
      category: 'Healthcare',
      role: 'Flutter Developer — built complete e-commerce cart system, dynamic category filtering, doctor directory with telehealth integration, and WhatsApp deep linking.',
      description:
          '"Your Health, Our Priority." Medica combines a digital pharmacy with a doctor consultation platform. '
          'Browse categorized medicines (Analgesics, Antipyretics), view detailed drug info, manage an integrated cart, '
          'and book specialist consultations (Cardiologists, Dermatologists, Pediatricians) — or chat directly on WhatsApp.',
      problemSolved:
          'Patients needed a single app for both buying medicines and booking doctor consultations. '
          'Medica delivers a trustworthy dual-purpose healthcare platform with clean green-themed UI, '
          'dynamic cart state, and seamless telehealth routing.',
      techStack: ['Flutter', 'Dart', 'Firebase', 'E-Commerce Cart', 'URL Launcher', 'Deep Linking'],
      imageAssets: [
        'assets/medica/1.webp',
        'assets/medica/2.webp',
        'assets/medica/3.webp',
        'assets/medica/4.webp',
        'assets/medica/5.webp',
        'assets/medica/6.webp',
      ],
    ),
  ];

  static List<Project> get featuredProjects =>
      projects.where((p) => p.isFeatured).toList();

  static List<Project> get otherProjects =>
      projects.where((p) => !p.isFeatured).toList();

  static const services = [
    Service(
      title: 'Cross-Platform App Development',
      description:
          'Android, iOS, and Web apps from a single Flutter codebase — faster delivery, lower cost.',
      iconName: 'devices',
    ),
    Service(
      title: 'Enterprise & CRM Solutions',
      description:
          'Large-scale business apps: CRM, ERP, dashboards, attendance systems, and internal tools.',
      iconName: 'business',
    ),
    Service(
      title: 'AI & API Integration',
      description:
          'LLM chatbots, Zoom video APIs, payment gateways, Firebase, Supabase, and REST backends.',
      iconName: 'cloud',
    ),
    Service(
      title: 'Play Store & App Store Publishing',
      description:
          'End-to-end store submission: listings, screenshots, compliance, and release management.',
      iconName: 'store',
    ),
    Service(
      title: 'App Maintenance & Updates',
      description:
          'Ongoing bug fixes, OS compatibility updates, feature additions, and performance tuning.',
      iconName: 'build',
    ),
    Service(
      title: 'UI/UX Design Implementation',
      description:
          'Pixel-perfect implementation of designs with smooth animations and responsive layouts.',
      iconName: 'palette',
    ),
  ];

  static const navItems = [
    ('Home', 'home'),
    ('About', 'about'),
    ('Projects', 'projects'),
    ('Skills', 'skills'),
    ('Services', 'services'),
    ('Contact', 'contact'),
  ];
}
