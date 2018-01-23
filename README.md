# Poncho-1.0 :running_shirt_with_sash:
Simulating the implementation of frame classes in World of Warcraft has never been easy: Lua does not support classes by default and frames cannot be deallocated once created. Even further, frames can be assigned to xml templates and global names, which cannot be changed once set.

On the other hand, creating frames is extremely simple:

    frame = CreateFrame('Frame', 'SomeFrame', MyParent, 'SomeTemplate')
    
Why is not creating classes this simple?
Poncho has been designed with that exact purpose in mind. Using Poncho, creating a class is simple as:

    class = CreateClass('Frame', 'SomeFrame', MyParent, 'SomeTemplate')
    
Frames can then be created by calling the class object itself:

    frame = class()
    
Interested? Then follow to [Getting Started](https://github.com/Jaliborc/Poncho-1.0/wiki/Getting-Started).
