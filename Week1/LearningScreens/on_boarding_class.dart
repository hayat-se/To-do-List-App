

class OnboardingData{
  final String title;
  final String description;
  final String image;

  OnboardingData({
    required this.title,
    required this.description,
    required this.image,
  });

  static final List<OnboardingData> onboardingList = [
    OnboardingData(
      title: "Welcome to SwiftTask",
      description: "Organize your day and boost productivity with smart task planning.",
      image: "assets/images/img1.png"
    ),
    OnboardingData(
        title: "Smart Reminders",
        description: "Never miss a deadline with timely alerts and notifications.",
        image: "assets/images/img2.png"
    ),
    OnboardingData(
        title: "Ready to Go",
        description: "Let’s begin your journey to a more organized life!",
        image: "assets/images/img3.png"
    ),
  ];
}


