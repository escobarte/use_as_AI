Пошаговая установка

Шаг 1 — Создай проект Next.js
bashnpx create-next-app@14 my-app \
  --typescript \
  --tailwind \
  --eslint \
  --app \
  --src-dir \
  --import-alias "@/*"
cd my-app

Шаг 2 — Установи библиотеки
bashnpm install framer-motion react-hook-form zod @hookform/resolvers clsx tailwind-merge lucide-react

Шаг 3 — Установи shadcn/ui
bashnpx shadcn-ui@latest init
Выбери:

Style: Default
Base color: Slate
CSS variables: Yes


Шаг 4 — Установи Prettier
bashnpm install -D prettier prettier-plugin-tailwindcss
Создай .prettierrc:
json{
  "plugins": ["prettier-plugin-tailwindcss"]
}

Шаг 5 — Создай CLAUDE.md
bashtouch CLAUDE.md
Вставь внутрь:
markdown# Project Stack
- Next.js 14 App Router
- TypeScript
- Tailwind CSS
- shadcn/ui
- Framer Motion
- React Hook Form + Zod
- Lucide React
- CLSX + Tailwind Merge

# Rules
- Use App Router, never Pages Router
- All components in /src/components
- Use TypeScript always
- Use shadcn/ui components first before creating custom
- Animations via Framer Motion
- Forms via React Hook Form + Zod

Шаг 6 — Проверь что всё работает
bashnpm run dev