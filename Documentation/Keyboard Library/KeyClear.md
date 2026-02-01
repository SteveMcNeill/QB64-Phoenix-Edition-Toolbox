# KeyClear

## Syntax

qb64

```
SUB KeyClear
```

## Description

`KeyClear` flushes all pending key events from the library’s internal buffer.
It ensures that no “stale” keypresses remain before beginning a new input sequence.

This is especially useful after menus, pauses, or transitions where the user may have released keys slightly late, leaving residual events in the buffer.

## Behavior

The routine:

1. Waits briefly (`_DELAY .05`) to allow any final key‑up events to register.

2. Repeatedly calls `KeyHit` until it returns `0`, meaning the buffer is empty.

## Example

qb64

```
PRINT "Press any key to continue..."
SLEEP

KeyClear   'Flush leftover key events

PRINT "Now enter your name:"
```

## Notes

- This routine is safe to call at any time.

- It prevents accidental input carry‑over between program states.

- It relies on the library’s custom `KeyHit` function, not `_KEYHIT`.

## Related

- KeyHit

- SetAltGr
