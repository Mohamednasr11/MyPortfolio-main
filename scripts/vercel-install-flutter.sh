#!/usr/bin/env bash
set -euo pipefail

FLUTTER_DIR="${FLUTTER_SDK_DIR:-.vercel-flutter}"

if [[ ! -x "${FLUTTER_DIR}/bin/flutter" ]]; then
  echo "Installing Flutter stable into ${FLUTTER_DIR}..."
  git clone --depth 1 --branch stable https://github.com/flutter/flutter.git "${FLUTTER_DIR}"
fi

"${FLUTTER_DIR}/bin/flutter" config --no-analytics
"${FLUTTER_DIR}/bin/flutter" --version
"${FLUTTER_DIR}/bin/flutter" pub get
