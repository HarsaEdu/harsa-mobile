
class UserProfileData {
    int userId;
    int userProfileId;
    String imageUrl;
    int roleId;
    String roleName;
    String email;
    String username;
    String firstName;
    String lastName;
    String phoneNumber;
    DateTime dateBirth;
    String bio;
    String gender;
    String city;
    String address;
    String job;
    int subscriptionId;
    DateTime startDate;
    DateTime endDate;

    UserProfileData({
        required this.userId,
        required this.userProfileId,
        required this.imageUrl,
        required this.roleId,
        required this.roleName,
        required this.email,
        required this.username,
        required this.firstName,
        required this.lastName,
        required this.phoneNumber,
        required this.dateBirth,
        required this.bio,
        required this.gender,
        required this.city,
        required this.address,
        required this.job,
        required this.subscriptionId,
        required this.startDate,
        required this.endDate,
    });

    factory UserProfileData.fromJson(Map<String, dynamic> json) => UserProfileData(
        userId: json["user_id"],
        userProfileId: json["user_profile_id"],
        imageUrl: json["image_url"],
        roleId: json["role_id"],
        roleName: json["role_name"],
        email: json["email"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        dateBirth: DateTime.parse(json["date_birth"]),
        bio: json["bio"],
        gender: json["gender"],
        city: json["city"],
        address: json["address"],
        job: json["job"],
        subscriptionId: json["subscription_id"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_profile_id": userProfileId,
        "image_url": imageUrl,
        "role_id": roleId,
        "role_name": roleName,
        "email": email,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "date_birth": dateBirth.toIso8601String(),
        "bio": bio,
        "gender": gender,
        "city": city,
        "address": address,
        "job": job,
        "subscription_id": subscriptionId,
        "start_date": startDate.toIso8601String(),
        "end_date": endDate.toIso8601String(),
    };
}