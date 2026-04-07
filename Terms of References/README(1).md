# Transnatur INC — Landing Page Project

## Quick Start

1. Open Claude Code in your project folder
2. Run: `claude`
3. Paste this prompt:

```
Read SKILL-landing-brief.md in this folder.

Then follow these steps exactly:

STEP 1 — Read the web-artifacts-builder skill:
Read ./web-artifacts-builder/SKILL.md

STEP 2 — Initialize the React project:
Run: bash ./web-artifacts-builder/scripts/init-artifact.sh transnatur-landing
Then: cd transnatur-landing

STEP 3 — Build the full site using React + TypeScript + Tailwind CSS + shadcn/ui.
Create these pages as separate route components:
- / → Main landing page (index)
- /form → Lead form page
- /thankyou → Thank you page

Follow ALL branding, colors, fonts, content, and layout rules from SKILL-landing-brief.md exactly.
Use React Router for navigation between pages.
Use Tailwind CSS for all styling.
Use shadcn/ui components where appropriate (Button, Input, Select, Form).
Do NOT use Inter, Roboto, or system fonts — use Poppins (800) and Bebas Neue from Google Fonts.
Images are in the assets/ folder — reference them correctly.

STEP 4 — Bundle to single HTML file:
Run: bash ./web-artifacts-builder/scripts/bundle-artifact.sh

STEP 5 — Show me the bundle.html file.
```

## Структура папки проекта

```
landing-steck/
├── .git/
├── README.md
├── SKILL-landing-brief.md
├── web-artifacts-builder/
│   ├── SKILL.md
│   └── scripts/
│       ├── init-artifact.sh
│       ├── bundle-artifact.sh
│       └── shadcn-components.tar.gz
└── assets/
    ├── Ttransnatur_logo_white.png
    ├── Ttransnatur_logo_black.png
    ├── cover_img.png
    └── truck.png
```

⚠️ Убедись что папка `assets/` с картинками существует в проекте!

## Stack

| Tool | Role |
|------|------|
| React 18 + TypeScript | UI компоненты и роутинг |
| Vite | Dev сервер |
| Tailwind CSS | Все стили |
| shadcn/ui | UI компоненты (Button, Input, Select) |
| Parcel | Собирает всё в один `bundle.html` |

## Google Sheets Setup

См. раздел **Google Sheets Integration** в `SKILL-landing-brief.md`.
Делай это ПОСЛЕ того как `bundle.html` готов.

## Contact

Vasilii Iurcu — (312) 909-4861 — Transnaturinc@gmail.com
