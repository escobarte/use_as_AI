# Tech Stack

| Layer | Choice |
|---|---|
| Framework | Next.js 14 (App Router) | Фреймворк на основе React для создания веб-сайтов. App Router — это новый способ организации файлов и маршрутов в проекте (папка /app вместо /pages). |
| Styling | Tailwind CSS | Библиотека CSS-классов. Стилизуешь прямо в HTML/JSX, не пишешь отдельные CSS файлы. |
| Animations | Framer Motion | Библиотека анимаций для React. Добавляешь движение к элементам простыми пропсами.
| UI components | shadcn/ui | 
| Icons | Lucide React + React Icons + Heroicons + Phosphor Icons| Библиотека иконок для React. Просто импортируешь и используешь |
| Forms | React Hook Form | Библиотека для управления формами в React. Упрощает валидацию и сбор данных. | Набор готовых UI компонентов (кнопки, модалки, карточки и тд). |
| Type Safety | TypeScript | добавляет типы к JavaScript. Claude Code генерирует более точный и безошибочный код. |
| Validation | Zod |  проверяет данные форм по схеме. Работает в паре с React Hook Form. |
| Class Utils | CLSX + Tailwind Merge | омогают комбинировать Tailwind классы без конфликтов. shadcn/ui использует их внутри.  |
| Code Quality | ESLint + Prettier |  ESLint находит ошибки, Prettier форматирует код. Оба встроены в Next.js 14 по умолчанию.  |



| Fonts | `Barlow Condensed` (700) for headings + `DM Sans` (400/500) for body — via `next/font/google` |
| Theme | **Dark industrial** — `#111111` background, `#C79A1B` mustard accent, no light mode |


## CLAUDE.md — файл в корне проекта. Claude Code читает его первым и знает твой стек, правила и структуру проекта