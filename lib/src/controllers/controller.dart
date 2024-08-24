part of '../app/o3d.dart';

class O3DController implements O3DControllerInterface {
  late O3dDataSource _dataSource;
  
  @override
  String getModelName() => _dataSource.getModelName();
  
  @override
  void setupEvents() => _dataSource.setupEvents();

  @override
  VoidCallback? onLoadCallback;

  @override
  VoidCallback? onBeforeRenderCallback;
  
  @override
  void animationLoop() => _dataSource.animationLoop();

  @override
  void animationStopped() => _dataSource.animationStopped();
  
  @override
  void animationEvent(String message) => _dataSource.animationEvent(message);

  @override
  void cameraOrbit(double theta, double phi, double radius) =>
      _dataSource.cameraOrbit(theta, phi, radius);

  @override
  void cameraTarget(double x, double y, double z) =>
      _dataSource.cameraTarget(x, y, z);

  @override
  void customJsCode(String code) => _dataSource.customJsCode(code);

  @override
  ValueChanged<Object>? logger;

  @override
  set animationName(String? set) => _dataSource.animationName = set;

  @override
  set autoRotate(bool? set) => _dataSource.autoRotate = set;

  @override
  set cameraControls(bool? set) => _dataSource.cameraControls = set;

  @override
  set variantName(String? set) => _dataSource.variantName = set;

  @Deprecated('use play() and pause() methods instead!')
  @override
  set autoPlay(bool? set) => _dataSource.autoPlay = set;

  @override
  Future<List<String>> availableAnimations() =>
      _dataSource.availableAnimations();

  @override
  void pause() => _dataSource.pause();

  @override
  void play({int? repetitions}) => _dataSource.play(repetitions: repetitions);

  @override
  Future<List<String>> availableVariants() => _dataSource.availableVariants();

  @override
  Future executeCustomJsCodeWithResult(String code) =>
      _dataSource.executeCustomJsCodeWithResult(code);

  @override
  void resetCameraOrbit() => _dataSource.resetCameraOrbit();

  @override
  void resetCameraTarget() => _dataSource.resetCameraTarget();

  @override
  void resetAnimation() => _dataSource.resetAnimation();
}
