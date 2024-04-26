// class SliderModel {
//   Data? data;
//   String? message;
//   List<Null>? error;
//   int? status;
//
//   SliderModel({this.data, this.message, this.error, this.status});
//
//   SliderModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ?  Data.fromJson(json['data']) : null;
//     message = json['message'];
//     if (json['error'] != null) {
//       error = [];
//       json['error'].forEach((v) {
//         error!.add(v);
//       });
//     }
//     status = json['status'];
//   }
//
//   // Map<String, dynamic> toJson() {
//   //   final Map<String, dynamic> data = new Map<String, dynamic>();
//   //   if (this.data != null) {
//   //     data['data'] = this.data!.toJson();
//   //   }
//   //   data['message'] = this.message;
//   //   if (this.error != null) {
//   //     data['error'] = this.error!.map((v) => v.toJson()).toList();
//   //   }
//   //   data['status'] = this.status;
//   //   return data;
//   // }
// }
//
// class Data {
//   List<Sliders>? sliders;
//
//   Data({this.sliders});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['sliders'] != null) {
//       sliders = [];
//       json['sliders'].forEach((v) {
//         sliders!.add( Sliders.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {};
//     if (sliders != null) {
//       data['sliders'] = sliders!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

class Sliders {
  String? image;

  Sliders({this.image});

  Sliders.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['image'] =image;
    return data;
  }
}