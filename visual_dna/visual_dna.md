# Visual DNA — «Hotle» Architecture Studio

> Технический файл-инструкция для AI-агента.
> Воспроизводи этот стиль дословно. Отклонение = провал.

---

## 1. Композиция и Сетки

### Базовая сетка

Макет построен на **12-колоночной сетке** с агрессивным использованием полной ширины viewport. Однако сетка — не клетка, а каркас, который намеренно нарушается.

```css
/* Design tokens — Grid */
--grid-columns: 12;
--grid-gutter: 20px;
--grid-margin-desktop: 40px;   /* узкие поля — контент «дышит» за счёт внутренних whitespace */
--grid-margin-mobile: 16px;
--max-width: none;              /* КРИТИЧНО: нет max-width обёртки, контент edge-to-edge */
```

### Логика расположения

- **Hero-секция**: изображение занимает ~85% viewport height. Заголовок «Hotle» — гигантский, наложен поверх фотографии (overlap). Навигационная строка — поверх изображения с `position: absolute`, а не над ним.
- **Наслоение (Overlapping)**: ключевой приём. Типографика ВСЕГДА перекрывает изображения. Текст не боится залезать на фото. Это не баг — это фирменный знак.
- **Асимметрия**: блок статистики (120+, 15+, 5+) расположен на нижней трети экрана. Изображение кабины справа — смещено вправо, оставляя текстовый блок слева. Элементы НЕ центрируются по вертикальной оси — они «гравитируют» к краям.
- **Whitespace как инструмент**: между секцией «Stunning architecture…» и блоком статистики — щедрый вертикальный отступ (~120–160px). Пустота здесь осознанная, она создаёт ритм «вдох-выдох».

```css
/* Tailwind-эквиваленты ключевых отступов */
.section-gap    { @apply py-24 md:py-32 lg:py-40; }
.hero-overlap   { @apply -mt-16 md:-mt-24 relative z-10; }
.content-indent { @apply pl-0 md:pl-16 lg:pl-24; }  /* текст со сдвигом, а не по центру */
```

### Принцип расположения блоков

| Секция | Поведение |
|--------|-----------|
| Hero | Full-bleed image + overlay text, edge-to-edge |
| Manifesto | Крупный текст, выравнивание по левому краю, ~60% ширины |
| Feature card | Текст слева (40%) + изображение справа (55%), с зазором между |
| Stats row | 3 колонки, разделённые тонкими вертикальными линиями |
| Comfort × Nature | Полноширинный текст, mixed-weight typography |

---

## 2. Типографика

### Характер

Два полюса: **serif для эмоции** и **sans-serif для информации**. Контраст между ними — максимальный.

### Шрифтовая пара

```css
/* Design tokens — Typography */
--font-display: 'PP Editorial New', 'Times New Roman', serif;
    /* или ближайший аналог: 'Playfair Display', 'DM Serif Display' */
--font-body: 'Neue Haas Grotesk', 'Helvetica Neue', sans-serif;
    /* или: 'Switzer', 'General Sans', 'Satoshi' */
--font-mono: нет;  /* моноширинный не используется */
```

### Масштабная шкала (Type Scale)

```css
/* Экстремальные размеры — это обязательно */
--text-hero:      clamp(80px, 12vw, 180px);   /* «Hotle» — гигант */
--text-display:   clamp(42px, 5vw, 72px);      /* «Stunning architecture…» */
--text-heading:   clamp(28px, 3vw, 48px);       /* «Comfort × Nature» */
--text-subhead:   clamp(14px, 1.2vw, 18px);     /* навигация, подписи */
--text-body:      clamp(14px, 1vw, 16px);        /* описательный текст */
--text-caption:   clamp(10px, 0.8vw, 12px);      /* мелкие подписи, метки */
--text-stat:      clamp(36px, 4vw, 64px);        /* «120+», «15+», «5+» */
```

### Трекинг и интерлиньяж

