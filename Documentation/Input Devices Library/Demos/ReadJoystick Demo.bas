'$Include:'../../../Input Devices.QLB'

Do
    Cls
    ReadJoyStick 'Use this command to read your joystick

    'The code here is what we use to check the results of our joystick input
    For i = 1 To UBound(JoyStick) 'this checks for each axis of our joystick
        'joystick(1) should be the left paddle
        'joystick(2) should be the right paddle
        'joystick(3) should be the d-pad
        If JoyStick(i).Active Then 'check to see if any of the joysticks are active
            Print Using "STICK # ACTIVE:"; i
            Print "Hort:", JoyStick(i).Hort, "Vert:", JoyStick(i).Vert 'if one is, you can get the direction it's pressed in
            Print "X:", JoyStick(i).X, "Y:", JoyStick(i).Y 'simply by referencing these global variables
            Print "Angle:", JoyStick(i).Angle 'and this gives you the angle of the joystick
        End If
    Next
    For b = 1 To UBound(Button)
        'button(1) is the A button
        'button(2) is the B button
        'button(3) is the X button
        'button(4) is the Y button
        'button(5) is the top-left button on the front of the game pad
        'button(6) is the top-right button on the front of the game pad
        'button(7) is the select button  (top of game pad, beside the d-pad
        'button(8) is the start button (top of game pad, right of button(7)
        'button(9) is the left paddle being pushed in as a button
        'button(10) is the right paddle being pushed in as a button
        'button(11) is the bottom-left button on the front of the game pad (Z-Axis)
        'button(12) is the bottom-right button on the front of the game pad (Z-Axis)
        If Button(b) Then Print Using "Button ## down (of ##)"; b, UBound(Button) 'if the button is down, process it
    Next
    _Limit 30
    _Display
Loop

