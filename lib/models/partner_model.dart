class PartnerModel {
  int? id;
  String? name;
  String? phoneNumber;
  String? email;
  String? secretPassword;
  String? image;
  double? latitude;
  double? longitude;
  int? banInfo;
  String? qrCode;
  String? secretKey;
  String? token;
  double? emeraldBalance;
  double? coinBalance;
  double? moneyBalance;
  String? soledProducts;
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
  bool? banned;

  PartnerModel(
      {this.id,
        this.name,
        this.phoneNumber,
        this.email,
        this.secretPassword,
        this.image,
        this.latitude,
        this.longitude,
        this.banInfo,
        this.qrCode,
        this.secretKey,
        this.token,
        this.emeraldBalance,
        this.coinBalance,
        this.moneyBalance,
        this.soledProducts,
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

  PartnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    secretPassword = json['secretPassword'];
    image = json['image'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    banInfo = json['banInfo'];
    qrCode = json['qrCode'];
    secretKey = json['secretKey'];
    token = json['token'];
    emeraldBalance = json['emeraldBalance'];
    coinBalance = json['coinBalance'];
    moneyBalance = json['moneyBalance'];
    soledProducts = json['soledProducts'];
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
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['banInfo'] = this.banInfo;
    data['qrCode'] = this.qrCode;
    data['secretKey'] = this.secretKey;
    data['token'] = this.token;
    data['emeraldBalance'] = this.emeraldBalance;
    data['coinBalance'] = this.coinBalance;
    data['moneyBalance'] = this.moneyBalance;
    data['soledProducts'] = this.soledProducts;
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