```css
/* Hero-заголовок */
.hero-title {
  font-size: var(--text-hero);
  font-family: var(--font-display);
  font-weight: 400;              /* НЕ bold — regular или medium */
  letter-spacing: -0.04em;       /* негативный трекинг — буквы «слипаются» */
  line-height: 0.85;             /* экстремально сжатый интерлиньяж */
  text-transform: none;          /* mixed case, не uppercase */
}

/* Manifesto */
.manifesto-text {
  font-size: var(--text-display);
  font-family: var(--font-display);
  font-weight: 400;
  font-style: normal;
  letter-spacing: -0.02em;
  line-height: 1.1;
}

/* КРИТИЧНО: слова "architecture", "live", "work" — italic */
.manifesto-text em {
  font-style: italic;
  font-family: var(--font-display);  /* тот же serif, но italic-начертание */
}

/* Навигация и подписи */
.nav-link {
  font-size: var(--text-caption);
  font-family: var(--font-body);
  font-weight: 400;
  letter-spacing: 0.05em;          /* позитивный трекинг — разрежённый */
  text-transform: uppercase;
}

/* Статистика */
.stat-number {
  font-size: var(--text-stat);
  font-family: var(--font-body);
  font-weight: 500;
  letter-spacing: -0.02em;
}
.stat-label {
  font-size: var(--text-caption);
  font-family: var(--font-body);
  font-weight: 400;
  letter-spacing: 0.03em;
  text-transform: none;
  color: var(--color-muted);
}
```

### Принцип italic

Italic используется **семантически**: выделяются ключевые слова-концепции (_architecture_, _live_, _work_, _chill_, _Nature_). Это не декорация — это акцент на философских понятиях бренда.

---

## 3. Цветовая стратегия

### Палитра

```css
/* Design tokens — Color */
--color-bg:           #FFFFFF;         /* чистый белый, без серого оттенка */
--color-bg-dark:      #1A1A1A;         /* для hero-overlay и тёмных секций */
--color-text:         #111111;         /* почти чёрный, не #000 */
--color-text-inverse: #FFFFFF;
--color-muted:        #888888;         /* подписи, вторичный текст */
--color-border:       #E0E0E0;         /* тонкие разделители */
--color-border-dark:  #333333;         /* разделители на тёмном фоне */
--color-accent:       none;            /* ЦВЕТНОГО АКЦЕНТА НЕТ */
```

### Логика взаимодействия цветов

- **Монохром — абсолютный**: палитра ограничена чёрным, белым и серым. Никакого цветного акцента. Вообще. Цвет приходит ТОЛЬКО через фотографии (тёплое свечение окон, зелень ландшафта).
- **Контраст через массу**: огромный чёрный текст на белом фоне — это и есть «акцент». Визуальная иерархия строится через размер и вес типографики, а не через цвет.
- **Фотография = единственный источник цвета**: изображения намеренно тёплые (golden hour, янтарный свет изнутри зданий). Это создаёт эмоциональный контраст с холодной чёрно-белой типографикой.

### Нет градиентов, нет шумов

Градиенты НЕ используются. Зернистость (grain) НЕ применяется. Blend modes НЕ используются. Чистота и плоскость — основа.

---

## 4. Детали и Текстуры

### Что создаёт «дорогой» вид

```css
/* Тонкие разделители */
.divider {
  border: none;
  border-top: 1px solid var(--color-border);
  /* Tailwind: border-t border-gray-200 */
}

/* Вертикальные разделители в stats */
.stat-divider {
  width: 1px;
  height: 60%;
  background: var(--color-border);
  align-self: center;
}

/* Pill-кнопки (навигационные табы) */
.pill-button {
  border: 1px solid var(--color-text);
  border-radius: 999px;           /* единственное скругление в макете */
  padding: 6px 16px;
  font-size: var(--text-caption);
  font-family: var(--font-body);
  background: transparent;
  color: var(--color-text);
  transition: background 0.3s ease, color 0.3s ease;
}
.pill-button:hover {
  background: var(--color-text);
  color: var(--color-text-inverse);
}
.pill-button--active {
  background: var(--color-text);
  color: var(--color-text-inverse);
}

/* Стрелки навигации */
.nav-arrow {
  width: 40px;
  height: 40px;
  border: 1px solid var(--color-border);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: transparent;
  /* Иконка внутри — тонкая стрелка, stroke-width: 1px */
}
```

