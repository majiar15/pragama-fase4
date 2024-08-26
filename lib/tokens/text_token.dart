import 'package:store_design_system/config.dart';

class StoreTextToken {
  StoreTextToken._();

  // Cart
  static String cartAppBarTitle = Config.instance.getText('cart', 'appBarTitle');
  static String cartEmptyCartMessage = Config.instance.getText('cart', 'emptyCartMessage');
  static String cartTotalPurchaseLabel = Config.instance.getText('cart', 'totalPurchaseLabel');
  static String cartBuyButtonLabel = Config.instance.getText('cart', 'buyButtonLabel');
  static String cartPriceLabel = Config.instance.getText('cart', 'priceLabel');
  static String cartTotalPriceLabel = Config.instance.getText('cart', 'totalPriceLabel');

  // Catalog
  static String catalogSearchLabel = Config.instance.getText('catalog', 'searchLabel');
  static String catalogProductCountText = Config.instance.getText('catalog', 'productCountText');
  static String catalogFilterAllOption = Config.instance.getText('catalog', 'filterAllOption');

  // Create Account
  static String createAccountTitleLine1 = Config.instance.getText('createAccount', 'titleLine1');
  static String createAccountTitleLine2 = Config.instance.getText('createAccount', 'titleLine2');
  static String createAccountUsernameLabel = Config.instance.getText('createAccount', 'usernameLabel');
  static String createAccountUsernameValidatorEmpty = Config.instance.getText('createAccount', 'usernameValidatorEmpty');
  static String createAccountPasswordLabel = Config.instance.getText('createAccount', 'passwordLabel');
  static String createAccountPasswordValidatorEmpty = Config.instance.getText('createAccount', 'passwordValidatorEmpty');
  static String createAccountPasswordValidatorShort = Config.instance.getText('createAccount', 'passwordValidatorShort');
  static String createAccountConfirmPasswordLabel = Config.instance.getText('createAccount', 'confirmPasswordLabel');
  static String createAccountConfirmPasswordValidatorEmpty = Config.instance.getText('createAccount', 'confirmPasswordValidatorEmpty');
  static String createAccountConfirmPasswordValidatorMismatch = Config.instance.getText('createAccount', 'confirmPasswordValidatorMismatch');
  static String createAccountRegisterTermsPrefix = Config.instance.getText('createAccount', 'registerTermsPrefix');
  static String createAccountRegisterTermsButton = Config.instance.getText('createAccount', 'registerTermsButton');
  static String createAccountRegisterTermsSuffix = Config.instance.getText('createAccount', 'registerTermsSuffix');
  static String createAccountRegisterButtonLabel = Config.instance.getText('createAccount', 'registerButtonLabel');
  static String createAccountLoginLinkText = Config.instance.getText('createAccount', 'loginLinkText');
  static String createAccountLoginLinkLabel = Config.instance.getText('createAccount', 'loginLinkLabel');

  // Forgot Password
  static String forgotPasswordTitleLine1 = Config.instance.getText('forgotPassword', 'titleLine1');
  static String forgotPasswordTitleLine2 = Config.instance.getText('forgotPassword', 'titleLine2');
  static String forgotPasswordInputLabel = Config.instance.getText('forgotPassword', 'inputLabel');
  static String forgotPasswordEmptyEmailValidator = Config.instance.getText('forgotPassword', 'emptyEmailValidator');
  static String forgotPasswordInvalidEmailValidator = Config.instance.getText('forgotPassword', 'invalidEmailValidator');
  static String forgotPasswordNoteFeedback1 = Config.instance.getText('forgotPassword', 'noteFeedback1');
  static String forgotPasswordNoteFeedback2 = Config.instance.getText('forgotPassword', 'noteFeedback2');
  static String forgotPasswordButtonSendLabel = Config.instance.getText('forgotPassword', 'buttonSendLabel');

  // Home
  static String homeGreetingMorning = Config.instance.getText('home', 'greetingMorning');
  static String homeGreetingAfternoon = Config.instance.getText('home', 'greetingAfternoon');
  static String homeGreetingEvening = Config.instance.getText('home', 'greetingEvening');
  static String homeExploreRelevantProducts = Config.instance.getText('home', 'exploreRelevantProducts');
  static String homeTrendingProductsBannerProductsInOffer = Config.instance.getText('home', 'trendingProductsBannerProductsInOffer');
  static String homeTrendingProductsBannerLastDay = Config.instance.getText('home', 'trendingProductsBannerLastDay');
  static String homeTrendingProductsBannerButtonViewAll = Config.instance.getText('home', 'trendingProductsBannerButtonViewAll');

  // Login
  static String loginWelcome = Config.instance.getText('login', 'welcome');
  static String loginWelcomeBack = Config.instance.getText('login', 'welcomeBack');
  static String loginUsername = Config.instance.getText('login', 'username');
  static String loginUsernameValidation = Config.instance.getText('login', 'usernameValidation');
  static String loginPassword = Config.instance.getText('login', 'password');
  static String loginPasswordValidationEmpty = Config.instance.getText('login', 'passwordValidationEmpty');
  static String loginPasswordValidationShort = Config.instance.getText('login', 'passwordValidationShort');
  static String loginForgotPassword = Config.instance.getText('login', 'forgotPassword');
  static String loginButtonLabel = Config.instance.getText('login', 'loginButtonLabel');
  static String loginCreateAccount = Config.instance.getText('login', 'createAccount');
  static String loginRegister = Config.instance.getText('login', 'register');

  // Offer
  static String offerTitle = Config.instance.getText('offer', 'title');

  // Product Detail
  static String productDetailAppBarTitle = Config.instance.getText('productDetail', 'appBarTitle');
  static String productDetailProductDetails = Config.instance.getText('productDetail', 'productDetails');
  static String productDetailAddToCartButton = Config.instance.getText('productDetail', 'addToCartButton');
  static String productDetailSimilarProducts = Config.instance.getText('productDetail', 'similarProducts');

  // Support Contact
  static String supportContactTitle = Config.instance.getText('supportContact', 'title');
  static String supportContactNameLabel = Config.instance.getText('supportContact', 'nameLabel');
  static String supportContactNameValidator = Config.instance.getText('supportContact', 'nameValidator');
  static String supportContactEmailLabel = Config.instance.getText('supportContact', 'emailLabel');
  static String supportContactEmailValidatorEmpty = Config.instance.getText('supportContact', 'emailValidatorEmpty');
  static String supportContactEmailValidatorInvalid = Config.instance.getText('supportContact', 'emailValidatorInvalid');
  static String supportContactSubjectLabel = Config.instance.getText('supportContact', 'subjectLabel');
  static String supportContactSubjectValidator = Config.instance.getText('supportContact', 'subjectValidator');
  static String supportContactMessageLabel = Config.instance.getText('supportContact', 'messageLabel');
  static String supportContactMessageValidator = Config.instance.getText('supportContact', 'messageValidator');
  static String supportContactSendButton = Config.instance.getText('supportContact', 'sendButton');
  static String supportContactDialogTitle = Config.instance.getText('supportContact', 'dialogTitle');
  static String supportContactDialogContent = Config.instance.getText('supportContact', 'dialogContent');
  static String supportContactDialogCloseButton = Config.instance.getText('supportContact', 'dialogCloseButton');
  static String supportContactContactInformation = Config.instance.getText('supportContact', 'contactInformation');
  static String supportContactPhone = Config.instance.getText('supportContact', 'phone');
  static String supportContactEmail = Config.instance.getText('supportContact', 'email');
  static String supportContactAddress = Config.instance.getText('supportContact', 'address');
}