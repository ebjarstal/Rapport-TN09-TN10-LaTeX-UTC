# Copilot Instructions - UTC TN09/TN10 LaTeX Report Template

## Project Overview
This is a French-language LaTeX template for UTC (Université de Technologie de Compiègne) internship reports (stages TN09/TN10). The template follows GI department structure recommendations and is designed for Overleaf compatibility.

## Architecture & File Organization

### Main Entry Point
- `doc.tex`: Root document that orchestrates all components via `\include{}` statements
- Uses custom UTC styling via `lib/utc-report-template.sty` and `lib/glossaire.sty`

### Key Directories
- `lib/`: Custom packages, macros, and styling (DO NOT modify unless changing template fundamentals)
- `parts/`: Individual report chapters (1-7), numbered for inclusion order
- `assets/`: Images and graphics (currently contains `UTC.eps` logo)
- `references.bib`: BibLaTeX bibliography entries using `biber` backend

### Document Structure (Fixed Order)
1. Frontpage (auto-generated from `lib/frontpage.tex`)
2. Remerciements (acknowledgments)
3. Table of contents (auto)
4. Introduction → Presentation → Missions → Realisations → Conclusion
5. Glossary, Bibliography, List of Figures
6. Annexes

## Custom Components & Macros

### UTC Branding (`lib/utc-report-template.sty`)
- **Colors**: `jauneUTC` (RGB 255,217,17), `grisUTC`, `jauneClairUTC`, `grisClairUTC`
- **Fonts**: Sans-serif default (`\sfdefault`) with `lmodern` package
- **Headers**: Yellow 2pt rule with UTC logo, custom `UTC` pagestyle
- **Geometry**: 2cm top/bottom, 3cm left/right margins

### Reusable Macros (`lib/macro.tex`)
Always use these predefined macros instead of raw LaTeX:

```latex
\boxTEXTE{Title}{Content}              % Gray-bordered text box with title
\boxIMAGE{\textwidth}{0.98\textwidth}{path}{Caption}{label}  % Framed figure
\boxVide{Content}                       % Empty styled box for custom content
```

### Glossary System (`lib/glossaire.sty`)
- Define terms: `\newglossaryentry{key}{name=\underline{text}, description={...}}`
- Reference in text: `\gls{key}`
- Auto-prints after main content via `\printglossaries`

### Bibliography
- Uses BibLaTeX with `biber` backend (NOT BibTeX)
- Citation style: `\cite{key}` for numeric references
- Sorting: appearance order (`sorting=none`)
- Add entries to `references.bib` in standard BibTeX format

## Conventions & Patterns

### File Naming
- Parts files: Numbered `X-Name.tex` where X determines inclusion order
- Include statements omit `.tex` extension: `\include{parts/4-Missions}`

### French Language Settings
- UTF-8 encoding with T1 font encoding
- Babel French package loaded globally
- "Sommaire" replaces "Table of Contents"
- Use French typography (guillemets, spaces, etc.)

### Content Placeholders
Template uses `\lipsum` for demo text. Replace with actual content, preserving:
- Chapter/section structure
- Label conventions (e.g., `fig:test_box_image`)
- Macro usage patterns shown in `parts/2-Introduction.tex`

## Build & Compilation

### Required LaTeX Distribution
- **Engine**: pdfLaTeX or XeLaTeX
- **Bibliography**: Biber (NOT BibTeX)
- **Glossaries**: Requires `makeglossaries` or `makeindex`

### Compilation Sequence
```bash
pdflatex doc.tex
biber doc
makeglossaries doc
pdflatex doc.tex
pdflatex doc.tex  # Second pass for cross-references
```

### Overleaf Usage
Upload as zipped project or use [template link](https://www.overleaf.com/latex/templates/utc-tn09-slash-tn10/zbtpffvtkyyp). Overleaf handles compilation automatically.

## Common Modifications

### Personalizing the Frontpage
Edit `lib/frontpage.tex`:
- Student name/semester/branch (appears twice: top-right and bottom)
- Report title/subtitle (between yellow rules)
- Dates, supervisors, location (bottom section)

### Adding Figures
Place images in `assets/`, then use:
```latex
\boxIMAGE{\textwidth}{0.98\textwidth}{assets/myimage.png}{Caption text}{fig:mylabel}
```
Reference with `\ref{fig:mylabel}` or `(\ref{fig:mylabel})`

### Table of Contents Depth
- `\setcounter{tocdepth}{1}`: Controls display (0=chapters, 1=sections, 2=subsections)
- `\setcounter{secnumdepth}{2}`: Controls numbering depth (set in `doc.tex`)

## Anti-Patterns to Avoid
- ❌ Don't use `\input{}` - template consistently uses `\include{}`
- ❌ Don't create custom tcolorbox instances - use provided `\boxTEXTE/IMAGE/Vide` macros
- ❌ Don't modify `lib/utc-report-template.sty` color definitions (UTC branding)
- ❌ Don't use BibTeX commands (`\bibliography{}`) - template uses BibLaTeX (`\printbibliography`)
- ❌ Don't place figures outside `assets/` directory (breaks `\graphicspath` config)
