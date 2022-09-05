import 'package:fluro/fluro.dart';
import './Home.dart';
class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static Handler _homePage =
      Handler(handlerFunc: ((context, parameters) => Home()));

  // static Handler _turnDetails =
  //     Handler(handlerFunc: (context, Map<String, dynamic> params) {
  //   return TURN_DETAILS_SCREEN(params['id'][0]);
  // });

  static void setupRouter() {
    router.define('/',
        handler: _homePage, transitionType: TransitionType.fadeIn);

    // router.define('/turn/:id',
    //     handler: _turnDetails, transitionType: TransitionType.fadeIn);
  }
}
