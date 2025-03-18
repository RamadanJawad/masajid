class PrayerTime {
  int? id;
  int? masjidId;
  PrayersData? prayersData;
  IqamaTimesData? iqamaTimesData;
  String? date;
  String? createdAt;
  String? updatedAt;

  PrayerTime(
      {this.id,
        this.masjidId,
        this.prayersData,
        this.iqamaTimesData,
        this.date,
        this.createdAt,
        this.updatedAt});

  PrayerTime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    masjidId = json['masjid_id'];
    prayersData = json['prayers_data'] != null
        ? new PrayersData.fromJson(json['prayers_data'])
        : null;
    iqamaTimesData = json['iqama_times_data'] != null
        ? new IqamaTimesData.fromJson(json['iqama_times_data'])
        : null;
    date = json['date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['masjid_id'] = this.masjidId;
    if (this.prayersData != null) {
      data['prayers_data'] = this.prayersData!.toJson();
    }
    if (this.iqamaTimesData != null) {
      data['iqama_times_data'] = this.iqamaTimesData!.toJson();
    }
    data['date'] = this.date;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PrayersData {
  Coordinates? coordinates;
  String? date;
  CalculationParameters? calculationParameters;
  String? fajr;
  String? sunrise;
  String? dhuhr;
  String? asr;
  String? sunset;
  String? maghrib;
  String? isha;

  PrayersData(
      {this.coordinates,
        this.date,
        this.calculationParameters,
        this.fajr,
        this.sunrise,
        this.dhuhr,
        this.asr,
        this.sunset,
        this.maghrib,
        this.isha});

  PrayersData.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'] != null
        ? new Coordinates.fromJson(json['coordinates'])
        : null;
    date = json['date'];
    calculationParameters = json['calculationParameters'] != null
        ? new CalculationParameters.fromJson(json['calculationParameters'])
        : null;
    fajr = json['fajr'];
    sunrise = json['sunrise'];
    dhuhr = json['dhuhr'];
    asr = json['asr'];
    sunset = json['sunset'];
    maghrib = json['maghrib'];
    isha = json['isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.coordinates != null) {
      data['coordinates'] = this.coordinates!.toJson();
    }
    data['date'] = this.date;
    if (this.calculationParameters != null) {
      data['calculationParameters'] = this.calculationParameters!.toJson();
    }
    data['fajr'] = this.fajr;
    data['sunrise'] = this.sunrise;
    data['dhuhr'] = this.dhuhr;
    data['asr'] = this.asr;
    data['sunset'] = this.sunset;
    data['maghrib'] = this.maghrib;
    data['isha'] = this.isha;
    return data;
  }
}

class Coordinates {
  String? latitude;
  String? longitude;

  Coordinates({this.latitude, this.longitude});

  Coordinates.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}

class CalculationParameters {
  String? madhab;
  String? highLatitudeRule;
  Adjustments? adjustments;
  Adjustments? methodAdjustments;
  String? polarCircleResolution;
  String? rounding;
  String? shafaq;
  String? method;
  int? fajrAngle;
  int? ishaAngle;
  int? ishaInterval;
  int? maghribAngle;

  CalculationParameters(
      {this.madhab,
        this.highLatitudeRule,
        this.adjustments,
        this.methodAdjustments,
        this.polarCircleResolution,
        this.rounding,
        this.shafaq,
        this.method,
        this.fajrAngle,
        this.ishaAngle,
        this.ishaInterval,
        this.maghribAngle});

  CalculationParameters.fromJson(Map<String, dynamic> json) {
    madhab = json['madhab'];
    highLatitudeRule = json['highLatitudeRule'];
    adjustments = json['adjustments'] != null
        ? new Adjustments.fromJson(json['adjustments'])
        : null;
    methodAdjustments = json['methodAdjustments'] != null
        ? new Adjustments.fromJson(json['methodAdjustments'])
        : null;
    polarCircleResolution = json['polarCircleResolution'];
    rounding = json['rounding'];
    shafaq = json['shafaq'];
    method = json['method'];
    fajrAngle = json['fajrAngle'];
    ishaAngle = json['ishaAngle'];
    ishaInterval = json['ishaInterval'];
    maghribAngle = json['maghribAngle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['madhab'] = this.madhab;
    data['highLatitudeRule'] = this.highLatitudeRule;
    if (this.adjustments != null) {
      data['adjustments'] = this.adjustments!.toJson();
    }
    if (this.methodAdjustments != null) {
      data['methodAdjustments'] = this.methodAdjustments!.toJson();
    }
    data['polarCircleResolution'] = this.polarCircleResolution;
    data['rounding'] = this.rounding;
    data['shafaq'] = this.shafaq;
    data['method'] = this.method;
    data['fajrAngle'] = this.fajrAngle;
    data['ishaAngle'] = this.ishaAngle;
    data['ishaInterval'] = this.ishaInterval;
    data['maghribAngle'] = this.maghribAngle;
    return data;
  }
}

class Adjustments {
  int? fajr;
  int? sunrise;
  int? dhuhr;
  int? asr;
  int? maghrib;
  int? isha;

  Adjustments(
      {this.fajr, this.sunrise, this.dhuhr, this.asr, this.maghrib, this.isha});

  Adjustments.fromJson(Map<String, dynamic> json) {
    fajr = json['fajr'];
    sunrise = json['sunrise'];
    dhuhr = json['dhuhr'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    isha = json['isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fajr'] = this.fajr;
    data['sunrise'] = this.sunrise;
    data['dhuhr'] = this.dhuhr;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['isha'] = this.isha;
    return data;
  }
}

class IqamaTimesData {
  String? fajr;
  String? dhuhr;
  String? asr;
  String? maghrib;
  String? isha;

  IqamaTimesData({this.fajr, this.dhuhr, this.asr, this.maghrib, this.isha});

  IqamaTimesData.fromJson(Map<String, dynamic> json) {
    fajr = json['fajr'];
    dhuhr = json['dhuhr'];
    asr = json['asr'];
    maghrib = json['maghrib'];
    isha = json['isha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fajr'] = this.fajr;
    data['dhuhr'] = this.dhuhr;
    data['asr'] = this.asr;
    data['maghrib'] = this.maghrib;
    data['isha'] = this.isha;
    return data;
  }
}