import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String statusMessage;

  const ErrorMessageModel({required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json,
          {List? errorMsg}) =>
      ErrorMessageModel(statusMessage: errorMsg ?? json['error']);

  @override
  List<Object> get props => [statusMessage];
}
