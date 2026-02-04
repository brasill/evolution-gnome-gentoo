#!/bin/bash

set -e

command -v equery >/dev/null 2>&1 || {
  echo "❌ equery não encontrado. Instale app-portage/gentoolkit."
  exit 1
}

REQUIRED_PACKAGES=(
  mail-client/evolution
  gnome-extra/evolution-data-server
  net-libs/gnome-online-accounts
)

EVOLUTION_FLAGS=(ldap ssl spell crypt libnotify)
EDS_FLAGS=(ldap kerberos oauth-gtk3 oauth-gtk4)

echo "🔍 Verificando pacotes..."
for pkg in "${REQUIRED_PACKAGES[@]}"; do
  equery list -i "$pkg" &>/dev/null || {
    echo "❌ Pacote ausente: $pkg"
    exit 1
  }
done

check_flags() {
  local pkg="$1"; shift
  for flag in "$@"; do
    equery uses "$pkg" | grep -E "^\s+\+\s+$flag\b" &>/dev/null       && echo "✔️ $pkg :: $flag"       || echo "❌ $pkg :: $flag (desativada)"
  done
}

check_flags mail-client/evolution "${EVOLUTION_FLAGS[@]}"
check_flags gnome-extra/evolution-data-server "${EDS_FLAGS[@]}"

echo "✅ Verificação concluída."
