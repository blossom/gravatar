# Gravatar

An easy-to-use library for generating gravatar image urls in Dart.

For more information about Gravatar please visit https://gravatar.com

# Example

	  var gravatar = new Gravatar("hello@blossom.io");
	  gravatar.imageUrl();
	  
Which will return `https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b`

![Blossom](https://secure.gravatar.com/avatar/658b1158409b348bb2cb3e5bef734d1b?s=160)

# API

`imageUrl({int size, String defaultImage, bool forceDefault: false, String rating})`
Generates an image url

* size (Imagesize)
* defaultImage (Url or Kind for the Fallback Image)
* forceDefault (force the Fallback Image)
* rating (restrict to appropriate Images)
	
For further information about the parameters please visit https://en.gravatar.com/site/implement/images/

# Install

Gravatar is a pub package. To install it you can add it to pubspec.yaml. For example:

    name: my-app
    dependencies:
      gravatar: any

# Support

You can file issues at https://github.com/blossom/gravatar/issues

Pull requests are very welcome :)

# Trivia

This library is a by-product of our Dart efforts at [Blossom](https://www.blossom.io).

# Todo

* Setup Drone.io