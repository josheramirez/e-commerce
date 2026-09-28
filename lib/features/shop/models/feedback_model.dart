
class FeedbackModel {
  String id;
  String userId;
  String postId;
  String productId;
  String feedback;

  FeedbackModel({
    required this.id,
    required this.userId,
    required this.postId,
    required this.productId,
    required this.feedback
  });

  static FeedbackModel empty() => FeedbackModel(id: '', userId: '', postId: '', feedback: '', productId: '');

    /// Convert Model to Json/Map
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'userId': userId,
      'postId': postId,
      'productId': productId,
      'feedback': feedback
    };
  }

}