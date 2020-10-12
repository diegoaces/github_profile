import 'package:flutter/material.dart';
import 'package:github_profile/data/models/Profile.dart';
import 'package:github_profile/pages/widgets/TextFormField.dart';

Column buildUserData(Profile profile) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      UserNameInputField(),
      Column(
        children: [
          Container(
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(profile.image),
                // image: NetworkImage('source.unsplash.com/600x600'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            profile.name,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              profile.bio,
              style: TextStyle(
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF2a2a2a).withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            color: Colors.white,
          ),
          width: double.infinity,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      profile.followers.toString(),
                      style: TextStyle(
                        color: Color(0xff2BE1C8),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "FOLLOWERS",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      profile.following.toString(),
                      style: TextStyle(
                        color: Color(0xff2BE1C8),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "FOLLOWING",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      profile.publicRepos.toString(),
                      style: TextStyle(
                        color: Color(0xff2BE1C8),
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      "REPOSITORIES",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
