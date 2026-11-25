class Constant{

  ///Common Padding
  static const double commonContainerRadius = 4.0;
  static const double miniPadding = 2.0;
  static const double tinyPadding = 4.0;
  static const double smallPadding = 8.0;
  static const double smallXPadding = 12.0;
  static const double normalPadding = 16.0;
  static const double normalXPadding = 18.0;
  static const double largePadding = 24.0;
  static const int totalCommission = 20;

  //OnBoarding
  static const double onBoardingLogoWidth = 200;

  /// Common Margin
  static const double miniMargin= 2.0;
  static const double tinyMargin = 4.0;
  static const double smallMargin = 8.0;
  static const double smallXMargin = 12.0;
  static const double normalMargin = 16.0;
  static const double normalXMargin = 18.0;
  static const double largeMargin = 24.0;

  /// Common Space
  static const double miniSpace = 2.0;
  static const double tinySpace = 4.0;
  static const double smallSpace = 8.0;
  static const double smallXSpace = 12.0;
  static const double normalSpace = 16.0;
  static const double normalXSpace = 18.0;
  static const double largeSpace = 24.0;

  /// Login Screen Constant
  static const int codeResendTime = 60;
  static const int phoneMaxLength = 10;
  static const int apiTimeOutSecond = 30;
  static  int initialYear = 1990;

  /// Dashboard Screen Constant Bottom Navigation Menu Size
  static const double bnvIconHeight = 24;
  static const double bnvIconWidth = 24;
  static const double labelAndTextFieldSpace = 8;
  static const double textFieldToTextFieldSpace = 16;
  static const double titleToLabel = 52;
  static const double textFieldOrOtherToButton = 24;
  static const double settingTitleToSubTitle = 10;
  static const double settingDottedLineToText = 14;
  static const double textFieldToLabelSpace = 10;
  static const double titleToTextSpace = 16;

  ///Filter Screen
  static const double textToFilterChipSpace = 6;
  static const double filterChipToTextSpace = 10;
  static const double allScreenHorizontalPadding = 18;
  static const double allScreenVerticalPadding = 18;
  static const double toolbarHeight = 130.0;

  static const double profileScreenIconSize = 24;

  ///Notification
  static const String notificationTitle = "title";
  static const String notificationBody = "body";
  static const String notificationMessage = "message";

  ///Regex
  static RegExp strongPassReg = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');

  ///icons height and width
  static const String commonDateFormat = "dd-MM-yyyy";

  /// File Type Extensions
  static const String extensionPDF = "pdf";
  static const String extensionJPG = "jpg";
  static const String extensionJPEG = "jpeg";
  static const String extensionPNG = "png";
  static const String extensionCapsPNG = "PNG";
  static const String status = "status";
  static const String responseStatusKey = "success";

  ///TimeOut
  static const int apiTimeOutStatusCode = 500;

  ///back Icon height and width
  static const double backIconHeightAndWidth = 16;

  static const String travelAgent = "travelAgent";
  static const String guest = "guest";

  //
  static const String queenOutlet = "queensOutlet";
  static const String queensAss = "queensAss";
  static const String queensManual = "queensManual";


  static const String currencySymbol = "IDR";

  static const String currencyIDR = "IDR";
  static const String currencyUSD = "USD";


  static const String fileSupportDoc = "doc";
  static const String fileSupportDocx = "docx";
  static const String fileSupportDot = "dot";
  static const String fileSupportPdf = "pdf";
  static const String fileSupportzip = "zip";

  static const String eventInputDateFormat = "yyyy-MM-dd";
  static const String monthNameFormat = "MMM";
  static const String dateFormat = "dd";
  static const String yearFormat = "yyyy";

  static const String inputTimeFormat = "HH:mm";
  static const String outPutTimeFormat = "hh:mm a";


  static const String inputDateFormat = "yyyy-MM-dd";
  static const String apiPassDateFormat = "MM/dd/yyyy";
  static const String outPutDateFormat = "dd/MM/yyyy";
  static const String bookingOutPutDateFormat = "dd-MMM-yyyy";

  static final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');


  /// font size
  static const double miniFont = 4.0;
  static const double xMiniFont = 8.0;
  static const double smallFont = 10.0;
  static const double xSmallFont = 12.0;
  static const double xxSmallFont = 14.0;
  static const double normalFont = 16.0;
  static const double xNormalFont = 18.0;
  static const double xxNormalFont = 20.0;
  static const double xxxNormalFont = 22.0;
  static const double largeFont = 24.0;
  static const double xLargeFont = 28.0;
  static const double xxLargeFont = 32.0;
  static const double xxxLargeFont = 44.0;

  static const double masterAPICallTime = 24;
  static const double profileAPICallTime = 6;
//
// const MIN_LENGTH_NAME = 2;
// const MAX_LENGTH_NAME = 32;
// const PASSWORD_LENGTH = 6;
// const OTP_LENGTH = 6;
// File Type Extensions


}

  enum FilePickerErrorType { failed, cancel, invalidFileType, invalidFileSize }
