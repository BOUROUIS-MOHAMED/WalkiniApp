class ProfileModel {
  int? id;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? secretPassword;
  String? image;
  String? gender;
  DateTime? birthday;
  double? latitude;
  double? longitude;
  String? boosts;
  String? banDetails;
  Duration? banDuration;
  String? secretKey;
  String? token;
  String? emeraldBalance;
  String? coinBalance;
  String? totalSteps;
  String? coupons;
  String? boxes;
  String? places;
  String? score;
  String? nationality;
  int? membership;
  DateTime? lastMembershipActivationDate;
  int? additionalInformationId;
  String? reviewsId;
  String? inbox;
  DateTime? createdAt;
  DateTime? modifiedAt;
  bool? banned;
  bool? partner;
  String? qrCode;

  ProfileModel(
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
        this.boosts,
        this.banDetails,
        this.banDuration,
        this.secretKey,
        this.token,
        this.emeraldBalance,
        this.coinBalance,
        this.totalSteps,
        this.coupons,
        this.boxes,
        this.places,
        this.score,
        this.nationality,
        this.membership,
        this.lastMembershipActivationDate,
        this.reviewsId,
        this.inbox,
        this.additionalInformationId,
        this.createdAt,
        this.modifiedAt,
        this.banned,
        this.partner,
        this.qrCode});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    secretPassword = json['secretPassword'];
    image = json['image'];
    gender = json['gender'];
    birthday =DateTime.tryParse( json['birthday']);
    latitude = json['latitude'];
    longitude = json['longitude'];
    boosts = json['boosts'];
    banDetails = json['banDetails'];
    banDuration =Duration(milliseconds:json['banDurationInSeconds'])??Duration.zero;
    secretKey = json['secretKey'];
    additionalInformationId=json['additionalInformationId'];
    token = json['token'];
    emeraldBalance = json['emeraldBalance'];
    coinBalance = json['coinBalance'];
    totalSteps = json['totalSteps'];
    coupons = json['coupons'];
    boxes = json['boxes'];
    places = json['places'];
    score = json['score'];
    nationality = json['nationality'];
    membership = json['membership'];
    lastMembershipActivationDate = json['lastMembershipActivationDate'];
    reviewsId = json['reviewsId'];
    inbox = json['inbox'];
    createdAt =DateTime.tryParse( json['createdAt']);
    modifiedAt = DateTime.tryParse(json['modifiedAt']);
    banned = json['banned'];
    partner = json['partner'];
    qrCode = json['qrCode'];
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
    data['birthday'] = this.birthday?.toIso8601String();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['boosts'] = this.boosts;
    data['banDetails'] = this.banDetails;
    data['banDuration'] = this.banDuration?.inMilliseconds.toString();
    data['secretKey'] = this.secretKey;
    data['token'] = this.token;
    data['additionalInformationId']=this.additionalInformationId;
    data['emeraldBalance'] = this.emeraldBalance;
    data['coinBalance'] = this.coinBalance;
    data['totalSteps'] = this.totalSteps;
    data['coupons'] = this.coupons;
    data['boxes'] = this.boxes;
    data['places'] = this.places;
    data['score'] = this.score;
    data['nationality'] = this.nationality;
    data['membership'] = this.membership;
    data['lastMembershipActivationDate'] = this.lastMembershipActivationDate?.toIso8601String();
    data['reviewsId'] = this.reviewsId;
    data['inbox'] = this.inbox;
    data['createdAt'] = this.createdAt?.toIso8601String();
    data['modifiedAt'] = this.modifiedAt?.toIso8601String();
    data['banned'] = this.banned;
    data['partner'] = this.partner;
    data['qrCode'] = this.qrCode;
    return data;
  }
}