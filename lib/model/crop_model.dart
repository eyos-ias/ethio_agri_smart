class CropModel {
  String? crop_title;

  String? crop_poster_url;
  String? data_url;

  CropModel(this.crop_title, this.crop_poster_url);
  CropModel.withDataUrl(this.crop_title, this.crop_poster_url, this.data_url);
}
