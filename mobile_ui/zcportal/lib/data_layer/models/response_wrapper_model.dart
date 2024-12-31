// ==============================================================
//------------------------------------The Error  Wrapper ---------------------
//=========================================================================

class ErrorWrapper {
  final String error;
  final String message;

  const ErrorWrapper({required this.error, required this.message});

  @override
  //give me the message only from this whole class:
  String toString() => message;
}

//===============================================================================
//------------------------------- The Whole Response Wrapper Model --------------------
//===============================================================================
class ResponseWrapperModel {
  final bool isSucceeded;
  final int statusCode;
  final dynamic responseBody;
  final ErrorWrapper? error;
  final List<dynamic>? arguments;

//constructor wrap the response with all the above data types:
  const ResponseWrapperModel({
    required this.isSucceeded,
    required this.statusCode,
    this.responseBody, // u don't need to put a value for the responseBody sometimes, for ex: if failure, then u would use the "error" directly instead of using the "responseBody"
    this.error,
    this.arguments,
  });
  //Success Constructor:
  const ResponseWrapperModel.success({required this.responseBody})
      : statusCode = 200,
        isSucceeded = true,
        error = null,
        arguments = null;

//unwrap everything mentioned in the response wrapper model and give me the responseBody only:
  anyReceivedDataType unwrap<anyReceivedDataType>() =>
      responseBody as anyReceivedDataType;
}
