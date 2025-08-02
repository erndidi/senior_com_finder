class SeniorCommunity {
  final String name;
  final String address;
  final String phoneNumber;
  final String? contact;
  final String? email;
  final String? hours;
  final String? website;
  final String? marketingCopy;
  final double? rating;
  final int? reviewCount;

  SeniorCommunity({
    required this.name,
    required this.address,
    required this.phoneNumber,
    this.contact,
    this.email,
    this.hours,
    this.website,
    this.marketingCopy,
    this.rating,
    this.reviewCount,
  });

  factory SeniorCommunity.fromJson(Map<String, dynamic> json) {
    return SeniorCommunity(
      name: json['name'] as String,
      address: json['address'] as String,
      phoneNumber: json['phoneNumber'] as String,
      contact: json['contact'] as String?,
      email: json['email'] as String?,
      hours: json['hours'] as String?,
      website: json['website'] as String?,
      marketingCopy: json['marketingCopy'] as String?,
      rating: json['rating']?.toDouble(),
      reviewCount: json['reviewCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'contact': contact,
      'email': email,
      'hours': hours,
      'website': website,
      'marketingCopy': marketingCopy,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}