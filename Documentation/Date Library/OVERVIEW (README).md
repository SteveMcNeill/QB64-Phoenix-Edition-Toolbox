# Date/Time Utility Library – Overview

## Introduction

The QB64PE Date/Time Utility Library provides a comprehensive collection of
functions that extend the capabilities of the built‑in `DATE$`, `TIME$`, and
`TIMER` statements. It offers flexible parsing, formatting, timestamp
generation, and calendar calculations, making it far easier to work with dates
and times in a wide variety of formats and use‑cases.

This library is designed to be reliable, expressive, and compatible with
QB64PE’s native date/time conventions while adding modern conveniences such as
sortable timestamps, universal formatting, and weekday determination.

---

## Core Features

### 1. Date Component Extraction

The library includes functions that extract specific components from a date
string based on a user‑defined format mask:

- `Date.Day$`
- `Date.Month$`
- `Date.Year$`

These allow parsing of dates in formats such as:

- `MM-DD-YYYY`
- `DD/MM/YY`
- `YYYY.MM.DD`
- and many others

Time component extractors provide similar functionality for `TIME$` strings:

- `Date.Hour$`
- `Date.Minute$`
- `Date.Second$`

This makes it easy to break down any date or time into its individual parts.

---

### 2. Timestamp Generation

The library provides multiple timestamp systems for different needs:

#### **Date.TimeStamp##**

A Unix‑style timestamp generator that returns seconds since January 1, 1970.
Supports:

- Dates before 1970 (negative timestamps)
- Leap‑year corrections
- Month/day rollover logic
- Integration with `TIMER` for precise time‑of‑day seconds

#### **Date.TimeStamp.HR$**

Produces a human‑readable, sortable timestamp in the form:

```
YYYYMMDD.HHMMSS
```

Ideal for:

- Filenames  
- Logs  
- Chronological sorting  

#### **ExtendedTimer##**

A lightweight, high‑performance timer based on the current date and `TIMER`.
Designed for real‑time measurement rather than historical accuracy.

---

### 3. Date Formatting and Conversion

#### **Date.ToString$**

Formats numeric date components (MM, DD, YYYY) into a custom layout using:

- `YYYY`
- `YY`
- `MM`
- `DD`

#### **Date.ToUniDate$**

A powerful universal date formatter supporting:

- Full month names (`January`)
- Abbreviated month names (`Jan`)
- Numeric months (`01`)
- Ordinal days (`01st`, `02nd`)
- Full weekday names (`Monday`)
- Abbreviated weekday names (`Mon`)
- 2‑digit or 4‑digit years

The format language is expressive and forgiving, allowing output such as:

- `Tuesday, February 10th, 2026`
- `10.02.2026`
- `Mon 10 Feb 26`

---

### 4. Weekday Calculation

#### **Date.WeekDay&**

Returns the weekday number (1–7) using Zeller’s Congruence:

- 1 = Sunday  
- 7 = Saturday  

#### **Date.WeekDay.Name$**

Returns the full weekday name:

- `"Sunday"` through `"Saturday"`

These functions work with any date format supported by the extraction routines.

---

## Design Philosophy

The library is built around:

- **Flexibility** — parse and format dates in virtually any layout  
- **Reliability** — consistent behavior across all supported formats  
- **Compatibility** — integrates cleanly with QB64PE’s native date/time system  
- **Utility** — suitable for logging, sorting, UI display, and timing  
- **Accuracy** — includes leap‑year logic and calendar‑correct calculations  

In short, this library transforms QB64PE’s basic date/time features into a
complete, modernized toolkit for parsing, formatting, converting, and analyzing
dates and times in any format you need.

---


