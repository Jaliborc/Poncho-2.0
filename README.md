# Poncho-2.0 :running_shirt_with_sash:
A library for implementing object-oriented frame classes with inheritance in World of Warcraft.

Simulating frame classes in World of Warcraft is not simple: Lua does not support classes by default and frames cannot be deallocated once created. Even further, frames can be assigned to `xml` templates and global names, which cannot be changed once set. Recently, Blizzard added APIs for handling classes as mixins, but they also comes with their own set of limitations.

On the other hand, creating frames is extremely simple:
````lua
frame = CreateFrame('Frame', 'SomeFrame', MyParent, 'SomeTemplate')
````

## Overview
Creating a new frame class using Poncho is simple as:

````lua
class = LibStub('Poncho-2.0'):NewClass('Frame', 'FrameNames', 'SomeTemplate')
````

Frames can then be created by calling the class object itself:
````lua
frame = class()
````

Subclasses can also be recursively inherited:
````lua
sublass = class:NewClass()
````

## More Information
For a quick guide on writting classes using Poncho and an API reference check [the wiki](https://github.com/Jaliborc/Poncho-2.0/wiki).
