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
