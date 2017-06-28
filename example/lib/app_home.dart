import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugDumpRenderTree, debugDumpLayerTree, debugDumpSemanticsTree;
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:flutter_blue_example/app_configuration.dart';
import 'package:flutter_blue_example/app_settings.dart';
import 'package:flutter_blue_example/app_strings.dart';

typedef void ModeUpdater(DisplayMode mode);

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget title,
    Color color,
    TickerProvider vsync,
    this.page,
  }) : item = new BottomNavigationBarItem(
          icon: icon,
          title: title,
          backgroundColor: color,
        ),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final WidgetBuilder page;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(BuildContext context) {
    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new FractionalOffsetTween(
          begin: const FractionalOffset(0.0, 0.02), // Small offset from the top.
          end: FractionalOffset.topLeft,
        ).animate(_animation),
        child: page(context)
      ),
    );
  }
}

class _NotImplementedDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: const Text('Not Implemented'),
      content: const Text('This feature has not yet been implemented.'),
      actions: <Widget>[
        new FlatButton(
          onPressed: debugDumpApp,
          child: new Row(
            children: <Widget>[
              const Icon(
                Icons.dvr,
                size: 18.0,
              ),
              new Container(
                width: 8.0,
              ),
              const Text('DUMP APP TO CONSOLE'),
            ],
          ),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: const Text('OH WELL'),
        ),
      ],
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome(this.configuration, this.updater);

  final AppConfiguration configuration;
  final ValueChanged<AppConfiguration> updater;

  @override
  AppHomeState createState() => new AppHomeState();
}

class AppHomeState extends State<AppHome> with TickerProviderStateMixin {
  int _currentIndex = 0;

  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: const Icon(Icons.bluetooth),
        title: const Text('Devices'),
        color: Colors.blue,
        vsync: this,
        page: (BuildContext context) => new Container(child: const Center(child: const Text('Devices')), color: Colors.white),
      ),
      new NavigationIconView(
        icon: const Icon(Icons.settings),
        title: const Text('Settings'),
        color: Colors.blueGrey,
        vsync: this,
        page: (BuildContext context) => new AppSettings(widget.configuration, widget.updater),
      ),
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews)
      view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }


  Widget buildAppBar() {
    return new AppBar(
      title: new Text(AppStrings.of(context).title()),
    );
  }

  Widget buildFloatingActionButton() {
    return new FloatingActionButton(
      tooltip: 'Create company',
      child: const Icon(Icons.search),
      backgroundColor: Colors.redAccent,
      onPressed: null,
    );
  }

  Widget _buildTransitionsStack() {
    final List<FadeTransition> transitions = <FadeTransition>[];

    for (NavigationIconView view in _navigationViews)
      transitions.add(view.transition(context));

    // We want to have the newly animating (fading in) views on top.
    transitions.sort((FadeTransition a, FadeTransition b) {
      final Animation<double> aAnimation = a.listenable;
      final Animation<double> bAnimation = b.listenable;
      final double aValue = aAnimation.value;
      final double bValue = bAnimation.value;
      return aValue.compareTo(bValue);
    });

    return new Stack(children: transitions);
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.shifting,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return new Scaffold(
      //appBar: buildAppBar(),
      floatingActionButton: buildFloatingActionButton(),
      bottomNavigationBar: botNavBar,
      body: new Center(
          child: _buildTransitionsStack()
      ),
    );
  }
}
