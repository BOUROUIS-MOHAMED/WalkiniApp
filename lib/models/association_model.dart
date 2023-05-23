class AssociationModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? secretPassword;
  String? image;
  String? description;
  double? latitude;
  double? longitude;
  int? banInfo;
  String? secretKey;
  String? token;
  double? emeraldBalance;
  double? coinBalance;
  double? moneyBalance;
  String? badges;
  String? score;
  String? nationality;
  bool? premium;
  String? premiumActivationDate;
  String? inbox;
  String? seenInbox;
  String? receivedNotification;
  String? logs;
  bool? activated;
  String? createdAt;
  String? modifiedAt;
  Null? banned;

  AssociationModel(
      {this.id,
        this.name,
        this.phoneNumber,
        this.email,
        this.secretPassword,
        this.image,
        this.description,
        this.latitude,
        this.longitude,
        this.banInfo,
        this.secretKey,
        this.token,
        this.emeraldBalance,
        this.coinBalance,
        this.moneyBalance,
        this.badges,
        this.score,
        this.nationality,
        this.premium,
        this.premiumActivationDate,
        this.inbox,
        this.seenInbox,
        this.receivedNotification,
        this.logs,
        this.activated,
        this.createdAt,
        this.modifiedAt,
        this.banned});

  AssociationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    secretPassword = json['secretPassword'];
    image = json['image'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    banInfo = json['banInfo'];
    secretKey = json['secretKey'];
    token = json['token'];
    emeraldBalance = json['emeraldBalance'];
    coinBalance = json['coinBalance'];
    moneyBalance = json['moneyBalance'];
    badges = json['badges'];
    score = json['score'];
    nationality = json['nationality'];
    premium = json['premium'];
    premiumActivationDate = json['premiumActivationDate'];
    inbox = json['inbox'];
    seenInbox = json['seenInbox'];
    receivedNotification = json['receivedNotification'];
    logs = json['logs'];
    activated = json['activated'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
    banned = json['banned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['secretPassword'] = this.secretPassword;
    data['image'] = this.image;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['banInfo'] = this.banInfo;
    data['secretKey'] = this.secretKey;
    data['token'] = this.token;
    data['emeraldBalance'] = this.emeraldBalance;
    data['coinBalance'] = this.coinBalance;
    data['moneyBalance'] = this.moneyBalance;
    data['badges'] = this.badges;
    data['score'] = this.score;
    data['nationality'] = this.nationality;
    data['premium'] = this.premium;
    data['premiumActivationDate'] = this.premiumActivationDate;
    data['inbox'] = this.inbox;
    data['seenInbox'] = this.seenInbox;
    data['receivedNotification'] = this.receivedNotification;
    data['logs'] = this.logs;
    data['activated'] = this.activated;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    data['banned'] = this.banned;
    return data;
  }
}
