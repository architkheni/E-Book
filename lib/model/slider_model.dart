class SliderModel {
  int? mobileSliderId;
  String? title;
  String? slideImage;
  String? link;

  SliderModel({this.mobileSliderId, this.title, this.slideImage, this.link});

  SliderModel.fromJson(Map<String, dynamic> json) {
    mobileSliderId = json['mobile_slider_id'];
    title = json['title'];
    slideImage = json['slide_image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile_slider_id'] = this.mobileSliderId;
    data['title'] = this.title;
    data['slide_image'] = this.slideImage;
    data['link'] = this.link;
    return data;
  }
}
