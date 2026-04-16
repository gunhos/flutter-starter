class UserProfile {
  const UserProfile({
    required this.uid,
    required this.displayName,
    required this.email,
    this.photoURL,
    this.bio = '',
  });

  final String uid;
  final String displayName;
  final String email;
  final String? photoURL;
  final String bio;

  UserProfile copyWith({
    String? displayName,
    String? bio,
  }) {
    return UserProfile(
      uid: uid,
      displayName: displayName ?? this.displayName,
      email: email,
      photoURL: photoURL,
      bio: bio ?? this.bio,
    );
  }

  Map<String, dynamic> toMap() => {
        'uid': uid,
        'displayName': displayName,
        'email': email,
        'photoURL': photoURL,
        'bio': bio,
        'updatedAt': DateTime.now().toIso8601String(),
      };

  factory UserProfile.fromMap(String uid, Map<String, dynamic> map) {
    return UserProfile(
      uid: uid,
      displayName: map['displayName'] as String? ?? '',
      email: map['email'] as String? ?? '',
      photoURL: map['photoURL'] as String?,
      bio: map['bio'] as String? ?? '',
    );
  }
}
