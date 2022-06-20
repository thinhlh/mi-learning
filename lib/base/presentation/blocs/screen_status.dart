import 'package:equatable/equatable.dart';

enum Status {
  none,
  loading,
}

class ScreenStatus extends Equatable {
  final Status status;
  final String? errorMessage;

  ScreenStatus({
    required this.status,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, errorMessage];

  factory ScreenStatus.loading() => ScreenStatus(
        status: Status.loading,
      );

  factory ScreenStatus.error(String errorMessage) => ScreenStatus(
        status: Status.none,
        errorMessage: errorMessage,
      );

  factory ScreenStatus.none() => ScreenStatus(status: Status.none);

  bool get isError => errorMessage != null;
  bool get isLoading => status == Status.loading;
}