### Фотографии

```css
.hero-image {
  width: 100%;
  height: 85vh;
  object-fit: cover;
  /* НЕТ border-radius — изображения строго прямоугольные */
  /* НЕТ тени — изображения лежат плоско */
}

.feature-image {
  width: 100%;
  aspect-ratio: 4/3;
  object-fit: cover;
  /* прямые углы, без рамок, без теней */
}
```

### Микро-элементы

- **Маркер секции**: маленький заполненный кружок (●) или символ «+» рядом с заголовком секции — `font-size: 8px; color: var(--color-muted);`
- **Нумерация/индексация**: мелкие числовые индексы рядом с названиями секций: `01`, `02` — шрифт body, `font-size: 10px`, `letter-spacing: 0.1em`
- **Стрелка перехода**: кастомная SVG-стрелка (↗) — диагональная, тонкая, `stroke-width: 1`

---

## 5. Логика адаптивности

### Принцип: сжимаем масштаб, сохраняем напряжение

```
Desktop (1440px+)    →  Tablet (768px)     →  Mobile (375px)
─────────────────────────────────────────────────────────────
Hero: 12vw title     →  8vw title          →  15vw title
2-3 col layouts      →  1-2 col layouts    →  1 col stacked
Overlap text/image   →  Overlap сохраняется →  Overlap сохраняется (!)
40px margins         →  24px margins        →  16px margins
Stats: 3 in row      →  3 in row            →  3 in row (сжатые)
```

### Критические правила мобильной адаптации

1. **Overlap НЕ убирать**: на мобильном заголовок всё так же залезает на изображение. Это ДНК стиля.
2. **Размер hero-текста**: на мобильном `font-size` остаётся крупным (не менее `48px`). Текст может переноситься на 3–4 строки — это нормально.
3. **Полная ширина изображений**: на мобильном изображения идут edge-to-edge (без отступов от краёв экрана).
4. **Stats-строка**: остаётся горизонтальной даже на мобильном. Числа уменьшаются, но не уходят в вертикальный стэк.
5. **Навигация**: на мобильном — бургер-меню. Но логотип остаётся в левом верхнем углу, «Join the Nation» — в правом.

```css
/* Адаптивные breakpoints */
@media (max-width: 1024px) {
  .hero-title { font-size: clamp(56px, 10vw, 120px); }
  .manifesto-text { font-size: clamp(32px, 5vw, 48px); }
}

@media (max-width: 768px) {
  .hero-title { font-size: clamp(48px, 14vw, 80px); }
  .feature-grid { grid-template-columns: 1fr; }
  .manifesto-text { font-size: clamp(28px, 7vw, 42px); }
}

@media (max-width: 480px) {
  .hero-title { font-size: 15vw; line-height: 0.85; }
  .stats-row { gap: 8px; }
  .stat-number { font-size: clamp(24px, 8vw, 36px); }
}
```

---

## 6. Анти-паттерны

### Чего в этом дизайне КАТЕГОРИЧЕСКИ НЕТ

