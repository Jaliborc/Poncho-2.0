# Poncho-2.0 :running_shirt_with_sash:
[![Patreon](http://img.shields.io/badge/news%20&%20rewards-patreon-ff4d42)](https://www.patreon.com/jaliborc)
[![Paypal](http://img.shields.io/badge/donate-paypal-1d3fe5)](https://www.paypal.me/jaliborc)
[![Discord](http://img.shields.io/badge/discuss-discord-5865F2)](https://bit.ly/discord-jaliborc)

A library for implementing object-oriented frame classes with inheritance in World of Warcraft.

Simulating frame classes in World of Warcraft is not simple: Lua does not support classes by default and frames cannot be deallocated once created. Even further, frames can be assigned to `xml` templates and global names, which cannot be changed once set. Recently, Blizzard added APIs for handling classes as mixins, but they also come with their own set of limitations.

### Overview
Creating frames in World of Warcraft is extremely simple:
````lua
frame = CreateFrame('Frame', 'SomeFrame', SomeParent, 'SomeTemplate')
````

Creating a new frame class using Poncho is very similar:

````lua
class = LibStub('Poncho-2.0'):NewClass('Frame', 'FrameNames', 'SomeTemplate')
````

Frames can then be created by calling the class object itself:
````lua
frame = class()
````

Subclasses then can be recursively inherited:
````lua
sublass = class:NewClass()
````

Classes also behave as frame pools, so frames can be released:
````lua
frame = class()
frame:Release()
````

### More Information
For a quick guide on writting classes using Poncho and an API reference check [the wiki](https://github.com/Jaliborc/Poncho-2.0/wiki).  
If you use this library, please list it as one of your dependencies in the CurseForge admin system. It's a big help! :+1:
