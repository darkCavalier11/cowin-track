class Vaccine {
  final String centerId;
  final String name;
  final String stateName;
  final String districtName;
  final String blockName;
  final int pincode;
  final String feeType;
  final int minAgeLimit;
  final String vaccine;
  final List<String> slots;

  Vaccine({
    this.centerId,
    this.name,
    this.stateName,
    this.districtName,
    this.blockName,
    this.pincode,
    this.feeType,
    this.minAgeLimit,
    this.vaccine,
    this.slots,
  });
}
