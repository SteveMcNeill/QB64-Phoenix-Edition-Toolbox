'$Include:'../../../Keyboard Library.Lib'


$Color:32
Screen _NewImage(800, 600, 32)

Print "Let's compare the keyhit library verses QB64's standard _KEYHIT"
Color Yellow
Print "(Try CTRL plus any number key, or top line key to see an obvious difference easily.)"
Color White

Do
    k = 0: k1 = 0 'reset to 0
    k = KeyHit 'get the library keyhit values
    k1 = _KeyHit 'get QB64's built in values
    If k <> 0 Then
        Print "Keyboard Library detected: "; k,
        Print "_KEYHIT detected        : "; k1
    End If
    _Limit 10
Loop Until k = 27
