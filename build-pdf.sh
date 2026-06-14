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
python3 -c "from weasyprint import HTML; HTML('IAC-Study-Guide.html', base_url='.').write_pdf('IAC-Study-Guide.pdf')"
echo "Wrote IAC-Study-Guide.pdf"
