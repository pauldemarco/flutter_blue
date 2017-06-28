import 'package:flutter/material.dart';
import 'package:flutter_blue_example/app_configuration.dart';

class AppSettings extends StatefulWidget {
  const AppSettings(this.configuration, this.updater);

  final AppConfiguration configuration;
  final ValueChanged<AppConfiguration> updater;

  @override
  AppSettingsState createState() => new AppSettingsState();
}

class AppSettingsState extends State<AppSettings> {
  void _handleOptimismChanged(bool value) {
    value ??= false;
    sendUpdates(widget.configuration.copyWith(displayMode: value ? DisplayMode.light : DisplayMode.dark));
  }

  void _handleShowGridChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(debugShowGrid: value));
  }

  void _handleShowSizesChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(debugShowSizes: value));
  }

  void _handleShowBaselinesChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(debugShowBaselines: value));
  }

  void _handleShowLayersChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(debugShowLayers: value));
  }

  void _handleShowPointersChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(debugShowPointers: value));
  }

  void _handleShowRainbowChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(debugShowRainbow: value));
  }


  void _handleShowPerformanceOverlayChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(showPerformanceOverlay: value));
  }

  void _handleShowSemanticsDebuggerChanged(bool value) {
    sendUpdates(widget.configuration.copyWith(showSemanticsDebugger: value));
  }

  void _confirmOptimismChange() {
    switch (widget.configuration.displayMode) {
      case DisplayMode.light:
        _handleOptimismChanged(false);
        break;
      case DisplayMode.dark:
        showDialog<bool>(
          context: context,
          child: new AlertDialog(
            title: const Text("Change mode?"),
            content: const Text("Optimistic mode means everything is awesome. Are you sure you can handle that?"),
            actions: <Widget>[
              new FlatButton(
                child: const Text('NO THANKS'),
                onPressed: () {
                  Navigator.pop(context, false);
                }
              ),
              new FlatButton(
                child: const Text('AGREE'),
                onPressed: () {
                  Navigator.pop(context, true);
                }
              ),
            ]
          )
        ).then<Null>(_handleOptimismChanged);
        break;
    }
  }

  void sendUpdates(AppConfiguration value) {
    if (widget.updater != null)
      widget.updater(value);
  }

  Widget buildAppBar(BuildContext context) {
    return new AppBar(
      title: const Text('Settings')
    );
  }

  Widget buildSettingsPane(BuildContext context) {
    final List<Widget> rows = <Widget>[
      new ListTile(
        leading: const Icon(Icons.thumb_up),
        title: const Text('Everything is awesome'),
        onTap: _confirmOptimismChange,
        trailing: new Checkbox(
          value: widget.configuration.displayMode == DisplayMode.light,
          onChanged: (bool value) => _confirmOptimismChange(),
        ),
      ),
      new ListTile(
        leading: const Icon(Icons.picture_in_picture),
        title: const Text('Show rendering performance overlay'),
        onTap: () { _handleShowPerformanceOverlayChanged(!widget.configuration.showPerformanceOverlay); },
        trailing: new Switch(
          value: widget.configuration.showPerformanceOverlay,
          onChanged: _handleShowPerformanceOverlayChanged,
        ),
      ),
      new ListTile(
        leading: const Icon(Icons.accessibility),
        title: const Text('Show semantics overlay'),
        onTap: () { _handleShowSemanticsDebuggerChanged(!widget.configuration.showSemanticsDebugger); },
        trailing: new Switch(
          value: widget.configuration.showSemanticsDebugger,
          onChanged: _handleShowSemanticsDebuggerChanged,
        ),
      ),
    ];
    assert(() {
      // material grid and size construction lines are only available in checked mode
      rows.addAll(<Widget>[
        new ListTile(
          leading: const Icon(Icons.border_clear),
          title: const Text('Show material grid (for debugging)'),
          onTap: () { _handleShowGridChanged(!widget.configuration.debugShowGrid); },
          trailing: new Switch(
            value: widget.configuration.debugShowGrid,
            onChanged: _handleShowGridChanged,
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.border_all),
          title: const Text('Show construction lines (for debugging)'),
          onTap: () { _handleShowSizesChanged(!widget.configuration.debugShowSizes); },
          trailing: new Switch(
            value: widget.configuration.debugShowSizes,
            onChanged: _handleShowSizesChanged,
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.format_color_text),
          title: const Text('Show baselines (for debugging)'),
          onTap: () { _handleShowBaselinesChanged(!widget.configuration.debugShowBaselines); },
          trailing: new Switch(
            value: widget.configuration.debugShowBaselines,
            onChanged: _handleShowBaselinesChanged,
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.filter_none),
          title: const Text('Show layer boundaries (for debugging)'),
          onTap: () { _handleShowLayersChanged(!widget.configuration.debugShowLayers); },
          trailing: new Switch(
            value: widget.configuration.debugShowLayers,
            onChanged: _handleShowLayersChanged,
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.mouse),
          title: const Text('Show pointer hit-testing (for debugging)'),
          onTap: () { _handleShowPointersChanged(!widget.configuration.debugShowPointers); },
          trailing: new Switch(
            value: widget.configuration.debugShowPointers,
            onChanged: _handleShowPointersChanged,
          ),
        ),
        new ListTile(
          leading: const Icon(Icons.gradient),
          title: const Text('Show repaint rainbow (for debugging)'),
          onTap: () { _handleShowRainbowChanged(!widget.configuration.debugShowRainbow); },
          trailing: new Switch(
            value: widget.configuration.debugShowRainbow,
            onChanged: _handleShowRainbowChanged,
          ),
        ),
      ]);
      return true;
    });
    return new ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      children: rows,
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildSettingsPane(context);
  }
}
