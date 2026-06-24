#!/bin/bash
# IA-360 Video — Render todos los title cards
# Requisitos: Node.js >= 22, FFmpeg, Chrome/Chromium
# Uso: bash render.sh

set -e

echo "🎬 IA-360 Video — Renderizando title cards..."
mkdir -p output

COMPS=(
  "compositions/01-intro-logo.html"
  "compositions/02-stat-problema.html"
  "compositions/03-solution-title.html"
  "compositions/04-features.html"
  "compositions/05-social-proof.html"
  "compositions/06-cta.html"
)

NAMES=(
  "01-intro-logo"
  "02-stat-problema"
  "03-solution-title"
  "04-features"
  "05-social-proof"
  "06-cta"
)

for i in "${!COMPS[@]}"; do
  echo "  → Renderizando ${NAMES[$i]}..."
  npx hyperframes render "${COMPS[$i]}" -o "output/${NAMES[$i]}.mp4"
done

echo ""
echo "✅ Listo. 6 title cards en ./output/"
echo ""
echo "📋 Próximo paso:"
echo "   1. Genera el video de avatar en HeyGen (ver heygen-brief.md)"
echo "   2. Monta en DaVinci Resolve según el timeline del brief"
echo "   3. Exporta en 1080p + variantes vertical y short"
