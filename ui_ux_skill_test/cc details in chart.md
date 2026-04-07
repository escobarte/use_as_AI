● User answered Claude's questions:
  ⎿  · What type of services does your product offer? → Agency / Consulting
     · What tech stack should the landing page use? → React + Tailwind
     · What visual style do you prefer? → Trust & Authority

     I'll build a React + Tailwind landing page with a Trust & Authority aesthetic — think deep navy, gold accents,
  strong typography, social proof. Let me create it now.

    What's included:

  - Fixed nav — smooth scroll links + CTA button
  - Hero — headline, sub-copy, two CTAs, and a 2×2 stats grid with trust logo bar
  - Services — 6 service cards with icons and hover effects
  - Results — 3 case study cards with outcome metrics
  - Process — 4-step numbered flow (Discovery → Diagnosis → Design → Deliver)
  - Testimonials — 3 client quotes with star ratings
  - Contact form — name, company, email, revenue range, message + submit handler
  - Footer

  Customization checklist:
  1. Replace Apex Consulting with your firm name
  2. Update the tagline and hero copy
  3. Swap out the 6 service names/descriptions
  4. Replace case study metrics with real ones
  5. Add real client testimonials
  6. Wire the form to your backend (e.g., Formspree, HubSpot, or your own API)
  7. Replace the logo row placeholders with actual client logos

  Brewed for 3m 43s
  Tokens 6%

  ---- Step 2 ----
  the prompt
  ```
  # Промпт для Claude Code — вставь целиком

---

## Задача

Модифицируй текущий сайт Apex Consulting. Нужно 3 изменения:

### 1. Hero секция — добавить анимации (стиль hero-animated с 21st.dev)

Добавь в hero секцию анимации появления элементов при загрузке страницы:
- Заголовок "Strategic Consulting That Delivers Results" — staggered reveal: каждое слово появляется по очереди снизу вверх с `opacity: 0 → 1` и `translateY: 20px → 0`, задержка между словами ~0.08s
- Подзаголовок и описание — fade in снизу с задержкой 0.3s после заголовка
- Бейдж "TRUSTED BY 200+ COMPANIES" — slide in слева с fade
- Кнопки — появляются с задержкой 0.5s, scale от 0.95 до 1 + fade in
- Карточки статистики справа ($2.4B+, 98%, 15+, 200+) — staggered fade in, каждая карточка с задержкой +0.1s
- Блок "TRUSTED BY LEADERS AT" — fade in последним

Используй `framer-motion` (`motion/react`) если проект на React/Next.js. Если чистый HTML — используй CSS `@keyframes` + `animation-delay`.

### 2. Карточки статистики — эффект свечения при наведении

Добавь на карточки ($2.4B+, 98%, 15+, 200+) следующий hover-эффект:
- При наведении мышки — по периметру карточки пробегает светящаяся граница (animated gradient border glow)
- Реализация: оберни каждую карточку в контейнер с `position: relative; overflow: hidden`, внутри добавь `::before` псевдоэлемент с `conic-gradient` который вращается через `@keyframes rotate { 100% { transform: rotate(360deg) } }`
- Свечение цвета — оранжевый (#E87A2D → #F4A460), слегка тёплый
- В покое карточки без эффекта, свечение только при `:hover`
- Transition плавный, ~0.3s

### 3. Кнопки — стиль Shiny Button

Замени текущие кнопки "Schedule a Strategy Call" и "View Case Studies" на shiny button:
- Кнопка имеет animated shine эффект — полоска света пробегает слева направо по поверхности кнопки в цикле
- Реализация: `::before` псевдоэлемент с `linear-gradient(110deg, transparent 25%, rgba(255,255,255,0.3) 50%, transparent 75%)` + `background-size: 200% 100%` + анимация `@keyframes shine { to { background-position: -200% 0 } }` длительность ~3s infinite
- "Schedule a Strategy Call" — основной цвет фона слегка оранжевый (#E87A2D), текст белый
- "View Case Studies" — прозрачный фон, оранжевая граница, оранжевый текст, shine эффект более субтильный (opacity 0.15)

### 4. Цветовая схема

Замени все жёлтые/золотые акценты на тёплый оранжевый:
- Основной акцент: `#E87A2D` (warm orange)
- Hover акцент: `#F4A460` (sandy orange)  
- Слово "Delivers Results" в заголовке — цвет `#E87A2D` вместо жёлтого
- Кнопка "Book a Call" в навбаре — тоже оранжевый

---

## Важно

- НЕ меняй структуру и контент (тексты, числа оставь как есть)
- НЕ удаляй существующие секции
- Сохрани тёмную тему (dark background)
- Все анимации должны быть `prefers-reduced-motion` friendly — добавь `@media (prefers-reduced-motion: reduce)` для отключения анимаций
  ```

  Progression 
  ```
  ● All 4 changes from prompt.md have been applied to index.html:

  1. Hero animations (CSS keyframes)
  - Badge: slides in from left (slideInLeft)
  - Heading words: staggered fadeUp per word, ~0.08s delay each
  - Subheading/description: fadeUp at 0.55s delay
  - Buttons: scaleIn (0.95→1 + fade) at 0.75s
  - Stat cards: staggered fadeUp at 0.7–1.0s each
  - Trust logos row: last to appear at 1.15s

  2. Stat card glow border on hover
  - Each card wrapped in .stat-card-wrap with position:relative; overflow:hidden
  - ::before uses conic-gradient with orange (#E87A2D → #F4A460)
  - Rotates via @keyframes rotateBorder only on :hover, with opacity transition 0.3s

  3. Shiny button effect
  - .btn-shiny on "Schedule a Strategy Call" (orange fill) and "View Case Studies" (orange outline)
  - ::before with linear-gradient shine strip animates background-position in 3s loop
  - Outline button uses .btn-shiny-outline with subtler opacity: 0.15 shine
  - Also applied to "Book a Call" navbar button and the contact form submit button

  4. Color scheme — warm orange replaces gold/yellow
  - All accents switched to #E87A2D (primary) / #F4A460 (hover)
  - "Delivers Results" text gradient updated to orange
  - Card borders, stat card backgrounds, section labels, avatars, stars all use orange

  prefers-reduced-motion — all animations disabled via @media query as required.

  ```

✻ Crunched for 4m 4s
Tokens 12-20%