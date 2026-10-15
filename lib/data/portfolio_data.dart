import '../models/portfolio_models.dart';

class PortfolioData {
  PortfolioData._();

  static const profile = PortfolioProfile(
    name: 'Qamar Zaman',
    title: 'Flutter Expert & Product Engineer',
    tagline:
        'I design, build, and ship complete products — mobile, desktop, web, and Chrome extensions — not just screens.',
    bio:
        '2.5+ years shipping production software: Android at CAS (Jun–Nov 2023), Flutter at CAS (Nov 2023–May 2024), '
        'and remote Flutter at Digitron LLC (Jun 2024–Present). '
        'I take messy business workflows and turn them into one product teams actually use — '
        'from a 150k-line desktop CRM built entirely solo, to field apps, store releases, and Chrome lead tools.',
    aboutParagraphs: [
      'I am a Flutter expert who thinks like a product engineer. I do not hand off half-built modules — '
          'I own architecture, UI/UX, backend, roles, publishing, and the details that make software usable at work. '
          'Over 2.5 years I have shipped 20+ apps and tools across CRM, rentals, field services, education, fitness, '
          'healthcare, legal, events, and Chrome extensions.',
      'Digitron CRM is the clearest example: I built the entire enterprise desktop product alone — idle-time and '
          'app-usage tracking, leads and meetings, employee and customer management, attendance, and operations — '
          'so a company could run from one app instead of a pile of spreadsheets and chat threads.',
      'I also publish to Google Play and the App Store, keep apps updated, and build Chrome extensions for live lead '
          'generation. If you need an MVP, a field tool, or a full internal system for Android, iOS, Web, Windows, '
          'macOS, Linux, or Chrome — I can take it from idea to something your team can log into tomorrow.',
    ],
    profileImageAsset: 'assets/my pic.webp',
    profileImageUrl: null,
    yearsAndroid: 0,
    yearsFlutter: 2.5,
    resumeUrl: null,
  );

  static const contact = ContactInfo(
    email: 'qamarzaman.dev1@gmail.com',
    phone: '+92 300 3939282',
    location: 'Pakistan',
    linkedin: 'https://www.linkedin.com/in/qamarzaman-dev1',
    github: 'https://github.com/Mr-Qamar',
    whatsapp: 'https://wa.me/923003939282',
  );

  static const experiences = [
    Experience(
      title: 'Flutter Developer',
      company: 'Digitron LLC (Remote)',
      period: 'Jun 2024 – Present',
      description:
          'Remote Flutter developer shipping production products for Digitron: desktop CRM, field and rental apps, and store releases.',
      highlights: [
        'Built Digitron CRM entirely solo — 150k+ lines covering workforce, CRM, idle/app-usage tracking, and RBAC',
        'Delivered NV Car Rentals and R&M Roofing as end-to-end Flutter products',
        'Shipped Advocate Associates to Google Play, the App Store, and Microsoft Store',
        'Shipped Chrome lead tools with cloud sync, team workflows, and live dashboards',
      ],
    ),
    Experience(
      title: 'Flutter Developer',
      company: 'Center for Advance Solutions (CAS), Bahawalpur',
      period: 'Nov 2023 – May 2024',
      description:
          'Five months owning Flutter products for the institute: LMS, student management, and Play Store apps.',
      highlights: [
        'Built CAS LMS — live classes, quizzes, attendance, fees, and multi-role dashboards',
        'Shipped CAS ELMS (student / institute management) and Invitor to Google Play',
        'Owned architecture, UI/UX, Firebase, and Zoom API integrations',
      ],
    ),
    Experience(
      title: 'Android Developer',
      company: 'Center for Advance Solutions (CAS), Bahawalpur',
      period: 'Jun 2023 – Nov 2023',
      description:
          'Five months building native Android apps in Java and Kotlin before moving the same stack to Flutter.',
      highlights: [
        'Built user-facing features with Material Design',
        'Worked with SQLite, Retrofit, and the Android SDK',
        'Moved to Flutter in Nov 2023 for cross-platform delivery at CAS',
      ],
    ),
  ];

