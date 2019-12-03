# Poncho-2.0 :running_shirt_with_sash:
Simulating the implementation of frame classes in World of Warcraft has never been easy: Lua does not support classes by default and frames cannot be deallocated once created. Even further, frames can be assigned to xml templates and global names, which cannot be changed once set. Recently, Blizzard added some default lua API for handling classes as mixins, but that also comes with its set of limitations.

On the other hand, creating frames is extremely simple:
````lua
frame = CreateFrame('Frame', 'SomeFrame', MyParent, 'SomeTemplate')
````

Why is not creating classes this simple?
Poncho has been designed with that exact purpose in mind. Using Poncho, creating a class is simple as:

````lua
class = Poncho:NewClass('Frame', 'SomeFrames', 'SomeTemplate')
````

Frames can then be created by calling the class object itself:
````lua
frame = class()
````

Subclasses can also be recursively inherited:
````lua
sublass = class:NewClass()
````
