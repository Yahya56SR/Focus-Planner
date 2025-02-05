import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @fp.
  ///
  /// In en, this message translates to:
  /// **'FocusPlanner'**
  String get fp;

  /// No description provided for @organizeYour.
  ///
  /// In en, this message translates to:
  /// **'Organize Your'**
  String get organizeYour;

  /// No description provided for @studies.
  ///
  /// In en, this message translates to:
  /// **'Studies'**
  String get studies;

  /// No description provided for @enhanceYour.
  ///
  /// In en, this message translates to:
  /// **'Enhance Your'**
  String get enhanceYour;

  /// No description provided for @focus.
  ///
  /// In en, this message translates to:
  /// **'Focus'**
  String get focus;

  /// No description provided for @textOfIntro.
  ///
  /// In en, this message translates to:
  /// **'Start a new Era of \nextra-focus to take the'**
  String get textOfIntro;

  /// No description provided for @slogan.
  ///
  /// In en, this message translates to:
  /// **'Road Of Success'**
  String get slogan;

  /// No description provided for @createAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Create a new Account'**
  String get createAccountTitle;

  /// No description provided for @createAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To start the challenge'**
  String get createAccountSubtitle;

  /// No description provided for @selectionSignIn.
  ///
  /// In en, this message translates to:
  /// **'Or, if you have already an account;'**
  String get selectionSignIn;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @agree.
  ///
  /// In en, this message translates to:
  /// **'If you create an account, you agree with our'**
  String get agree;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get and;

  /// No description provided for @termsOfUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termsOfUse;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign In to your account'**
  String get signInTitle;

  /// No description provided for @selectionCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Or, if you don\'t have an account;'**
  String get selectionCreateAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create an Account'**
  String get createAccount;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password ?'**
  String get forgotPassword;

  /// No description provided for @choice.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get choice;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @idOrEmail.
  ///
  /// In en, this message translates to:
  /// **'ID or Email'**
  String get idOrEmail;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your password'**
  String get resetPasswordTitle;

  /// No description provided for @createId.
  ///
  /// In en, this message translates to:
  /// **'Create an ID'**
  String get createId;

  /// No description provided for @newId.
  ///
  /// In en, this message translates to:
  /// **'Your new ID'**
  String get newId;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @helloMessage.
  ///
  /// In en, this message translates to:
  /// **'Hi, you\'ve created (or logged in) your account, and now; let\'s take the'**
  String get helloMessage;

  /// No description provided for @timetableIntroTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Timetable'**
  String get timetableIntroTitle;

  /// No description provided for @timetableSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To organize your studies !'**
  String get timetableSubtitle;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter It'**
  String get enter;

  /// No description provided for @importXlsx.
  ///
  /// In en, this message translates to:
  /// **'import a xlsx file'**
  String get importXlsx;

  /// No description provided for @mondayTitle.
  ///
  /// In en, this message translates to:
  /// **'Monday Timetable'**
  String get mondayTitle;

  /// No description provided for @subject.
  ///
  /// In en, this message translates to:
  /// **'Subject No°'**
  String get subject;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'From'**
  String get from;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get to;

  /// No description provided for @tuesdayTitle.
  ///
  /// In en, this message translates to:
  /// **'Tuesday Timetable'**
  String get tuesdayTitle;

  /// No description provided for @wednesdayTitle.
  ///
  /// In en, this message translates to:
  /// **'Wednesday Timetable'**
  String get wednesdayTitle;

  /// No description provided for @thursdayTitle.
  ///
  /// In en, this message translates to:
  /// **'Thursday Timetable'**
  String get thursdayTitle;

  /// No description provided for @fridayTitle.
  ///
  /// In en, this message translates to:
  /// **'Friday Timetable'**
  String get fridayTitle;

  /// No description provided for @saturdayTitle.
  ///
  /// In en, this message translates to:
  /// **'Saturday Timetable'**
  String get saturdayTitle;

  /// No description provided for @weekendChoice.
  ///
  /// In en, this message translates to:
  /// **'It\'s a Weekend'**
  String get weekendChoice;

  /// No description provided for @toDoTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter Some Tasks'**
  String get toDoTitle;

  /// No description provided for @toDoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'to Enhance your Focus'**
  String get toDoSubtitle;

  /// No description provided for @go.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go'**
  String get go;

  /// No description provided for @msToDoChoice.
  ///
  /// In en, this message translates to:
  /// **'import from Microsoft To Do'**
  String get msToDoChoice;

  /// No description provided for @googleTasks.
  ///
  /// In en, this message translates to:
  /// **'import from Google Tasks'**
  String get googleTasks;

  /// No description provided for @fixedTasksTitle.
  ///
  /// In en, this message translates to:
  /// **'Fixed Tasks'**
  String get fixedTasksTitle;

  /// No description provided for @allowPermissionsTitle.
  ///
  /// In en, this message translates to:
  /// **'Allow Permissions'**
  String get allowPermissionsTitle;

  /// No description provided for @allowNotificationsInDoNotDisturbMode.
  ///
  /// In en, this message translates to:
  /// **'Allow notifications in Do Not Disturb mode'**
  String get allowNotificationsInDoNotDisturbMode;

  /// No description provided for @theLastStepTitle.
  ///
  /// In en, this message translates to:
  /// **'For The Last Step'**
  String get theLastStepTitle;

  /// No description provided for @theLastStepSubtitle.
  ///
  /// In en, this message translates to:
  /// **'We need to know your country'**
  String get theLastStepSubtitle;

  /// No description provided for @af.
  ///
  /// In en, this message translates to:
  /// **'Afghanistan'**
  String get af;

  /// No description provided for @al.
  ///
  /// In en, this message translates to:
  /// **'Albania'**
  String get al;

  /// No description provided for @dz.
  ///
  /// In en, this message translates to:
  /// **'Algeria'**
  String get dz;

  /// No description provided for @as.
  ///
  /// In en, this message translates to:
  /// **'American Samoa'**
  String get as;

  /// No description provided for @ad.
  ///
  /// In en, this message translates to:
  /// **'Andorra'**
  String get ad;

  /// No description provided for @ao.
  ///
  /// In en, this message translates to:
  /// **'Angola'**
  String get ao;

  /// No description provided for @ai.
  ///
  /// In en, this message translates to:
  /// **'Anguilla'**
  String get ai;

  /// No description provided for @aq.
  ///
  /// In en, this message translates to:
  /// **'Antarctica'**
  String get aq;

  /// No description provided for @ag.
  ///
  /// In en, this message translates to:
  /// **'Antigua and Barbuda'**
  String get ag;

  /// No description provided for @aR.
  ///
  /// In en, this message translates to:
  /// **'Argentina'**
  String get aR;

  /// No description provided for @am.
  ///
  /// In en, this message translates to:
  /// **'Armenia'**
  String get am;

  /// No description provided for @aw.
  ///
  /// In en, this message translates to:
  /// **'Aruba'**
  String get aw;

  /// No description provided for @au.
  ///
  /// In en, this message translates to:
  /// **'Australia'**
  String get au;

  /// No description provided for @at.
  ///
  /// In en, this message translates to:
  /// **'Austria'**
  String get at;

  /// No description provided for @az.
  ///
  /// In en, this message translates to:
  /// **'Azerbaijan'**
  String get az;

  /// No description provided for @bs.
  ///
  /// In en, this message translates to:
  /// **'Bahamas'**
  String get bs;

  /// No description provided for @bh.
  ///
  /// In en, this message translates to:
  /// **'Bahrain'**
  String get bh;

  /// No description provided for @bd.
  ///
  /// In en, this message translates to:
  /// **'Bangladesh'**
  String get bd;

  /// No description provided for @bb.
  ///
  /// In en, this message translates to:
  /// **'Barbados'**
  String get bb;

  /// No description provided for @by.
  ///
  /// In en, this message translates to:
  /// **'Belarus'**
  String get by;

  /// No description provided for @be.
  ///
  /// In en, this message translates to:
  /// **'Belgium'**
  String get be;

  /// No description provided for @bz.
  ///
  /// In en, this message translates to:
  /// **'Belize'**
  String get bz;

  /// No description provided for @bj.
  ///
  /// In en, this message translates to:
  /// **'Benin'**
  String get bj;

  /// No description provided for @bm.
  ///
  /// In en, this message translates to:
  /// **'Bermuda'**
  String get bm;

  /// No description provided for @bt.
  ///
  /// In en, this message translates to:
  /// **'Bhutan'**
  String get bt;

  /// No description provided for @bo.
  ///
  /// In en, this message translates to:
  /// **'Bolivia'**
  String get bo;

  /// No description provided for @ba.
  ///
  /// In en, this message translates to:
  /// **'Bosnia and Herzegovina'**
  String get ba;

  /// No description provided for @bw.
  ///
  /// In en, this message translates to:
  /// **'Botswana'**
  String get bw;

  /// No description provided for @br.
  ///
  /// In en, this message translates to:
  /// **'Brazil'**
  String get br;

  /// No description provided for @bn.
  ///
  /// In en, this message translates to:
  /// **'Brunei'**
  String get bn;

  /// No description provided for @bg.
  ///
  /// In en, this message translates to:
  /// **'Bulgaria'**
  String get bg;

  /// No description provided for @bf.
  ///
  /// In en, this message translates to:
  /// **'Burkina Faso'**
  String get bf;

  /// No description provided for @bi.
  ///
  /// In en, this message translates to:
  /// **'Burundi'**
  String get bi;

  /// No description provided for @cv.
  ///
  /// In en, this message translates to:
  /// **'Cabo Verde'**
  String get cv;

  /// No description provided for @kh.
  ///
  /// In en, this message translates to:
  /// **'Cambodia'**
  String get kh;

  /// No description provided for @cm.
  ///
  /// In en, this message translates to:
  /// **'Cameroon'**
  String get cm;

  /// No description provided for @ca.
  ///
  /// In en, this message translates to:
  /// **'Canada'**
  String get ca;

  /// No description provided for @ky.
  ///
  /// In en, this message translates to:
  /// **'Cayman Islands'**
  String get ky;

  /// No description provided for @cf.
  ///
  /// In en, this message translates to:
  /// **'Central African Republic'**
  String get cf;

  /// No description provided for @td.
  ///
  /// In en, this message translates to:
  /// **'Chad'**
  String get td;

  /// No description provided for @cl.
  ///
  /// In en, this message translates to:
  /// **'Chile'**
  String get cl;

  /// No description provided for @cn.
  ///
  /// In en, this message translates to:
  /// **'China'**
  String get cn;

  /// No description provided for @co.
  ///
  /// In en, this message translates to:
  /// **'Colombia'**
  String get co;

  /// No description provided for @km.
  ///
  /// In en, this message translates to:
  /// **'Comoros'**
  String get km;

  /// No description provided for @cg.
  ///
  /// In en, this message translates to:
  /// **'Congo'**
  String get cg;

  /// No description provided for @cd.
  ///
  /// In en, this message translates to:
  /// **'Congo (DRC)'**
  String get cd;

  /// No description provided for @cr.
  ///
  /// In en, this message translates to:
  /// **'Costa Rica'**
  String get cr;

  /// No description provided for @ci.
  ///
  /// In en, this message translates to:
  /// **'Côte d\'Ivoire'**
  String get ci;

  /// No description provided for @hr.
  ///
  /// In en, this message translates to:
  /// **'Croatia'**
  String get hr;

  /// No description provided for @cu.
  ///
  /// In en, this message translates to:
  /// **'Cuba'**
  String get cu;

  /// No description provided for @cy.
  ///
  /// In en, this message translates to:
  /// **'Cyprus'**
  String get cy;

  /// No description provided for @cz.
  ///
  /// In en, this message translates to:
  /// **'Czechia'**
  String get cz;

  /// No description provided for @dk.
  ///
  /// In en, this message translates to:
  /// **'Denmark'**
  String get dk;

  /// No description provided for @dj.
  ///
  /// In en, this message translates to:
  /// **'Djibouti'**
  String get dj;

  /// No description provided for @dm.
  ///
  /// In en, this message translates to:
  /// **'Dominica'**
  String get dm;

  /// No description provided for @dO.
  ///
  /// In en, this message translates to:
  /// **'Dominican Republic'**
  String get dO;

  /// No description provided for @ec.
  ///
  /// In en, this message translates to:
  /// **'Ecuador'**
  String get ec;

  /// No description provided for @eg.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get eg;

  /// No description provided for @sv.
  ///
  /// In en, this message translates to:
  /// **'El Salvador'**
  String get sv;

  /// No description provided for @gq.
  ///
  /// In en, this message translates to:
  /// **'Equatorial Guinea'**
  String get gq;

  /// No description provided for @er.
  ///
  /// In en, this message translates to:
  /// **'Eritrea'**
  String get er;

  /// No description provided for @ee.
  ///
  /// In en, this message translates to:
  /// **'Estonia'**
  String get ee;

  /// No description provided for @sz.
  ///
  /// In en, this message translates to:
  /// **'Eswatini'**
  String get sz;

  /// No description provided for @et.
  ///
  /// In en, this message translates to:
  /// **'Ethiopia'**
  String get et;

  /// No description provided for @fj.
  ///
  /// In en, this message translates to:
  /// **'Fiji'**
  String get fj;

  /// No description provided for @fi.
  ///
  /// In en, this message translates to:
  /// **'Finland'**
  String get fi;

  /// No description provided for @fR.
  ///
  /// In en, this message translates to:
  /// **'France'**
  String get fR;

  /// No description provided for @ga.
  ///
  /// In en, this message translates to:
  /// **'Gabon'**
  String get ga;

  /// No description provided for @gm.
  ///
  /// In en, this message translates to:
  /// **'Gambia'**
  String get gm;

  /// No description provided for @ge.
  ///
  /// In en, this message translates to:
  /// **'Georgia'**
  String get ge;

  /// No description provided for @de.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get de;

  /// No description provided for @gh.
  ///
  /// In en, this message translates to:
  /// **'Ghana'**
  String get gh;

  /// No description provided for @gr.
  ///
  /// In en, this message translates to:
  /// **'Greece'**
  String get gr;

  /// No description provided for @gd.
  ///
  /// In en, this message translates to:
  /// **'Grenada'**
  String get gd;

  /// No description provided for @gu.
  ///
  /// In en, this message translates to:
  /// **'Guam'**
  String get gu;

  /// No description provided for @gt.
  ///
  /// In en, this message translates to:
  /// **'Guatemala'**
  String get gt;

  /// No description provided for @gn.
  ///
  /// In en, this message translates to:
  /// **'Guinea'**
  String get gn;

  /// No description provided for @gw.
  ///
  /// In en, this message translates to:
  /// **'Guinea-Bissau'**
  String get gw;

  /// No description provided for @gy.
  ///
  /// In en, this message translates to:
  /// **'Guyana'**
  String get gy;

  /// No description provided for @ht.
  ///
  /// In en, this message translates to:
  /// **'Haiti'**
  String get ht;

  /// No description provided for @hn.
  ///
  /// In en, this message translates to:
  /// **'Honduras'**
  String get hn;

  /// No description provided for @hu.
  ///
  /// In en, this message translates to:
  /// **'Hungary'**
  String get hu;

  /// No description provided for @iS.
  ///
  /// In en, this message translates to:
  /// **'Iceland'**
  String get iS;

  /// No description provided for @iN.
  ///
  /// In en, this message translates to:
  /// **'India'**
  String get iN;

  /// No description provided for @id.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get id;

  /// No description provided for @ir.
  ///
  /// In en, this message translates to:
  /// **'Iran'**
  String get ir;

  /// No description provided for @iq.
  ///
  /// In en, this message translates to:
  /// **'Iraq'**
  String get iq;

  /// No description provided for @ie.
  ///
  /// In en, this message translates to:
  /// **'Ireland'**
  String get ie;

  /// No description provided for @it.
  ///
  /// In en, this message translates to:
  /// **'Italy'**
  String get it;

  /// No description provided for @jm.
  ///
  /// In en, this message translates to:
  /// **'Jamaica'**
  String get jm;

  /// No description provided for @jp.
  ///
  /// In en, this message translates to:
  /// **'Japan'**
  String get jp;

  /// No description provided for @jo.
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get jo;

  /// No description provided for @kz.
  ///
  /// In en, this message translates to:
  /// **'Kazakhstan'**
  String get kz;

  /// No description provided for @ke.
  ///
  /// In en, this message translates to:
  /// **'Kenya'**
  String get ke;

  /// No description provided for @ki.
  ///
  /// In en, this message translates to:
  /// **'Kiribati'**
  String get ki;

  /// No description provided for @kr.
  ///
  /// In en, this message translates to:
  /// **'South Korea'**
  String get kr;

  /// No description provided for @kw.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get kw;

  /// No description provided for @kg.
  ///
  /// In en, this message translates to:
  /// **'Kyrgyzstan'**
  String get kg;

  /// No description provided for @la.
  ///
  /// In en, this message translates to:
  /// **'Laos'**
  String get la;

  /// No description provided for @lv.
  ///
  /// In en, this message translates to:
  /// **'Latvia'**
  String get lv;

  /// No description provided for @lb.
  ///
  /// In en, this message translates to:
  /// **'Lebanon'**
  String get lb;

  /// No description provided for @ls.
  ///
  /// In en, this message translates to:
  /// **'Lesotho'**
  String get ls;

  /// No description provided for @lr.
  ///
  /// In en, this message translates to:
  /// **'Liberia'**
  String get lr;

  /// No description provided for @ly.
  ///
  /// In en, this message translates to:
  /// **'Libya'**
  String get ly;

  /// No description provided for @li.
  ///
  /// In en, this message translates to:
  /// **'Liechtenstein'**
  String get li;

  /// No description provided for @lt.
  ///
  /// In en, this message translates to:
  /// **'Lithuania'**
  String get lt;

  /// No description provided for @lu.
  ///
  /// In en, this message translates to:
  /// **'Luxembourg'**
  String get lu;

  /// No description provided for @mg.
  ///
  /// In en, this message translates to:
  /// **'Madagascar'**
  String get mg;

  /// No description provided for @mw.
  ///
  /// In en, this message translates to:
  /// **'Malawi'**
  String get mw;

  /// No description provided for @my.
  ///
  /// In en, this message translates to:
  /// **'Malaysia'**
  String get my;

  /// No description provided for @mv.
  ///
  /// In en, this message translates to:
  /// **'Maldives'**
  String get mv;

  /// No description provided for @ml.
  ///
  /// In en, this message translates to:
  /// **'Mali'**
  String get ml;

  /// No description provided for @mt.
  ///
  /// In en, this message translates to:
  /// **'Malta'**
  String get mt;

  /// No description provided for @mh.
  ///
  /// In en, this message translates to:
  /// **'Marshall Islands'**
  String get mh;

  /// No description provided for @mr.
  ///
  /// In en, this message translates to:
  /// **'Mauritania'**
  String get mr;

  /// No description provided for @mu.
  ///
  /// In en, this message translates to:
  /// **'Mauritius'**
  String get mu;

  /// No description provided for @mx.
  ///
  /// In en, this message translates to:
  /// **'Mexico'**
  String get mx;

  /// No description provided for @fm.
  ///
  /// In en, this message translates to:
  /// **'Micronesia'**
  String get fm;

  /// No description provided for @md.
  ///
  /// In en, this message translates to:
  /// **'Moldova'**
  String get md;

  /// No description provided for @mc.
  ///
  /// In en, this message translates to:
  /// **'Monaco'**
  String get mc;

  /// No description provided for @mn.
  ///
  /// In en, this message translates to:
  /// **'Mongolia'**
  String get mn;

  /// No description provided for @me.
  ///
  /// In en, this message translates to:
  /// **'Montenegro'**
  String get me;

  /// No description provided for @ma.
  ///
  /// In en, this message translates to:
  /// **'Morocco'**
  String get ma;

  /// No description provided for @mz.
  ///
  /// In en, this message translates to:
  /// **'Mozambique'**
  String get mz;

  /// No description provided for @mm.
  ///
  /// In en, this message translates to:
  /// **'Myanmar'**
  String get mm;

  /// No description provided for @na.
  ///
  /// In en, this message translates to:
  /// **'Namibia'**
  String get na;

  /// No description provided for @nr.
  ///
  /// In en, this message translates to:
  /// **'Nauru'**
  String get nr;

  /// No description provided for @np.
  ///
  /// In en, this message translates to:
  /// **'Nepal'**
  String get np;

  /// No description provided for @nl.
  ///
  /// In en, this message translates to:
  /// **'Netherlands'**
  String get nl;

  /// No description provided for @nz.
  ///
  /// In en, this message translates to:
  /// **'New Zealand'**
  String get nz;

  /// No description provided for @ni.
  ///
  /// In en, this message translates to:
  /// **'Nicaragua'**
  String get ni;

  /// No description provided for @ne.
  ///
  /// In en, this message translates to:
  /// **'Niger'**
  String get ne;

  /// No description provided for @ng.
  ///
  /// In en, this message translates to:
  /// **'Nigeria'**
  String get ng;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get no;

  /// No description provided for @om.
  ///
  /// In en, this message translates to:
  /// **'Oman'**
  String get om;

  /// No description provided for @pk.
  ///
  /// In en, this message translates to:
  /// **'Pakistan'**
  String get pk;

  /// No description provided for @pw.
  ///
  /// In en, this message translates to:
  /// **'Palau'**
  String get pw;

  /// No description provided for @ps.
  ///
  /// In en, this message translates to:
  /// **'Palestine'**
  String get ps;

  /// No description provided for @pa.
  ///
  /// In en, this message translates to:
  /// **'Panama'**
  String get pa;

  /// No description provided for @pg.
  ///
  /// In en, this message translates to:
  /// **'Papua New Guinea'**
  String get pg;

  /// No description provided for @py.
  ///
  /// In en, this message translates to:
  /// **'Paraguay'**
  String get py;

  /// No description provided for @pe.
  ///
  /// In en, this message translates to:
  /// **'Peru'**
  String get pe;

  /// No description provided for @ph.
  ///
  /// In en, this message translates to:
  /// **'Philippines'**
  String get ph;

  /// No description provided for @pl.
  ///
  /// In en, this message translates to:
  /// **'Poland'**
  String get pl;

  /// No description provided for @pt.
  ///
  /// In en, this message translates to:
  /// **'Portugal'**
  String get pt;

  /// No description provided for @qa.
  ///
  /// In en, this message translates to:
  /// **'Qatar'**
  String get qa;

  /// No description provided for @ro.
  ///
  /// In en, this message translates to:
  /// **'Romania'**
  String get ro;

  /// No description provided for @ru.
  ///
  /// In en, this message translates to:
  /// **'Russia'**
  String get ru;

  /// No description provided for @rw.
  ///
  /// In en, this message translates to:
  /// **'Rwanda'**
  String get rw;

  /// No description provided for @kn.
  ///
  /// In en, this message translates to:
  /// **'Saint Kitts and Nevis'**
  String get kn;

  /// No description provided for @lc.
  ///
  /// In en, this message translates to:
  /// **'Saint Lucia'**
  String get lc;

  /// No description provided for @vc.
  ///
  /// In en, this message translates to:
  /// **'Saint Vincent and the Grenadines'**
  String get vc;

  /// No description provided for @ws.
  ///
  /// In en, this message translates to:
  /// **'Samoa'**
  String get ws;

  /// No description provided for @sm.
  ///
  /// In en, this message translates to:
  /// **'San Marino'**
  String get sm;

  /// No description provided for @st.
  ///
  /// In en, this message translates to:
  /// **'Sao Tome and Principe'**
  String get st;

  /// No description provided for @sa.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get sa;

  /// No description provided for @sn.
  ///
  /// In en, this message translates to:
  /// **'Senegal'**
  String get sn;

  /// No description provided for @rs.
  ///
  /// In en, this message translates to:
  /// **'Serbia'**
  String get rs;

  /// No description provided for @sc.
  ///
  /// In en, this message translates to:
  /// **'Seychelles'**
  String get sc;

  /// No description provided for @sl.
  ///
  /// In en, this message translates to:
  /// **'Sierra Leone'**
  String get sl;

  /// No description provided for @sg.
  ///
  /// In en, this message translates to:
  /// **'Singapore'**
  String get sg;

  /// No description provided for @sk.
  ///
  /// In en, this message translates to:
  /// **'Slovakia'**
  String get sk;

  /// No description provided for @si.
  ///
  /// In en, this message translates to:
  /// **'Slovenia'**
  String get si;

  /// No description provided for @sb.
  ///
  /// In en, this message translates to:
  /// **'Solomon Islands'**
  String get sb;

  /// No description provided for @so.
  ///
  /// In en, this message translates to:
  /// **'Somalia'**
  String get so;

  /// No description provided for @za.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get za;

  /// No description provided for @ss.
  ///
  /// In en, this message translates to:
  /// **'South Sudan'**
  String get ss;

  /// No description provided for @es.
  ///
  /// In en, this message translates to:
  /// **'Spain'**
  String get es;

  /// No description provided for @lk.
  ///
  /// In en, this message translates to:
  /// **'Sri Lanka'**
  String get lk;

  /// No description provided for @sd.
  ///
  /// In en, this message translates to:
  /// **'Sudan'**
  String get sd;

  /// No description provided for @sr.
  ///
  /// In en, this message translates to:
  /// **'Suriname'**
  String get sr;

  /// No description provided for @se.
  ///
  /// In en, this message translates to:
  /// **'Sweden'**
  String get se;

  /// No description provided for @ch.
  ///
  /// In en, this message translates to:
  /// **'Switzerland'**
  String get ch;

  /// No description provided for @sy.
  ///
  /// In en, this message translates to:
  /// **'Syria'**
  String get sy;

  /// No description provided for @tw.
  ///
  /// In en, this message translates to:
  /// **'Taiwan'**
  String get tw;

  /// No description provided for @tj.
  ///
  /// In en, this message translates to:
  /// **'Tajikistan'**
  String get tj;

  /// No description provided for @tz.
  ///
  /// In en, this message translates to:
  /// **'Tanzania'**
  String get tz;

  /// No description provided for @th.
  ///
  /// In en, this message translates to:
  /// **'Thailand'**
  String get th;

  /// No description provided for @tl.
  ///
  /// In en, this message translates to:
  /// **'Timor-Leste'**
  String get tl;

  /// No description provided for @tg.
  ///
  /// In en, this message translates to:
  /// **'Togo'**
  String get tg;

  /// No description provided for @tO.
  ///
  /// In en, this message translates to:
  /// **'Tonga'**
  String get tO;

  /// No description provided for @tt.
  ///
  /// In en, this message translates to:
  /// **'Trinidad and Tobago'**
  String get tt;

  /// No description provided for @tn.
  ///
  /// In en, this message translates to:
  /// **'Tunisia'**
  String get tn;

  /// No description provided for @tr.
  ///
  /// In en, this message translates to:
  /// **'Turkey'**
  String get tr;

  /// No description provided for @tm.
  ///
  /// In en, this message translates to:
  /// **'Turkmenistan'**
  String get tm;

  /// No description provided for @tv.
  ///
  /// In en, this message translates to:
  /// **'Tuvalu'**
  String get tv;

  /// No description provided for @ug.
  ///
  /// In en, this message translates to:
  /// **'Uganda'**
  String get ug;

  /// No description provided for @ua.
  ///
  /// In en, this message translates to:
  /// **'Ukraine'**
  String get ua;

  /// No description provided for @ae.
  ///
  /// In en, this message translates to:
  /// **'United Arab Emirates'**
  String get ae;

  /// No description provided for @gb.
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get gb;

  /// No description provided for @us.
  ///
  /// In en, this message translates to:
  /// **'United States'**
  String get us;

  /// No description provided for @uy.
  ///
  /// In en, this message translates to:
  /// **'Uruguay'**
  String get uy;

  /// No description provided for @uz.
  ///
  /// In en, this message translates to:
  /// **'Uzbekistan'**
  String get uz;

  /// No description provided for @vu.
  ///
  /// In en, this message translates to:
  /// **'Vanuatu'**
  String get vu;

  /// No description provided for @va.
  ///
  /// In en, this message translates to:
  /// **'Vatican City'**
  String get va;

  /// No description provided for @ve.
  ///
  /// In en, this message translates to:
  /// **'Venezuela'**
  String get ve;

  /// No description provided for @vn.
  ///
  /// In en, this message translates to:
  /// **'Vietnam'**
  String get vn;

  /// No description provided for @ye.
  ///
  /// In en, this message translates to:
  /// **'Yemen'**
  String get ye;

  /// No description provided for @zm.
  ///
  /// In en, this message translates to:
  /// **'Zambia'**
  String get zm;

  /// No description provided for @zw.
  ///
  /// In en, this message translates to:
  /// **'Zimbabwe'**
  String get zw;

  /// No description provided for @finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get finish;

  /// No description provided for @startTitle.
  ///
  /// In en, this message translates to:
  /// **'Enter to your Dashboard'**
  String get startTitle;

  /// No description provided for @startSubtitle.
  ///
  /// In en, this message translates to:
  /// **'To take the'**
  String get startSubtitle;

  /// No description provided for @dashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboardTitle;

  /// No description provided for @timetableSectionTitle.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow At School'**
  String get timetableSectionTitle;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See More'**
  String get seeMore;

  /// No description provided for @atTime.
  ///
  /// In en, this message translates to:
  /// **'At'**
  String get atTime;

  /// No description provided for @urgentExercisesSection.
  ///
  /// In en, this message translates to:
  /// **'Urgent Exercises'**
  String get urgentExercisesSection;

  /// No description provided for @otherExercisesSection.
  ///
  /// In en, this message translates to:
  /// **'Other Exercises'**
  String get otherExercisesSection;

  /// No description provided for @forgottenTasksSection.
  ///
  /// In en, this message translates to:
  /// **'Forgotten Tasks'**
  String get forgottenTasksSection;

  /// No description provided for @forDay.
  ///
  /// In en, this message translates to:
  /// **'For'**
  String get forDay;

  /// No description provided for @otherTasksSection.
  ///
  /// In en, this message translates to:
  /// **'Other Tasks'**
  String get otherTasksSection;

  /// No description provided for @donateSection.
  ///
  /// In en, this message translates to:
  /// **'Don\'t Forget To'**
  String get donateSection;

  /// No description provided for @donateTitle.
  ///
  /// In en, this message translates to:
  /// **'Donate To Devs'**
  String get donateTitle;

  /// No description provided for @donateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'On Patreon, PayPal & others...'**
  String get donateSubtitle;

  /// No description provided for @endPage.
  ///
  /// In en, this message translates to:
  /// **'The End Of Page'**
  String get endPage;

  /// No description provided for @drawerDonateTileText.
  ///
  /// In en, this message translates to:
  /// **'Donate to us'**
  String get drawerDonateTileText;

  /// No description provided for @drawerLogoutTileText.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get drawerLogoutTileText;

  /// No description provided for @exercisesTitle.
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get exercisesTitle;

  /// No description provided for @practice.
  ///
  /// In en, this message translates to:
  /// **'Practice'**
  String get practice;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @normal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get normal;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @extreme.
  ///
  /// In en, this message translates to:
  /// **'Extreme'**
  String get extreme;

  /// No description provided for @ultraHard.
  ///
  /// In en, this message translates to:
  /// **'Ultra Hard'**
  String get ultraHard;

  /// No description provided for @newExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'New Exercise'**
  String get newExerciseTitle;

  /// No description provided for @subjectChoice.
  ///
  /// In en, this message translates to:
  /// **'Choose the Subject'**
  String get subjectChoice;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @toDoScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'ToDo'**
  String get toDoScreenTitle;

  /// No description provided for @urgentTasksSection.
  ///
  /// In en, this message translates to:
  /// **'Urgent Tasks'**
  String get urgentTasksSection;

  /// No description provided for @moreTasksSection.
  ///
  /// In en, this message translates to:
  /// **'More Tasks'**
  String get moreTasksSection;

  /// No description provided for @toForgetTasksSection.
  ///
  /// In en, this message translates to:
  /// **'To Forget Tasks'**
  String get toForgetTasksSection;

  /// No description provided for @inYear.
  ///
  /// In en, this message translates to:
  /// **'In'**
  String get inYear;

  /// No description provided for @skipDay.
  ///
  /// In en, this message translates to:
  /// **'Skipped'**
  String get skipDay;

  /// No description provided for @newTaskTitle.
  ///
  /// In en, this message translates to:
  /// **'New Task'**
  String get newTaskTitle;

  /// No description provided for @taskTitle.
  ///
  /// In en, this message translates to:
  /// **'Task Title'**
  String get taskTitle;

  /// No description provided for @programmedDate.
  ///
  /// In en, this message translates to:
  /// **'Programmed Date'**
  String get programmedDate;

  /// No description provided for @programmedTime.
  ///
  /// In en, this message translates to:
  /// **'Programmed Time'**
  String get programmedTime;

  /// No description provided for @toDoBeforeDate.
  ///
  /// In en, this message translates to:
  /// **'ToDo Before This Date'**
  String get toDoBeforeDate;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @timetableTitle.
  ///
  /// In en, this message translates to:
  /// **'Timetable'**
  String get timetableTitle;

  /// No description provided for @tomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get tomorrow;

  /// No description provided for @scrollDown.
  ///
  /// In en, this message translates to:
  /// **'Scroll Down'**
  String get scrollDown;

  /// No description provided for @toSeeMore.
  ///
  /// In en, this message translates to:
  /// **'To See More'**
  String get toSeeMore;

  /// No description provided for @aiTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Homework Helper'**
  String get aiTitle;

  /// No description provided for @premiumBlock.
  ///
  /// In en, this message translates to:
  /// **'You need to have Premium to be able to use the AI Homework Helper'**
  String get premiumBlock;

  /// No description provided for @typeMessage.
  ///
  /// In en, this message translates to:
  /// **'Type a message'**
  String get typeMessage;

  /// No description provided for @challengerTitle.
  ///
  /// In en, this message translates to:
  /// **'Challenger'**
  String get challengerTitle;

  /// No description provided for @startNow.
  ///
  /// In en, this message translates to:
  /// **'Start Now !'**
  String get startNow;

  /// No description provided for @changeLvlChoice.
  ///
  /// In en, this message translates to:
  /// **'Or change the level'**
  String get changeLvlChoice;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Your account Settings'**
  String get accountSettings;

  /// No description provided for @displaySettings.
  ///
  /// In en, this message translates to:
  /// **'Display Settings'**
  String get displaySettings;

  /// No description provided for @languageSettings.
  ///
  /// In en, this message translates to:
  /// **'Language Settings'**
  String get languageSettings;

  /// No description provided for @alarmSettings.
  ///
  /// In en, this message translates to:
  /// **'Alarm Settings'**
  String get alarmSettings;

  /// No description provided for @notiSettings.
  ///
  /// In en, this message translates to:
  /// **'Notifications Settings'**
  String get notiSettings;

  /// No description provided for @aiSettings.
  ///
  /// In en, this message translates to:
  /// **'AI Settings'**
  String get aiSettings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @yourId.
  ///
  /// In en, this message translates to:
  /// **'Your ID'**
  String get yourId;

  /// No description provided for @yourEmail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get yourEmail;

  /// No description provided for @changeYourPassword.
  ///
  /// In en, this message translates to:
  /// **'Change Your Password'**
  String get changeYourPassword;

  /// No description provided for @connectedDevices.
  ///
  /// In en, this message translates to:
  /// **'Connected Devices :'**
  String get connectedDevices;

  /// No description provided for @changeAccount.
  ///
  /// In en, this message translates to:
  /// **'Change Account'**
  String get changeAccount;

  /// No description provided for @changeDetails.
  ///
  /// In en, this message translates to:
  /// **'Change Account Details'**
  String get changeDetails;

  /// No description provided for @font.
  ///
  /// In en, this message translates to:
  /// **'Font Type'**
  String get font;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @colors.
  ///
  /// In en, this message translates to:
  /// **'Colors'**
  String get colors;

  /// No description provided for @langChoice.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get langChoice;

  /// No description provided for @regChoice.
  ///
  /// In en, this message translates to:
  /// **'Choose your Region'**
  String get regChoice;

  /// No description provided for @schoolLvlChoice.
  ///
  /// In en, this message translates to:
  /// **'Choose your school level'**
  String get schoolLvlChoice;

  /// No description provided for @ringChoice.
  ///
  /// In en, this message translates to:
  /// **'Choose your ring'**
  String get ringChoice;

  /// No description provided for @volChoice.
  ///
  /// In en, this message translates to:
  /// **'Change the volume'**
  String get volChoice;

  /// No description provided for @aiTech.
  ///
  /// In en, this message translates to:
  /// **'The AI Technology'**
  String get aiTech;

  /// No description provided for @aiPrefs.
  ///
  /// In en, this message translates to:
  /// **'AI Preferences'**
  String get aiPrefs;

  /// No description provided for @aiHwSolver.
  ///
  /// In en, this message translates to:
  /// **'AI Homework Solver'**
  String get aiHwSolver;

  /// No description provided for @aboutPage.
  ///
  /// In en, this message translates to:
  /// **'About Page'**
  String get aboutPage;

  /// No description provided for @focusPlannerVersion.
  ///
  /// In en, this message translates to:
  /// **'Focus Planner v'**
  String get focusPlannerVersion;

  /// No description provided for @rights.
  ///
  /// In en, this message translates to:
  /// **'All rights reserved'**
  String get rights;

  /// No description provided for @premiumAdTitle.
  ///
  /// In en, this message translates to:
  /// **'Get Premium'**
  String get premiumAdTitle;

  /// No description provided for @premiumAdButton.
  ///
  /// In en, this message translates to:
  /// **'Get Premium Now !'**
  String get premiumAdButton;

  /// No description provided for @premiumAdChoice.
  ///
  /// In en, this message translates to:
  /// **'Or subscribe in Patreon and Get Big Deals'**
  String get premiumAdChoice;

  /// No description provided for @perMonth.
  ///
  /// In en, this message translates to:
  /// **'\$ / Month'**
  String get perMonth;

  /// No description provided for @perYear.
  ///
  /// In en, this message translates to:
  /// **'\$ / Year'**
  String get perYear;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Email'**
  String get enterEmail;

  /// No description provided for @enterPw.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Password'**
  String get enterPw;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Username'**
  String get enterName;

  /// No description provided for @enterEmailPw.
  ///
  /// In en, this message translates to:
  /// **'Please Enter Both Email & Password'**
  String get enterEmailPw;

  /// No description provided for @enterNameEmailPw.
  ///
  /// In en, this message translates to:
  /// **'Please Enter The Username, Email & Password'**
  String get enterNameEmailPw;

  /// No description provided for @pwNotMatch.
  ///
  /// In en, this message translates to:
  /// **'The passwords do not match!'**
  String get pwNotMatch;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @pwConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get pwConfirm;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @ar.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get ar;

  /// No description provided for @fr.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get fr;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
