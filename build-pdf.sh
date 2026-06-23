#!/usr/bin/env bash
# Regenerate IAC-Study-Guide.pdf from the HTML guide.
# PDFs are git-ignored (generated artifact) — run this whenever the HTML changes.
#
# Requires WeasyPrint (renders the @media print stylesheet, so every tabbed
# section is expanded into one continuous A4 document):
#   pip install weasyprint
#   # system libs (Debian/Ubuntu): apt-get install -y libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf-2.0-0 libffi-dev libcairo2
set -euo pipefail
cd "$(dirname "$0")"
for src in IAC-Study-Guide Substantive-Procedures IAC-Tax-Summary IAC-Tax-RateCard IAC-Tax-Rules-and-Principles IAC-Tax-Corporate-Rules IAC-Tax-Double-Tax-Agreements IAC-Tax-Employee-Benefits IAC-ACC-Control-Interests IAC-AUD-Comprehensive IAC-ACC-IFRS-Summary IAC-ACC-IFRS15-Control IAC-ACC-MindMaps IAC-ACC-IFRS3-PartOfCombination IAC-MAF-Discussion-Factors IAC-AUD-Exam-Master IAC-AUD-Audit-Strategy-NTE IAC-ACC-IAS12-DeferredTax IAC-Tax-Deceased-Estate IAC-AUD-Going-Concern IAC-Jan2026-Question-Summary; do
  [ -f "$src.html" ] || continue
  python3 -c "from weasyprint import HTML; HTML('$src.html', base_url='.').write_pdf('$src.pdf')"
  echo "Wrote $src.pdf"
done
