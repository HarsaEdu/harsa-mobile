class OnboardingContent {
  final String imagePath;
  final String title;
  final String subtitle;

  OnboardingContent({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingContent> onboardingContents = [
  OnboardingContent(
    imagePath: "assets/images/onboarding_01.png",
    title: "Belajar Menjadi Lebih Mudah.",
    subtitle:
        "Learning Management System yang dirancang untuk membuat proses belajar Anda menjadi lebih efektif dan menyenangkan.",
  ),
  OnboardingContent(
    imagePath: "assets/images/onboarding_02.png",
    title: "Modul Materi yang Lengkap",
    subtitle:
        "Modul materi kami dirancang secara komprehensif untuk mencakup seluruh aspek dari topik pembelajaran, memberikan Anda pemahaman yang mendalam.",
  ),
  OnboardingContent(
    imagePath: "assets/images/onboarding_03.png",
    title: "Chatbot AI",
    subtitle:
        "Jelajahi fitur Chatbot AI untuk menjawab pertanyaan, memberikan saran, dan memberikan panduan sesuai kebutuhan Anda.",
  ),
];