  static const skills = [
    Skill(name: 'Flutter', level: 0.95, category: 'Mobile'),
    Skill(name: 'Dart', level: 0.95, category: 'Languages'),
    Skill(name: 'Android', level: 0.80, category: 'Mobile'),
    Skill(name: 'Clean Architecture', level: 0.90, category: 'Mobile'),
    Skill(name: 'Riverpod', level: 0.88, category: 'Mobile'),
    Skill(name: 'BLoC', level: 0.86, category: 'Mobile'),
    Skill(name: 'Provider', level: 0.88, category: 'Mobile'),
    Skill(name: 'Custom Animation', level: 0.85, category: 'Mobile'),
    Skill(name: 'Clipper', level: 0.82, category: 'Mobile'),
    Skill(name: 'ANN', level: 0.80, category: 'AI'),
    Skill(name: 'CNN', level: 0.82, category: 'AI'),
    Skill(name: 'YOLO', level: 0.78, category: 'AI'),
    Skill(name: 'RNN', level: 0.76, category: 'AI'),
    Skill(name: 'Transformers', level: 0.84, category: 'AI'),
    Skill(name: 'LangChain', level: 0.82, category: 'LLM'),
    Skill(name: 'LangGraph', level: 0.80, category: 'LLM'),
    Skill(name: 'MCP Servers', level: 0.86, category: 'LLM'),
    Skill(name: 'FastAPI', level: 0.82, category: 'Backend'),
    Skill(name: 'Firebase', level: 0.88, category: 'Backend'),
    Skill(name: 'Supabase', level: 0.82, category: 'Backend'),
    Skill(name: 'REST APIs', level: 0.90, category: 'Backend'),
    Skill(name: 'Java', level: 0.75, category: 'Languages'),
    Skill(name: 'JavaScript', level: 0.78, category: 'Languages'),
    Skill(name: 'Python', level: 0.80, category: 'Languages'),
    Skill(name: 'C++', level: 0.60, category: 'Languages'),
    Skill(name: 'Chrome Extensions', level: 0.86, category: 'Web'),
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
      role:
          'Solo developer — I designed, architected, and wrote the entire product (150,000+ lines) with no co-developer. Every module, the UI/UX, RBAC, and real-time backend are mine.',
      description:
          'A full enterprise CRM and workforce platform for Windows, macOS, and Linux — built 100% by me. '
          'It is not a thin dashboard: it runs day-to-day company operations. Idle-time and app-usage tracking, '
          'leads and meetings, employee and customer records, attendance, sales pipeline, dialer leaderboards, '
          'and a multi-department directory — all under role-based access with live sync.',
      problemSolved:
          'The business was split across chat, spreadsheets, and separate tools for CRM, HR, and monitoring. '
          'I replaced that with one desktop product: managers see employees and customers, track who is idle vs working, '
          'follow leads and meetings, and take attendance — without hiring a team of developers to build it.',
      techStack: [
        'Flutter Desktop',
        'Dart',
        'Supabase',
        'PostgreSQL',
        'Idle & Usage Tracking',
        'RBAC',
        'Real-Time Sync',
      ],
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
      name: 'NV Car Rentals',
      tagline: 'Dual-sided Cincinnati rental demo — customer booking plus NV Ops',
      category: 'Mobility',
      isFeatured: true,
      role:
          'Flutter Mobile Developer — end-to-end delivery with Riverpod and GoRouter: customer booking, admin / NV Ops panel, branded UI, on-device persistence, and TestFlight-ready iOS builds.',
      description:
          'A dual-sided Greater Cincinnati car-rental pitch demo. Customers browse the fleet, check availability, '
          'and submit rental proposals; admins review proposals, manage cars and customers, and run operational tools. '
          'Built as a fully walkable product story on a real phone — premium surfaces (payments, GPS, analytics) look live for pitching.',
      problemSolved:
          'The client needed to pitch a full rental product without live Stripe, GPS hardware, or a production backend. '
          'NV Car Rentals delivers both customer and ops flows with local persistence so demos stay complete and reliable.',
      techStack: [
        'Flutter',
        'Riverpod',
        'GoRouter',
        'SharedPreferences',
        'iOS TestFlight',
      ],
      imageAssets: [
        'assets/nv_rentals/2.png',
        'assets/nv_rentals/3.png',
        'assets/nv_rentals/4.png',
        'assets/nv_rentals/5.png',
        'assets/nv_rentals/6.png',
        'assets/nv_rentals/7.png',
        'assets/nv_rentals/8.png',
        'assets/nv_rentals/9.png',
        'assets/nv_rentals/1.png',
      ],
    ),

