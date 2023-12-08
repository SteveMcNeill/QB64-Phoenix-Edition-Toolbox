# QB64 Phoenix Edition Toolbox
 A collection of tools, utilities, and libraries which help expand the QB64 language.

 ## INstallation
 Installing this toolbox in QB64PE is as simple as downloading the files here, and extracting them to your desired folder.

 Once QB64PE is up and running, add the following to the top of your code: 
 ```
 $INCLUDE:'<your extracted folder path here>\Library Files\Toolbox.BI'
 ```

 And add the following to the end of your code:
 ```
 $INCLUDE:'<your extracted folder path here>\Library Files\Toolbox.BI'
 ```

 Once you've $INCLUDED the library into your QB64PE program, the only thing left is to tell QB64 which parts of the library you wish to use.
 This is done via the QB64PE precompiler command $LET, as so:
 ```
 $LET INCLUDE_ALL = TRUE
 ```

 Be certain to place this $LET statement ***before*** the first $INCLUDE statement, so QB64PE will know exactly what portions of the library you wish to include in your code for use.



