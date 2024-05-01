import 'package:mandoob/features/purchase/data/responses/message_responses.dart';
import 'package:mandoob/features/purchase/domain/model/message_model.dart';

extension MessagePurchaseResponseMapper on MessageResponses? {
  MessageModel toDomain() {
    return MessageModel(
      status: this?.status ?? false,
      message: this?.message ?? '',
    );
  }
}