| Анти-паттерн | Статус | Комментарий |
|---|---|---|
| `border-radius` на карточках/изображениях | ❌ ЗАПРЕЩЕНО | Только pill-кнопки (`border-radius: 999px`) и круглые иконки |
| `box-shadow` | ❌ ЗАПРЕЩЕНО | Нет теней вообще. Ни на карточках, ни на кнопках, ни на изображениях |
| Градиенты (`linear-gradient`, `radial-gradient`) | ❌ ЗАПРЕЩЕНО | Чистые плоские цвета |
| Системные шрифты (Inter, Roboto, Arial, SF Pro) | ❌ ЗАПРЕЩЕНО | Только кастомные шрифты: serif display + grotesque sans |
| Цветные акценты (синий, фиолетовый, зелёный) | ❌ ЗАПРЕЩЕНО | Монохром. Цвет — только через фото |
| Иконки из стандартных паков (Heroicons, Lucide крупные) | ❌ ЗАПРЕЩЕНО | Только кастомные тонкие стрелки и минимальные символы |
| Центрирование всего подряд (`text-center` на всё) | ❌ ЗАПРЕЩЕНО | Выравнивание по левому краю — основа. Центр — только для stats |
| Крупные CTA-кнопки | ❌ ЗАПРЕЩЕНО | Нет «Buy Now» / «Get Started» жирных кнопок. Только pill и текстовые ссылки |
| Background с grain/noise overlay | ❌ ЗАПРЕЩЕНО | Чистый белый/чёрный без текстур |
| Параллакс-эффекты | ❌ ОСТОРОЖНО | Если применять — только тонкий, на hero-изображении |
| Скругленные карточки с padding | ❌ ЗАПРЕЩЕНО | Карточек как таковых нет. Контент лежит на открытой плоскости |
| Hover-эффекты с масштабированием (`scale(1.05)`) | ❌ ЗАПРЕЩЕНО | Hover — только смена цвета или opacity |

---

## 7. Быстрая шпаргалка для агента

```
ДЕЛАЙ:
✓ Гигантский serif-заголовок с отрицательным трекингом
✓ Текст поверх изображений (overlap обязателен)
✓ Чёрно-белая палитра, цвет только через фотографии
✓ Тонкие 1px разделители
✓ Pill-кнопки с border
✓ Щедрый whitespace между секциями
✓ Italic для ключевых слов-концепций
✓ Edge-to-edge изображения без скруглений
✓ Мелкие uppercase подписи с wide tracking
✓ Асимметричные layouts

НЕ ДЕЛАЙ:
✗ border-radius на изображениях или карточках
✗ box-shadow где-либо
✗ Цветные акценты
✗ Стандартные AI-шрифты (Inter, Roboto)
✗ Центрирование всего текста
✗ Крупные CTA-кнопки
✗ Градиенты и grain
✗ Hover scale-эффекты
✗ Карточки с padding и скруглениями
✗ max-width контейнер уже 1400px
```

---

## 8. Референсные CSS Custom Properties (полный набор)

```css
:root {
  /* Grid */
  --grid-columns: 12;
  --grid-gutter: 20px;
  --grid-margin: 40px;

  /* Colors */
  --c-bg: #FFFFFF;
  --c-bg-dark: #1A1A1A;
  --c-text: #111111;
  --c-text-inv: #FFFFFF;
  --c-muted: #888888;
  --c-border: #E0E0E0;
  --c-border-dark: #333333;

  /* Typography */
  --f-display: 'PP Editorial New', 'Playfair Display', 'DM Serif Display', Georgia, serif;
  --f-body: 'Neue Haas Grotesk', 'Switzer', 'Satoshi', 'Helvetica Neue', sans-serif;

  /* Type Scale */
  --ts-hero: clamp(80px, 12vw, 180px);
  --ts-display: clamp(42px, 5vw, 72px);
  --ts-heading: clamp(28px, 3vw, 48px);
  --ts-subhead: clamp(14px, 1.2vw, 18px);
  --ts-body: clamp(14px, 1vw, 16px);
  --ts-caption: clamp(10px, 0.8vw, 12px);
  --ts-stat: clamp(36px, 4vw, 64px);

  /* Spacing */
  --sp-section: clamp(80px, 10vw, 160px);
  --sp-block: clamp(40px, 5vw, 80px);
  --sp-element: clamp(16px, 2vw, 32px);

  /* Transitions */
  --ease-default: cubic-bezier(0.25, 0.1, 0.25, 1);
  --duration-default: 0.3s;
  --duration-slow: 0.6s;

  /* Borders */
  --border-thin: 1px solid var(--c-border);
  --border-thin-dark: 1px solid var(--c-border-dark);
  --radius-pill: 999px;
  --radius-none: 0;        /* default для всего */
}
```
