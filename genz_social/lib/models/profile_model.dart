// Profile Model - Dummy dating profiles for demo
class ProfileModel {
  final String id;
  final String name;
  final int age;
  final String bio;
  final List<String> photos;
  final String distance;
  final List<String> interests;
  final String? education;
  final String? work;
  final String? intent;
  final bool isVerified;
  final double? height;
  final String? location;
  
  ProfileModel({
    required this.id,
    required this.name,
    required this.age,
    required this.bio,
    required this.photos,
    required this.distance,
    required this.interests,
    this.education,
    this.work,
    this.intent,
    this.isVerified = false,
    this.height,
    this.location,
  });
}

// Dummy Profiles Data
class DummyProfiles {
  static List<ProfileModel> get profiles => [
    ProfileModel(
      id: '1',
      name: 'Priya',
      age: 24,
      bio: 'Coffee lover ☕ | Travel enthusiast ✈️ | Looking for meaningful connections',
      photos: ['https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=400'],
      distance: '3 km away',
      interests: ['Coffee', 'Travel', 'Photography', 'Music'],
      education: 'Delhi University',
      work: 'Marketing Manager',
      intent: 'Cuffing',
      isVerified: true,
      height: 5.6,
      location: 'Mumbai',
    ),
    ProfileModel(
      id: '2',
      name: 'Rahul',
      age: 26,
      bio: 'Fitness freak 💪 | Tech enthusiast 💻 | Let\'s grab a drink!',
      photos: ['https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400'],
      distance: '5 km away',
      interests: ['Gym', 'Technology', 'Gaming', 'Movies'],
      education: 'IIT Bombay',
      work: 'Software Engineer',
      intent: 'Situationship',
      isVerified: true,
      height: 5.11,
      location: 'Bangalore',
    ),
    ProfileModel(
      id: '3',
      name: 'Ananya',
      age: 22,
      bio: 'Art lover 🎨 | Dog mom 🐕 | Swipe right for good vibes!',
      photos: ['https://images.unsplash.com/photo-1524504388940-b1c1722653e1?w=400'],
      distance: '2 km away',
      interests: ['Art', 'Dogs', 'Yoga', 'Reading'],
      education: 'NIFT Delhi',
      work: 'Fashion Designer',
      intent: 'Something Casual',
      isVerified: false,
      height: 5.4,
      location: 'Delhi',
    ),
    ProfileModel(
      id: '4',
      name: 'Arjun',
      age: 28,
      bio: 'Entrepreneur 🚀 | Foodie 🍕 | Always up for adventures!',
      photos: ['https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400'],
      distance: '8 km away',
      interests: ['Business', 'Food', 'Travel', 'Sports'],
      education: 'IIM Ahmedabad',
      work: 'Startup Founder',
      intent: 'Serious Relationship',
      isVerified: true,
      height: 6.0,
      location: 'Hyderabad',
    ),
    ProfileModel(
      id: '5',
      name: 'Zara',
      age: 23,
      bio: 'Music is life 🎵 | Night owl 🌙 | Let\'s vibe together',
      photos: ['https://images.unsplash.com/photo-1517841905240-472988babdf9?w=400'],
      distance: '4 km away',
      interests: ['Music', 'Dancing', 'Nightlife', 'Fashion'],
      education: 'St. Xavier\'s',
      work: 'Content Creator',
      intent: 'Situationship',
      isVerified: true,
      height: 5.5,
      location: 'Mumbai',
    ),
    ProfileModel(
      id: '6',
      name: 'Vikram',
      age: 25,
      bio: 'Photography 📸 | Biker 🏍️ | Living life one ride at a time',
      photos: ['https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400'],
      distance: '6 km away',
      interests: ['Photography', 'Biking', 'Nature', 'Coffee'],
      education: 'Manipal University',
      work: 'Product Manager',
      intent: 'Cuffing',
      isVerified: false,
      height: 5.10,
      location: 'Pune',
    ),
    ProfileModel(
      id: '7',
      name: 'Neha',
      age: 27,
      bio: 'Doctor by day 👩‍⚕️ | Dancer by night 💃 | Looking for my person',
      photos: ['https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400'],
      distance: '1 km away',
      interests: ['Medicine', 'Dancing', 'Fitness', 'Cooking'],
      education: 'AIIMS Delhi',
      work: 'Doctor',
      intent: 'Serious Relationship',
      isVerified: true,
      height: 5.3,
      location: 'Delhi',
    ),
    ProfileModel(
      id: '8',
      name: 'Rohan',
      age: 24,
      bio: 'Gamer 🎮 | Anime fan 🍜 | Pizza is bae 🍕',
      photos: ['https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=400'],
      distance: '7 km away',
      interests: ['Gaming', 'Anime', 'Food', 'Movies'],
      education: 'VIT Vellore',
      work: 'Data Analyst',
      intent: 'Something Casual',
      isVerified: false,
      height: 5.8,
      location: 'Chennai',
    ),
  ];
}
