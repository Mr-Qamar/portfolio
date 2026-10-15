class Project {
  const Project({
    required this.name,
    required this.tagline,
    required this.description,
    required this.problemSolved,
    required this.techStack,
    this.role,
    this.playStoreUrl,
    this.appStoreUrl,
    this.microsoftStoreUrl,
    this.webUrl,
    this.githubUrl,
    this.imageAsset,
    this.imageAssets,
    this.imageUrl,
    this.category,
    this.isFeatured = false,
  });

  final String name;
  final String tagline;
  final String description;
  final String problemSolved;
  final List<String> techStack;
  final String? role;
  final String? playStoreUrl;
  final String? appStoreUrl;
  final String? microsoftStoreUrl;
  final String? webUrl;
  final String? githubUrl;
  final String? imageAsset;
  final List<String>? imageAssets;
  final String? imageUrl;
  final String? category;
  final bool isFeatured;
}

class Skill {
  const Skill({required this.name, required this.level, this.category});

  final String name;
  final double level;
  final String? category;
}

class Service {
  const Service({
    required this.title,
    required this.description,
    required this.iconName,
  });

  final String title;
  final String description;
  final String iconName;
}

class Experience {
  const Experience({
    required this.title,
    required this.company,
    required this.period,
    required this.description,
    required this.highlights,
  });

  final String title;
  final String company;
  final String period;
  final String description;
  final List<String> highlights;
}

class ContactInfo {
  const ContactInfo({
    required this.email,
    required this.phone,
    required this.location,
    required this.linkedin,
    required this.github,
    required this.whatsapp,
  });

  final String email;
  final String phone;
  final String location;
  final String linkedin;
  final String github;
  final String whatsapp;

  String get githubUsername {
    final segments = Uri.tryParse(github)
            ?.pathSegments
            .where((segment) => segment.isNotEmpty)
            .toList() ??
        const <String>[];
    return segments.isEmpty ? '' : segments.first;
  }
}

class PortfolioProfile {
  const PortfolioProfile({
    required this.name,
    required this.title,
    required this.tagline,
    required this.bio,
    required this.aboutParagraphs,
    required this.profileImageAsset,
    required this.profileImageUrl,
    required this.yearsAndroid,
    required this.yearsFlutter,
    required this.resumeUrl,
  });

  final String name;
  final String title;
  final String tagline;
  final String bio;
  final List<String> aboutParagraphs;
  final String? profileImageAsset;
  final String? profileImageUrl;
  final double yearsAndroid;
  final double yearsFlutter;
  final String? resumeUrl;
}
