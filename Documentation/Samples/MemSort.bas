'Sample for Sub MemSort (m As _MEM)
'created 10/16/2023 by Steve!(tm)
'Only one paramter for this function, and that requires the mem pointer to an array that we want to sort.
'NOTE:  Take a moment to notice that this demo makes use of three different array types -- x(), y(), and z()
'x() is an array of bytes.
'y() is an array of double values.
'z() is an array of string * 5 characters.

'Even though these are all three different types of arrays, this ONE command sorts them all -- as well as any other type which mem works natively woth.

'THAT's the true power of MemSort!


$Let INCLUDE_ALL = TRUE
'$INCLUDE:'..\Library Files\Toolbox.BI'


Screen _NewImage(1280, 720, 256)
Randomize Timer

Dim m As _MEM
Dim x(5) As _Byte
Dim y(7) As Double
Dim z(5) As String * 5

'Let's see if we can sort the integer array
'Initialize Data
Print "Initial Data:"
For i = 0 To 5: x(i) = Rnd * 100: Print x(i),: Next: Print
Print "----------------------------------------------------------------------------------------------------------------------------------------------------------------"

'Sort
m = _Mem(x()) 'point the mem to our chosen array
MemSort m 'memSort that chosen array
_MemFree m 'free the mem pointer after

'Result
Print "Sorted Data:"
For i = 0 To 5: Print x(i),: Next: Print

Print "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Print
Print


'Try the same routine with a different data type array to sort
'Initialize Data
Print "Initial Data:"
For i = 0 To 7: y(i) = Rnd * 100: Print y(i),: Next
Print
Print "----------------------------------------------------------------------------------------------------------------------------------------------------------------"

'Sort
m = _Mem(y()) 'point the mem to our chosen array
MemSort m 'memSort that chosen array
_MemFree m 'free the mem after

'Result
Print "Sorted Data:"
For i = 0 To 7: Print y(i),: Next: Print
Print "----------------------------------------------------------------------------------------------------------------------------------------------------------------"
Print
Print


'To test with fixed length string arrays
z(0) = "Doggy": z(1) = "Pudding": z(2) = "Frog ": z(3) = "test2": z(4) = "Test2": z(5) = "test1"
Print "Initial Data:"
For i = 0 To 5: Print z(i),: Next: Print
Print "----------------------------------------------------------------------------------------------------------------------------------------------------------------"

m = _Mem(z()) 'point the mem to our chosen array
MemSort m 'memSort that chosen array
_MemFree m 'free the mem after

'Result
Print "Sorted Data:"
For i = 0 To 5: Print z(i),: Next: Print

Sleep
System


'$INCLUDE:'..\Library Files\Toolbox.BM'

