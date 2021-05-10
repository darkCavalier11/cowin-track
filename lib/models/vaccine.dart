class Vaccine {
  String centerId;
  String name;
  String address;
  String stateName;
  String districtName;
  String blockName;
  int pincode;
  String feeType;
  int minAgeLimit;
  String vaccine;
  List<String> slots;

  Vaccine({
    this.centerId,
    this.name,
    this.address,
    this.stateName,
    this.districtName,
    this.blockName,
    this.pincode,
    this.feeType,
    this.minAgeLimit,
    this.vaccine,
    this.slots,
  });

  Vaccine.fromJson(Map<String, dynamic> json) {
    centerId = json['center_id'];
    name = json['name'];
    address = json['address'];
    stateName = json['state_name'];
    districtName = json['district_name'];
    blockName = json['block_name'];
    pincode = json['pincode'];
    feeType = json['fee_type'];
    minAgeLimit = json['sessions']['min_age_limit'];
    vaccine = json['sessions']['vaccine'];
    slots = json['sessions']['slots'];
  }
}