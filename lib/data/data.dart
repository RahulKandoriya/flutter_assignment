class Data {
  Quotes quotes;
  Prayers prayers;
  List<VfwImages> vfwImages;
  List<VfwVideos> vfwVideos;

  Data({this.quotes, this.prayers, this.vfwImages, this.vfwVideos});

  Data.fromJson(Map<String, dynamic> json) {
    quotes =
    json['quotes'] != null ? new Quotes.fromJson(json['quotes']) : null;
    prayers =
    json['prayers'] != null ? new Prayers.fromJson(json['prayers']) : null;
    if (json['vfw_images'] != null) {
      vfwImages = new List<VfwImages>();
      json['vfw_images'].forEach((v) {
        vfwImages.add(new VfwImages.fromJson(v));
      });
    }
    if (json['vfw_videos'] != null) {
      vfwVideos = new List<VfwVideos>();
      json['vfw_videos'].forEach((v) {
        vfwVideos.add(new VfwVideos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quotes != null) {
      data['quotes'] = this.quotes.toJson();
    }
    if (this.prayers != null) {
      data['prayers'] = this.prayers.toJson();
    }
    if (this.vfwImages != null) {
      data['vfw_images'] = this.vfwImages.map((v) => v.toJson()).toList();
    }
    if (this.vfwVideos != null) {
      data['vfw_videos'] = this.vfwVideos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quotes {
  List<QuoteImages> quoteImages;

  Quotes({this.quoteImages});

  Quotes.fromJson(Map<String, dynamic> json) {
    if (json['quote_images'] != null) {
      quoteImages = new List<QuoteImages>();
      json['quote_images'].forEach((v) {
        quoteImages.add(new QuoteImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quoteImages != null) {
      data['quote_images'] = this.quoteImages.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuoteImages {
  String model;
  int pk;
  PrayerImages fields;

  QuoteImages({this.model, this.pk, this.fields});

  QuoteImages.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
    json['fields'] != null ? new PrayerImages.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields.toJson();
    }
    return data;
  }
}

class VfwImages {
  String model;
  int pk;
  VfwImagesFields fields;

  VfwImages({this.model, this.pk, this.fields});

  VfwImages.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
    json['fields'] != null ? new VfwImagesFields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields.toJson();
    }
    return data;
  }
}

class VfwImagesFields {
  String url;
  String text;
  String name;

  VfwImagesFields({this.url, this.text, this.name});

  VfwImagesFields.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    data['name'] = this.name;
    return data;
  }
}

class Prayers {
  List<PrayerImages> prayerImages;
  List<PrayerVideos> prayerVideos;
  List<PrayerAudio> prayerAudio;

  Prayers({this.prayerImages, this.prayerVideos, this.prayerAudio});

  Prayers.fromJson(Map<String, dynamic> json) {
    if (json['prayer_images'] != null) {
      prayerImages = new List<PrayerImages>();
      json['prayer_images'].forEach((v) {
        prayerImages.add(new PrayerImages.fromJson(v));
      });
    }
    if (json['prayer_videos'] != null) {
      prayerVideos = new List<PrayerVideos>();
      json['prayer_videos'].forEach((v) {
        prayerVideos.add(new PrayerVideos.fromJson(v));
      });
    }
    if (json['prayer_audio'] != null) {
      prayerAudio = new List<PrayerAudio>();
      json['prayer_audio'].forEach((v) {
        prayerAudio.add(new PrayerAudio.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prayerImages != null) {
      data['prayer_images'] = this.prayerImages.map((v) => v.toJson()).toList();
    }
    if (this.prayerVideos != null) {
      data['prayer_videos'] = this.prayerVideos.map((v) => v.toJson()).toList();
    }
    if (this.prayerAudio != null) {
      data['prayer_audio'] = this.prayerAudio.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PrayerImages {
  String url;
  String description;
  String name;

  PrayerImages({this.url, this.description, this.name});

  PrayerImages.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    description = json['description'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['description'] = this.description;
    data['name'] = this.name;
    return data;
  }
}

class PrayerVideos {
  String url;
  String description;
  String name;
  String duration;
  String language;
  String videoTitle;

  PrayerVideos(
      {this.url,
        this.description,
        this.name,
        this.duration,
        this.language,
        this.videoTitle});

  PrayerVideos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    description = json['description'];
    name = json['name'];
    duration = json['duration'];
    language = json['language'];
    videoTitle = json['video_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['description'] = this.description;
    data['name'] = this.name;
    data['duration'] = this.duration;
    data['language'] = this.language;
    data['video_title'] = this.videoTitle;
    return data;
  }
}

class PrayerAudio {
  String url;
  String description;
  String name;
  String bitrate;
  String duration;

  PrayerAudio({this.url, this.description, this.name, this.bitrate, this.duration});

  PrayerAudio.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    description = json['description'];
    name = json['name'];
    bitrate = json['bitrate'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['description'] = this.description;
    data['name'] = this.name;
    data['bitrate'] = this.bitrate;
    data['duration'] = this.duration;
    return data;
  }
}

class VfwVideos {
  String url;
  String name;
  String file;

  VfwVideos({this.url, this.name, this.file});

  VfwVideos.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    name = json['name'];
    file = json['file'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['name'] = this.name;
    data['file'] = this.file;
    return data;
  }
}