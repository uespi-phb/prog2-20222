class BaseError {
  final String message;

  BaseError(this.message);
}

class TransactionError extends BaseError {
  TransactionError(super.message);
}
