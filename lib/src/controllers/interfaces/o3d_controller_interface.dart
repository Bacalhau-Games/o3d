import 'package:flutter/foundation.dart';
import 'package:o3d/src/controllers/implementation/o3d_stub_impl.dart'
    if (dart.library.js) "package:o3d/src/controllers/implementation/o3d_web_impl.dart";

abstract class O3DControllerInterface {
  /// [customJsCode]
  /// See examples on https://modelviewer.dev/examples then add your desired
  /// javascript code
  void customJsCode(String code);

  /// [cameraOrbit] function
  /// Set the starting and/or subsequent orbital position of the camera.
  /// You can control the azimuthal, theta, and polar, phi, angles (phi is measured down from the top),
  /// and the radius from the center of the model. Accepts values of the form "$theta $phi $radius",
  /// like "10deg 75deg 1.5m". Also supports units in radians ("rad") for angles and centimeters ("cm") or
  /// millimeters ("mm") for camera distance. Camera distance can also be set as a percentage ('%'),
  /// where 100% gives the model tight framing within any window based on all possible theta and phi values.
  /// Any time this value changes from its initially configured value, the camera will interpolate from its current
  /// position to the new value. Any value set to 'auto' will revert to the default. For camera-orbit, camera-target
  /// and field-of-view, parts of the property value can be configured with CSS-like functions. The CSS calc() function
  /// is supported for these values, as well as a specialized form of the env() function. You can use env(window-scroll-y)
  /// anywhere in the expression to get a number from 0-1 that corresponds to the current top-level scroll position of the
  /// current frame. For example, a value like "calc(30deg - env(window-scroll-y) * 60deg) 75deg 1.5m" cause the camera to
  /// orbit horizontally around the model as the user scrolls down the page.
  void cameraOrbit(double theta, double phi, double radius);

  /// [resetCameraOrbit]
  /// Causes camera target reset to default value
  void resetCameraOrbit();

  /// [cameraTarget] function
  /// Set the starting and/or subsequent point the camera orbits around.
  /// Accepts values of the form "$X $Y $Z", like "0m 1.5m -0.5m".
  /// Also supports units in centimeters ("cm") or millimeters ("mm").
  /// A special value "auto" can be used, which sets the target to
  /// the center of the model's bounding box in that dimension.
  /// Any time this value changes from its initially configured value,
  /// the camera will interpolate from its current position to the new value.
  void cameraTarget(double x, double y, double z);

  /// [resetCameraTarget]
  /// Causes camera orbit reset to default value
  void resetCameraTarget();

  /// [logger] for testing package in release mode
  ValueChanged<Object>? logger;

  /// [animationName] for setting package animation name
  /// `setter` function
  set animationName(String? name);

  /// [cameraControls] for setting control on the camera or setting on
  /// default camera position
  /// `setter` func
  set cameraControls(bool? set);

  /// [autoRotate] for camera rotation
  /// `setter` func
  set autoRotate(bool? set);

  /// [autoPlay] for playing automatic animation
  /// `setter` func
  @Deprecated('use play and pause instead!')
  set autoPlay(bool? set);

  /// [variantName] for model material
  /// `setter` func
  set variantName(String? variantName);

  /// [play] Causes animations to be played, Can be use to switch animations as well.
  /// If animationName is null and model has at list one animation, it will play first model's animation
  /// If animationName passed and not null it will play specific animation
  void play({int? repetitions});

  /// [pause] Causes animations to be paused.
  void pause();

  /// [resetAnimation]
  /// Causes animation to be played from first frame
  void resetAnimation();

  /// It will return available animations list of 3D model as List<String>
  Future<List<String>> availableAnimations();

  /// It will return available animations list of 3D model as List<String>
  Future<List<String>> availableVariants();

  ///It will execute custom JS code and returns result
  Future<dynamic> executeCustomJsCodeWithResult(String code);

  factory O3DControllerInterface({required String id, webViewController}) =>
      O3dImp(id: id, webViewController: webViewController);

  /// others will be added
}
