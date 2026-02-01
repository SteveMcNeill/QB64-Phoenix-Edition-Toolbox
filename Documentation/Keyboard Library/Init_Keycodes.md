# Init_KeyCodes

## Syntax

qb64

```
SUB Init_KeyCodes (Language AS STRING)
```

## Description

`Init_KeyCodes` initializes the keyboard‑handling library by loading the default key mappings for all physical key indices (`1 TO 254`).
It sets up:

- Unmodified ASCII values

- Ctrl, Shift, Alt, and AltGr mappings

- Key repeat timing

- Extended modifier mappings (via later calls)

- Optional language‑specific remapping for international layouts

This routine **must be called before using KeyHit**, unless the user forgets — in which case `KeyHit` automatically calls:

Code

```
Init_KeyCodes "US"
```

The routine also initializes the default AltGr behavior.

## Parameters

| Parameter  | Type   | Description                                                                                                          |
| ---------- | ------ | -------------------------------------------------------------------------------------------------------------------- |
| `Language` | STRING | Determines which international layout adjustments to apply. Supported values include `"US"`, `"DE"`, `"WE"`, `"IT"`. |

If an unsupported language is provided, only the default US layout is loaded.

## Behavior Overview

### 1. Load Default Keyboard Data

The routine begins by restoring the `default_keyboard_data` label and reading **254 lines of DATA**, each containing:

Code

```
Index, ASCII, Ctrl, Shift, Alt, AltGr, Repeat
```

These values populate:

- `Keys(i).Index`

- `Keys(i).ASCII`

- `Keys(i).Ctrl`

- `Keys(i).Shift`

- `Keys(i).Alt`

- `Keys(i).AltGr`

- `Keys(i).Repeat`

- `Keys(i).LastHit = 0`

- `Keys(i).Down = 0`

This forms the **base US keyboard layout**.

### 2. Set Default AltGr Behavior

After loading the base table:

Code

```
AltGr(0) = 165   'Right Alt
AltGr(1) = 0     'No secondary key
```

This matches Windows behavior: **Right Alt alone = AltGr**.

### 3. Apply Language‑Specific Overrides

Depending on the `Language` parameter, the routine loads additional Unicode mapping tables and applies remapping via:

- `Remap_KeyCode`

- `Remap_Extended_KeyCode`

Supported layouts:

#### **"DE" — German Layout**

- Loads Unicode table `Microsoft_windows_cp1250`

- Remaps keys such as:
  
  - Angle bracket key (`226`)
  
  - Brackets (`219`)
  
  - Number row (`48–57`)
  
  - Semicolon, equals, slash, etc.

- Adjusts AltGr mappings for characters like:
  
  - `@`, `{`, `}`, `|`, `€`, etc.

#### **"WE" — Western European Layout**

- Loads Unicode table `Microsoft_windows_cp1252`

- Remaps:
  
  - Punctuation keys
  
  - Number row
  
  - OEM keys
  
  - AltGr symbols such as `€`, `£`, `ø`, `œ`, etc.

#### **"IT" — Italian Layout**

- Loads Unicode table `ASCII_cp850`

- Remaps:
  
  - Punctuation
  
  - Number row
  
  - OEM keys
  
  - AltGr symbols specific to Italian keyboards

### 4. Unicode Mapping

For languages `"DE"`, `"WE"`, and `"IT"`, the routine uses:

Code

```
_MapUnicode unicode TO ASCIIcode
```

This ensures extended characters map correctly into the library’s internal ASCII‑compatible system.

## Example

qb64

```
'Initialize US layout
Init_KeyCodes "US"

'Initialize German layout
Init_KeyCodes "DE"

'Initialize Western European layout
Init_KeyCodes "WE"

'Initialize Italian layout
Init_KeyCodes "IT"
```

## Notes

- This routine must run **before** any remapping or key processing.

- `KeyHit` will automatically call it if needed, but explicit initialization is recommended.

- The DATA block defines the entire keyboard behavior for all 254 key indices.

- Language‑specific remapping is layered on top of the default US layout.

- Repeat timing is essential for natural typing behavior; modifiers use `Repeat = -1`.

## Related

- Remap_KeyCode

- Remap_Extended_KeyCode

- KeyHit

- KeyDown

- SetAltGr

- KeyboardInfo_Type