    // ── #3 FEATURED ──────────────────────────────
    Project(
      name: 'R&M Roofing',
      tagline: 'Estimate requests and crew quotes for a Minnesota roofing contractor',
      category: 'Field Ops',
      isFeatured: true,
      role:
          'End-to-end product engineer — customer and admin experiences, estimate wizard, auth, maps/geocoding, role-based access, and the Supabase data layer.',
      description:
          'A Flutter app for R&M Roofing and Exteriors (Blaine, MN) so homeowners can request roof estimates '
          'and the crew can review leads and send quotes. Guest browsing, multi-step estimate wizard with map pin and GPS, '
          'photo-backed jobs, and a live admin inbox with 1–3 line-item estimates.',
      problemSolved:
          'Intake was phone- and website-only, which slowed quoting. The app replaces that with a branded digital flow: '
          'customers submit photo-backed requests; staff quote from a live inbox on a map.',
      techStack: [
        'Flutter',
        'Supabase',
        'Riverpod',
        'go_router',
        'OpenStreetMap',
      ],
      imageAssets: [
        'assets/rm_roofing/1.png',
        'assets/rm_roofing/2.png',
        'assets/rm_roofing/3.png',
        'assets/rm_roofing/4.png',
        'assets/rm_roofing/5.png',
        'assets/rm_roofing/6.png',
        'assets/rm_roofing/7.png',
        'assets/rm_roofing/8.png',
      ],
    ),

    // ── REST OF PROJECTS ──────────────────────────
    Project(
      name: 'Yelp New Leads Finder',
      tagline: 'Chrome extension for New-on-Yelp lead search, team sync, and CSV export',
      category: 'Chrome Extension',
      isFeatured: false,
      role:
          'Solo product engineer — popup automation, Finder dashboard, team Chrome-profile sync, photo-age verification, and filtered CSV/ZIP export.',
      description:
          'A production Chrome extension that finds new Yelp businesses and turns them into calling lists. '
          'Operators pick 1 state, multi-state, or All USA, auto-select cities, filter “New on Yelp,” and run auto search. '
          'The dashboard tracks 1,500+ leads across 51 states, Finder team IDs, called vs pending, photo verify, '
          'and custom CSV export (single file or category folders).',
      problemSolved:
          'Lead gen was slow, manual, and stuck on one machine. The extension automates Yelp discovery, syncs leads '
          'to a shared dashboard across Chrome profiles, and exports clean lists so a team can call without copy-paste.',
      techStack: [
        'Chrome Extension',
        'JavaScript',
        'Cloud Sync',
        'Team Workflows',
        'CSV / ZIP Export',
      ],
      imageAssets: [
        'assets/yelp_leads_finder/1.jpg',
        'assets/yelp_leads_finder/2.jpg',
        'assets/yelp_leads_finder/3.jpg',
        'assets/yelp_leads_finder/4.jpg',
      ],
    ),

    Project(
      name: 'CAS – LMS & Institute ERP',
      tagline: 'Zoom-Integrated Learning Management System',
      category: 'Education & Enterprise',
      isFeatured: false,
      role: 'Solo Flutter Developer — end-to-end: architecture, UI/UX, Zoom API integration, state management, and scalable database design.',
      description:
          'A massive, full-scale enterprise Learning Management System designed to fully digitize an educational institute. '
          'Features live Zoom video classes, multi-role dashboards (Student, Teacher, Admin, Super Admin), '
          'gamified quizzes, assignment management, attendance tracking, leave requests, and fee management — all under one roof.',
      problemSolved:
          'Educational institutes were drowning in manual paperwork and disconnected tools. '
          'CAS consolidates student management, live virtual classes via Zoom API, fee tracking, '
          'leave workflows, and performance dashboards into a single enterprise-grade mobile platform.',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.cas.elms&hl=en',
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

    Project(
      name: 'AI Fitness Coach',
      tagline: 'Smart Workout & Health Tracker with AI Assistant',
      category: 'Health & Fitness',
      isFeatured: false,
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
      playStoreUrl:
          'https://play.google.com/store/apps/details?id=com.digitronllc.advocateassociates&hl=en',
      appStoreUrl: 'https://apps.apple.com/us/app/advocate-associates/id6783474694',
      microsoftStoreUrl: 'https://apps.microsoft.com/detail/9nxb8945wd90?hl=en-US&gl=PK',
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
      playStoreUrl: 'https://play.google.com/store/apps/details?id=pk.org.cas.ELMS&hl=en',
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
      playStoreUrl: 'https://play.google.com/store/apps/details?id=pk.org.cas.inviteplus&hl=en',
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
          'Android, iOS, Web, Desktop, and Chrome Extensions from a single Flutter codebase — faster delivery, lower cost.',
      iconName: 'devices',
    ),
    Service(
      title: 'Chrome Extension Development',
      description:
          'Lead-generation and productivity extensions — search tools, dashboards, and Yelp-style products that ship in Chrome.',
      iconName: 'extension',
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
    ('GitHub', 'github'),
    ('Skills', 'skills'),
    ('Services', 'services'),
    ('Contact', 'contact'),
  ];
}
