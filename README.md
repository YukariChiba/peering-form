# Peering Form

A printable peering form built using [Typst](https://typst.app/).

## Build & Usage

### Requirements

- typst
- font: IBM Plex Sans (or put in `fonts/`)

### Customize

This form can be customized by setting variables in `variable.typ`:

- `ownas`: Your ASN list (e.g., `("AS174", "AS6939")`).
- `ownprefix`: Your telephony prefixes.
- `footer`: Your contact information (Phone, Fax, Email).
- `version`: Version string.
- `globalfont`: Change if you prefer a different font family.

### Build

```bash
# this will generate `index.pdf`
typst compile index.typ
# this will generate `telephony.pdf`
typst compile telephony.typ
```

To build a version without preview watermark, edit `variable.typ` and set `#let preview = false`.

## License

This project is licensed under the **WTFPL** (Do What The Fuck You Want To Public License).
