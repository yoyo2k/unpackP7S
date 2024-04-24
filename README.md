# unpackP7S
Just a simple (I managed to complicate it) tool to unpack p7s files.

### what are p7s files

Much like the normal p7s signature file received in a signed email this is a file 
which is electronicaly signed with a PKCS #7 signature. this is used alot in RO
for signing documents on the government tender platform (actually within the gov)
as they haven't heard of native document signing (rn only PDF comes to mind).

### how to use this tool

just make it an executable with chmod or run it through your fav shell. 
if you pass it an argument it will try to unpack that file, if not it will search 
the current directory for all p7s files and will try to unpack them.

### what's next

nothing, if you it's usefull for you give a shoutout
