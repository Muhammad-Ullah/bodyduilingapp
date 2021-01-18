import 'package:bloc/bloc.dart';
import 'package:gymbodybuilding/screens/buttom_navigation/main_bottom_navigation.dart';
import 'package:gymbodybuilding/screens/pages/contact_us.dart';
import 'package:gymbodybuilding/screens/pages/logout.dart';
import 'package:gymbodybuilding/screens/pages/myaboutpage.dart';
import 'package:gymbodybuilding/screens/pages/mylivestreamingpage.dart';
import 'package:gymbodybuilding/screens/pages/notificationn.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  MyAboutClickedEvent,
  MyLiveStreamingClickedEvent,
  MyNotificationEvent,
  MyLogout,
  MyContactUs,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  NavigationStates get initialState => Home();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case NavigationEvents.MyAboutClickedEvent:
        yield MyAboutPage();
        break;
      case NavigationEvents.MyLiveStreamingClickedEvent:
        yield MyLiveStreamingPage();
        break;
      case NavigationEvents.MyLogout:
        yield Logout();
        break;
      case NavigationEvents.MyContactUs:
        yield ContactUS();
        break;
      case NavigationEvents.MyNotificationEvent:
        yield Notify();
        break;
    }
  }

}
