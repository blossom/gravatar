library gravatar;

import 'dart:crypto';

/**
 * An easy-to-use library for generating Gravatar image urls in Dart.
 *
 *     var gravatar = new Gravatar("hello@blossom.io");
 *     gravatar.imageUrl(); // https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b
 */
class Gravatar {
  String _email;
  String _hash;
  String _imageUrl;

  Gravatar(this._email) {
    _generateHash();
    this._hash = _generateHash();
    this._imageUrl = "https://secure.gravatar.com/avatar/$this.hash";
  }

  /**
   * Returns a an MD5 hash of the given email address.
   *
   * As described in https://en.gravatar.com/site/implement/hash/
   * the given email address gets trimmed and lowered before generating the hash
   */
  String _generateHash() {
    String preparedEmail = (this._email.trim()).toLowerCase();
    List digest = (new MD5()..add(preparedEmail.charCodes)).close();
    return CryptoUtils.bytesToHex(digest);

  }

  String get email => this._email;
  String get hash => this._hash;

  /**
   * Returns an image URL for the Gravatar.
   *
   *     var gravatar = new Gravatar("hello@blossom.io");
   *     gravatar.imageUrl(); // https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b
   */
  String imageUrl({int size, String defaultImage, bool forceDefault: false, String rating}) {
    String url = "${_imageUrl}?";
    if (size != null) { url = "${url}s=${size}&"; }
    if (defaultImage != null) { url = "${url}d=${defaultImage}&"; }
    if (forceDefault) { url = "${url}f=y&"; }
    if (rating != null) { url = "${url}r=${rating}&"; }
    // remove either the '?' or the last '&' for clean urls
    url = url.substring(0, url.length-1);
    return url;
  }
}
