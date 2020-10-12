class Profile {
  final String name;
  final int followers;
  final int following;
  final int publicRepos;
  final String bio;
  final String image;

  Profile({
    this.name,
    this.followers,
    this.following,
    this.publicRepos,
    this.bio,
    this.image,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        name: json['login'],
        bio: json['bio'] ?? "",
        followers: json['followers'],
        following: json['following'],
        image: json['avatar_url'],
        publicRepos: json['public_repos'],
      );
}
