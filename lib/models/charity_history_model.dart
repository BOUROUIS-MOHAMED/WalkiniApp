class CharityHistoryModel {
  int? id;
  int? donor;
  String? logMessage;
  int? charityID;
  bool? emeraldOrCoin;
  String? donationAmount;
  String? createdAt;
  String? modifiedAt;

  CharityHistoryModel(
      {this.id,
        this.donor,
        this.logMessage,
        this.charityID,
        this.emeraldOrCoin,
        this.donationAmount,
        this.createdAt,
        this.modifiedAt});

  CharityHistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    donor = json['donor'];
    logMessage = json['logMessage'];
    charityID = json['charityID'];
    emeraldOrCoin = json['emeraldOrCoin'];
    donationAmount = json['donationAmount'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['donor'] = this.donor;
    data['logMessage'] = this.logMessage;
    data['charityID'] = this.charityID;
    data['emeraldOrCoin'] = this.emeraldOrCoin;
    data['donationAmount'] = this.donationAmount;
    data['createdAt'] = this.createdAt;
    data['modifiedAt'] = this.modifiedAt;
    return data;
  }
}
