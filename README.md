# 📧 Integração Evolution + GNOME Online Accounts no Gentoo Linux

Este repositório documenta a configuração do **Evolution** no **Gentoo
Linux** com integração nativa ao **GNOME Online Accounts (GOA)**, com
foco em **ambientes corporativos**, **segurança** e **boas práticas
Gentoo**.

------------------------------------------------------------------------

## 🎯 Objetivo

-   Configurar o Evolution com suporte a Microsoft, Google, LDAP,
    Kerberos e ProtonMail.
-   Integrar autenticação via GNOME Online Accounts (OAuth2).
-   Documentar USE flags obrigatórias no Gentoo.
-   Fornecer scripts de validação e automação.

------------------------------------------------------------------------

## 🧭 Escopo Suportado

✔️ Gentoo Linux (stable / testing)\
✔️ GNOME Shell\
✔️ OAuth2 / LDAP / Kerberos

------------------------------------------------------------------------

## 🔧 Configuração de USE Flags (Boas Práticas)

No Gentoo, **nunca** configure USE flags de forma genérica ou por
documentação antiga.\
As flags **mudam entre versões** e podem ser removidas, renomeadas ou
tornarem-se dependências internas.

### Fluxo correto:

``` bash
equery uses mail-client/evolution
emerge -pv mail-client/evolution
```

------------------------------------------------------------------------

## 📦 Instalação

``` bash
sudo emerge -av mail-client/evolution gnome-extra/evolution-data-server net-libs/gnome-online-accounts
```

------------------------------------------------------------------------

## 🧪 Scripts

### Pré-requisito

Os scripts utilizam o comando `equery`, fornecido pelo pacote:

``` bash
sudo emerge -av app-portage/gentoolkit
```

### Permissão de execução

``` bash
chmod +x scripts/*.sh
```

### Validação de ambiente

``` bash
./scripts/check-useflags.sh
```

------------------------------------------------------------------------

## 🔐 Segurança

-   OAuth2 via GOA evita uso de senhas em texto puro.
-   Recomendado uso de 2FA.
-   Suporte a GPG/PGP via flag `crypt`.

------------------------------------------------------------------------

## 📘 Documentação adicional

-   `docs/troubleshooting.md`

------------------------------------------------------------------------

## 📘 Referências

### Upstream GNOME

-   https://help.gnome.org/users/evolution/stable/
-   https://gnome.pages.gitlab.gnome.org/gnome-online-accounts/
-   https://gitlab.gnome.org/GNOME/evolution
-   https://gitlab.gnome.org/GNOME/evolution-data-server

### Documentação por Distribuição

-   https://wiki.gentoo.org/wiki/Evolution
-   https://wiki.gentoo.org/wiki/GNOME_Online_Accounts
-   https://wiki.archlinux.org/title/GNOME/Evolution
-   https://wiki.archlinux.org/title/GNOME_Online_Accounts

### Autenticação e Segurança

-   https://www.openldap.org/doc/
-   https://web.mit.edu/kerberos/
-   https://datatracker.ietf.org/doc/html/rfc6749
-   https://www.gnupg.org/documentation/

### Proton Mail

-   https://proton.me/support/mail/bridge/introduction-bridge
-   https://proton.me/security

------------------------------------------------------------------------

## 📜 Licença

MIT License --- veja o arquivo LICENSE.
