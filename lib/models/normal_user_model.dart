class NormalUserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? secretPassword;
  String? image;
  String? gender;
  String? birthday;
  double? latitude;
  double? longitude;
  String? banInfo;
  String? qrCode;
  String? secretKey;
  String? token;
  double? emeraldBalance;
  double? coinBalance;
  String? totalSteps;
  String? boosts;
  String? coupons;
  String? places;
  String? badges;
  String? workouts;
  String? completedWorkouts;
  String? challenges;
  String? score;
  String? nationality;
  int? membership;
  String? lastMembershipActivationDate;
  String? inbox;
  String? seenInbox;
  String? receivedNotification;
  String? heightInCm;
  String? weight;
  String? goals;
  bool? adBlocker;
  String? phoneType;
  String? logs;
  String? createdAt;
  String? modifiedAt;
  bool? banned;

  NormalUserModel(
      {this.id,
        this.firstName,
        this.lastName,
        this.phoneNumber,
        this.email,
        this.secretPassword,
        this.image,
        this.gender,
        this.birthday,
        this.latitude,
        this.longitude,
        this.banInfo,
        this.qrCode,
        this.secretKey,
        this.token,
        this.emeraldBalance,
        this.coinBalance,
        this.totalSteps,
        this.boosts,
        this.coupons,
        this.places,
        this.badges,
        this.workouts,
        this.completedWorkouts,
        this.challenges,
        this.score,
        this.nationality,
        this.membership,
        this.lastMembershipActivationDate,
        this.inbox,
        this.seenInbox,
        this.receivedNotification,
        this.heightInCm,
        this.weight,
        this.goals,
        this.adBlocker,
        this.phoneType,
        this.logs,
        this.createdAt,
        this.modifiedAt,
        this.banned});

  NormalUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    secretPassword = json['secretPassword'];
    image = json['image'];
    gender = json['gender'];
    birthday = json['birthday'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    banInfo = json['banInfo'];
    qrCode = json['qrCode'];
    secretKey = json['secretKey'];
    token = json['token'];
    emeraldBalance = json['emeraldBalance'];
    coinBalance = json['coinBalance'];
    totalSteps = json['totalSteps'];
    boosts = json['boosts'];
    coupons = json['coupons'];
    places = json['places'];
    badges = json['badges'];
    workouts = json['workouts'];
    completedWorkouts = json['completedWorkouts'];
    challenges = json['challenges'];
    score = json['score'];
    nationality = json['nationality'];
    membership = json['membership'];
    lastMembershipActivationDate = json['lastMembershipActivationDate'];
    inbox = json['inbox'];
    seenInbox = json['seenInbox'];
    receivedNotification = json['receivedNotification'];
    heightInCm = json['heightInCm'];
    weight = json['weight'];
    goals = json['goals'];
    adBlocker = json['adBlocker'];
    phoneType = json['phoneType'];
    logs = json['logs'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    banned = json['banned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['secretPassword'] = this.secretPassword;
    data['image'] = this.image;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['banInfo'] = this.banInfo;
    data['qrCode'] = this.qrCode;
    data['secretKey'] = this.secretKey;
    data['token'] = this.token;
    data['emeraldBalance'] = this.emeraldBalance;
    data['coinBalance'] = this.coinBalance;
    data['totalSteps'] = this.totalSteps;
    data['boosts'] = this.boosts;
    data['coupons'] = this.coupons;
    data['places'] = this.places;
    data['badges'] = this.badges;
    data['workouts'] = this.workouts;
    data['completedWorkouts'] = this.completedWorkouts;
    data['challenges'] = this.challenges;
    data['score'] = this.score;
    data['nationality'] = this.nationality;
    data['membership'] = this.membership;
    data['lastMembershipActivationDate'] = this.lastMembershipActivationDate;
    data['inbox'] = this.inbox;
    data['seenInbox'] = this.seenInbox;
    data['receivedNotification'] = this.receivedNotification;
    data['heightInCm'] = this.heightInCm;
    data['weight'] = this.weight;
    data['goals'] = this.goals;
    data['adBlocker'] = this.adBlocker;
    data['phoneType'] = this.phoneType;
    data['logs'] = this.logs;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['banned'] = this.banned;
    return data;
  }
}
