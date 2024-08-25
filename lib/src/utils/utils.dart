import 'dart:convert';
import 'dart:math';

class Utils {
  final random = Random();

  String get generateId =>
      'BabakCode${random.nextInt(99999)}${random.nextInt(99999)}';

  String relatedJs({required String id}) => '''
  var o3d$id = document.querySelector('#$id');
  
  // FabioR: Proper JavascriptChannel configuration
  if (o3d$id) {
    o3d$id.addEventListener('finished', function(event) { if (typeof o3dAnimFinished != 'undefined' && o3dAnimFinished != null) { o3dAnimFinished.postMessage('finished'); }});
    o3d$id.addEventListener('load', function(event) { if (typeof o3dLoaded != 'undefined' && o3dLoaded != null) { o3dLoaded.postMessage('load'); }});
    o3d$id.addEventListener('before-render', function(event) { if (typeof o3dBeforeRender != 'undefined' && o3dBeforeRender != null) { o3dBeforeRender.postMessage('before-render'); }});
  }
  
  var o3dscene$id = null;
  get_threejs_o3d$id = () => { return o3d$id[Object.getOwnPropertySymbols(o3d$id).find(e => e.description === 'scene')]; };
  get_scene_o3d$id = () => { if (o3dscene$id == null ) { o3dscene$id = get_threejs_o3d$id()._model; }; return o3dscene$id; };
  var defaultCameraOrbit$id = o3d$id.cameraOrbit;
  customJsCode$id = (code) => { eval(code) }
  customEvaluateWithResult$id = (code) => { return eval(code) }
  ''';

  /// Covert tuple string to list
  /// [fixJsonIssue]
  static String? fixJsonIssue(String str, [bool normalAttempts = true]) {
    try {
      if (normalAttempts) {
        /// check can decode
        jsonDecode(str.trim());
        return str;
      }

      if (str.startsWith('(')) {
        /// this is a set
        final kv = str.substring(0, str.length - 1).substring(1).split(',');
        final List<String> pairs = [];

        for (int i = 0; i < kv.length; i++) {
          final thisKV = kv[i].replaceAll('"', '');
          pairs.add(thisKV.trim());
        }

        return json.encode(pairs);
      } else if (str.startsWith('[')) {
        /// this is a List

        final kv = str.substring(0, str.length - 1).substring(1).split(',');
        final List<String> pairs = [];

        for (int i = 0; i < kv.length; i++) {
          final thisKV = kv[i].replaceAll('"', '');
          pairs.add(thisKV.trim());
        }

        return json.encode(pairs);
      } else if (str.startsWith('{')) {
        /// this is a Map

        final kv = str.substring(0, str.length - 1).substring(1).split(',');
        final Map<String, String> pairs = {};

        for (int i = 0; i < kv.length; i++) {
          final thisKV = kv[i].split(":");
          pairs[thisKV[0].replaceAll('"', '').trim()] =
              thisKV[1].replaceAll('"', '').trim();
        }

        return json.encode(pairs);
      }
    } catch (e) {
      if (normalAttempts) {
        return fixJsonIssue(str, false);
      }
    }
    return null;
  }
}
