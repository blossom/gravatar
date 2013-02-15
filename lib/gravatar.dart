library gravatar;

import 'dart:crypto';

class Gravatar {
  String _email;
  String _hash;
  String _imageUrl;

  Gravatar(this._email) {
    _generateHash();
  }

  void _generateHash() {
    // as described in https://en.gravatar.com/site/implement/hash/
    // the email gets trimmed and lowered before generating the hash
    String preparedEmail = (this._email.trim()).toLowerCase();
    List digest = (new MD5()..add(preparedEmail.charCodes)).close();
    this._hash = CryptoUtils.bytesToHex(digest);
    this._imageUrl = "https://secure.gravatar.com/avatar/$_hash";
  }

  String get email => this._email;
  String get hash => this._hash;

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