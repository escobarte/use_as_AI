# SKILL: Freight Solutions Landing Page
## Prompt for Claude Code

---

## ЗАДАЧА

Разработай одностраничный продающий HTML-сайт на тему **"Freight Solutions You Can Rely On"** для грузовой логистической компании. Сайт состоит из **8 блоков**. Ширина сайта — **1920px** (max-width контейнера — 1440px, центрирован).

---

## СТИЛЬ И ВИЗУАЛЬНОЕ НАПРАВЛЕНИЕ

### Общая эстетика
- **Минимализм с мощной типографикой** — огромные контрастные заголовки, много воздуха, чёткие сетки
- Вдохновение: стиль как у логистического бренда **BANKAR** — тёмные секции, оранжевые акценты, промышленная эстетика, фото контейнеров и грузов
- Не «корпоративный скучный» сайт — а **смелый, уверенный, мощный**

### Цветовой брендинг (обязательно использовать)
```
--color-primary: #FFDE73;      /* жёлтый — акцент, кнопки, highlights */
--color-accent: #FFDE73;
--color-bg: #000000;           /* чёрный фон — основной */
--color-text: #000000;         /* чёрный текст на светлых секциях */
--color-link: #FFDE73;
--color-white: #FFFFFF;
--color-gray-light: #F5F5F5;
--color-gray-dark: #1A1A1A;
```

### Типографика
- **Заголовки (h1, h2):** `TildaSans`, fallback: `'Helvetica Neue', sans-serif` — крупные, жирные, контрастные
- **Тело (body):** `Arial`, fallback: `sans-serif`
- h1: min 80px, жирный, line-height 0.95
- h2: 56–72px, жирный
- h3: 32px
- body: 16–18px

### Компоненты
- **Primary Button:** фон `#FFDE73`, текст `#000000`, border-radius `0px` (квадратные), жирный текст
- **Secondary Button:** прозрачный фон, граница `#FFDE73`, текст `#FFDE73`, border-radius `0px`
- **Base Unit:** 4px (отступы кратны 4)
- **Border Radius:** 0px (почти везде), исключение — карточки галереи: 8px max

### Анимации
- Плавное появление секций при скролле (intersection observer или CSS animation)
- Hover-эффекты на кнопках и карточках
- Строка логотипов партнёров — бесконечная прокрутка (marquee/CSS animation)

---

## СТРУКТУРА 8 БЛОКОВ

---

### БЛОК 1 — HERO (Главный экран)

**Цель:** Сразу захватить внимание. Тёмный фон, огромный заголовок, подзаголовок, CTA-кнопки, фоновое изображение.

**Контент:**
- Логотип компании: **FREIGHTCO.** (верхний левый угол)
- Навигация (верхний правый): Track Shipment | Services | Locations | Reviews | **Contact Us** (кнопка Primary)
- Главный заголовок (H1, очень крупный):
  ```
  Delivering Your Cargo
  Worldwide.
  ```
- Подзаголовок (p):
  ```
  Reliable freight solutions for businesses of all sizes.
  Sea, air, and rail — wherever you need to go.
  ```
- Две кнопки:
  - Primary: **Get a Quote**
  - Secondary: **Learn More**
- Поле поиска / трекинга (под кнопками):
  - Input 1: "Enter pickup location"
  - Input 2: "Enter destination"
  - Кнопка с иконкой лупы

**Фотография:**
> 📸 ВСТАВЬ ФОТО: Большой грузовой контейнер / корабль с контейнерами на тёмном фоне. Рекомендуется: unsplash.com/photos/shipping-container или аналог. Размер: full-width, высота ~100vh. Применить тёмный overlay (rgba 0,0,0,0.6) поверх фото.

**Стиль секции:** Тёмный (#000 или #0a0a0a), текст белый, акцент жёлтый (#FFDE73)

---

### БЛОК 2 — ПАРТНЁРЫ / ДОВЕРИЕ

**Цель:** Социальное доказательство. Логотипы известных клиентов/партнёров.

**Контент:**
- Маленький надписной текст сверху: `Trusted by leading companies worldwide`
- Строка с логотипами (SVG-текст или placeholder):
  ```
  OXFAM | DT Global | NAYBA | MOVE | Winsupply | FERGUSON | MAERSK | DHL
  ```
- Анимация: бесконечная прокрутка логотипов слева направо (CSS marquee)

**Стиль секции:** Светлый (#F5F5F5 или белый), логотипы серые/тёмные

---

### БЛОК 3 — УСЛУГИ (Services)

**Цель:** Показать 3 основных направления. Карточки с фотографиями.

**Заголовок секции (H2):**
```
Shipping & Logistics
Services
```

**3 карточки услуг:**

1. **Sea Shipping**
   - Текст: *Fast and reliable ocean freight for bulk cargo across major global ports.*
   - > 📸 ВСТАВЬ ФОТО: Контейнерный корабль в море / порт с кранами. Unsplash: "cargo ship sea"

2. **Air Shipping**
   - Текст: *Express air cargo delivery for time-sensitive shipments worldwide.*
   - > 📸 ВСТАВЬ ФОТО: Грузовой самолёт / аэропорт. Unsplash: "cargo airplane freight"

3. **Rail Shipping**
   - Текст: *Cost-effective rail freight solutions across continental routes.*
   - > 📸 ВСТАВЬ ФОТО: Грузовой поезд / железная дорога с контейнерами. Unsplash: "freight train cargo"

**Стиль карточек:** Тёмный фон, фото на 60% карточки, текст снизу, жёлтый акцент на hover, стрелка-кнопка в углу

**Стиль секции:** Белый фон, тёмный текст

---

### БЛОК 4 — ПРЕИМУЩЕСТВА (Why Choose Us)

**Цель:** Объяснить ценность. Тёмный фон, крупный заголовок слева, список справа.

**Заголовок (H2):**
```
Powering Logistics
Across Business
```

**Подзаголовок (p):**
```
We help your customers, scale operations, and boost efficiency with our advanced logistics platform, set to be the go-to solution for your supply chain.
```

**3 пункта (иконка + текст):**
1. 🔶 **Nationwide carrier network** — Access to 500+ verified carriers across all regions
2. 🔶 **Fully featured logistics software** — Real-time tracking, automated reports, smart routing
3. 🔶 **Exception tracking & live support** — 24/7 monitoring with instant alerts and dedicated managers

> 📸 ВСТАВЬ ФОТО: Склад / штабелированные оранжевые контейнеры снизу вверх (dramatic low angle). Unsplash: "shipping containers stacked orange". Разместить справа от текста, обрезанное, с жёлтым акцентным бордером.

**Стиль секции:** Тёмный (#111 или #000), текст белый, иконки жёлтые

---

### БЛОК 5 — ФОТОГАЛЕРЕЯ (Gallery)

**Цель:** Визуальное доверие. Показать реальные операции компании.

**Заголовок (H2):**
```
Operations Worldwide
```

**Подзаголовок (p):**
```
From port to door — we handle every mile with precision.
```

**Сетка фотографий: 2 ряда, неравные колонки (CSS Grid masonry-style)**

> 📸 ВСТАВЬ 6 ФОТО в сетку:
> - Фото 1 (большое): Вид сверху на порт с контейнерами. Unsplash: "aerial view container port"
> - Фото 2: Водитель грузовика / кабина. Unsplash: "truck driver logistics"
> - Фото 3: Склад изнутри с товарами. Unsplash: "warehouse interior logistics"
> - Фото 4 (большое): Самолёт на взлётной полосе ночью. Unsplash: "cargo plane night runway"
> - Фото 5: Рукопожатие на фоне контейнеров. Unsplash: "business handshake shipping"
> - Фото 6: Морской порт закат. Unsplash: "port sunset containers"

**Layout:** Grid 3 колонки, некоторые фото span 2 колонки. Hover: overlay с жёлтым тинтом.

**Стиль секции:** Белый фон

---

### БЛОК 6 — КАРТА / ЛОКАЦИИ (Locations)

**Цель:** Показать географию присутствия.

**Заголовок (H2):**
```
Find Locations To Buy, Sell
Or Lease Containers
```

**Подзаголовок:**
```
With depots on every continent, we're always close to where you need us.
```

> 📸 ВСТАВЬ: SVG или PNG карту мира (светлая/серая, минималистичная). На карте — жёлтые точки-маркеры в ключевых городах: New York, London, Dubai, Singapore, Shanghai, Sydney, São Paulo, Lagos. При hover на маркере — всплывающая подсказка с названием города.

**Альтернатива:** Используй открытую SVG карту мира (можно embedded inline SVG) с кружками на координатах городов.

**Под картой — 4 цифры-статистики:**
| Число | Подпись |
|-------|---------|
| 500+ | Carriers Worldwide |
| 48 | Countries Served |
| 10K+ | Shipments Monthly |
| 24/7 | Live Support |

**Стиль секции:** Светло-серый (#F5F5F5), тёмный текст, жёлтые акценты

---

### БЛОК 7 — ТРЕКИНГ / CTA (Track & Calculate)

**Цель:** Функциональный инструмент + призыв к действию. Тёмный фон.

**Разделён на 2 колонки:**

**Левая — Трекинг:**
- Заголовок (H2): `Track or Calculate Your Shipments`
- Input: "Enter your shipment code"
- Dropdown: "Select Your Service" (Sea / Air / Rail)
- Кнопка Primary: **Track Now**

> 📸 ВСТАВЬ ФОТО: Тёмный фон с контейнером или кораблём (едва видимый). Unsplash: "dark shipping port night". Применить overlay rgba(0,0,0,0.75).

**Правая — Быстрый расчёт стоимости:**
- Заголовок (H3): `Quickly Track Your Shipments`
- Текст: *Get an instant freight quote in under 2 minutes. No hidden fees.*
- Форма: Origin, Destination, Weight (kg), кнопка **Get Instant Quote**

**Стиль секции:** Тёмный (#0a0a0a), текст белый, форма на тёмной карточке (#1a1a1a)

---

### БЛОК 8 — ФУТЕР (Footer)

**Цель:** Финальный CTA + навигация + контакты.

**Верхняя часть — Большой финальный призыв:**
- Заголовок (H2, очень крупный):
  ```
  Ready to Ship
  With Confidence?
  ```
- Кнопка Primary: **Start Now**
- Кнопка Secondary: **Talk to an Expert**

**Нижняя часть — 4 колонки:**
1. **Логотип + описание:** FREIGHTCO. — Reliable freight for a connected world. Иконки соцсетей.
2. **Company:** About Us, Careers, Press, Blog
3. **Services:** Sea Freight, Air Freight, Rail Freight, Customs
4. **Contact:** hello@freightco.com | +1 800 FREIGHT | 123 Harbor Blvd, New York

**Самая нижняя строка:**
```
© 2025 FREIGHTCO. All rights reserved. | Privacy Policy | Terms of Service
```

**Стиль секции:** Чёрный фон (#000), текст белый/серый, акцент жёлтый

---

## ТЕХНИЧЕСКИЕ ТРЕБОВАНИЯ

```
- Чистый HTML5 + CSS3 + Vanilla JS (без фреймворков)
- Один файл: index.html (CSS и JS внутри через <style> и <script>)
- Ширина сайта: 1920px (max-width контента: 1440px, margin: auto)
- Полностью адаптивный (breakpoints: 1440px, 1024px, 768px, 375px)
- Google Fonts: подключить TildaSans (или замена: 'Oswald' / 'Bebas Neue') + Arial
- Smooth scroll между секциями
- Intersection Observer для анимации появления блоков
- Все изображения: используй реальные URL с unsplash.com (прямые ссылки на фото)
  Формат: https://images.unsplash.com/photo-XXXXXXX?w=1200&q=80
- Alt-тексты для всех изображений
- Semantic HTML: <header>, <main>, <section>, <footer>, <nav>
```

---

## ФИНАЛЬНАЯ ПРОВЕРКА ПЕРЕД СДАЧЕЙ

- [ ] Все 8 блоков присутствуют
- [ ] Цвета строго из брендинга (#FFDE73, #000000, #FFFFFF)
- [ ] Кнопки квадратные (border-radius: 0px)
- [ ] Заголовки крупные и контрастные
- [ ] Все фотографии подключены (реальные URL)
- [ ] Сайт открывается корректно на 1920px
- [ ] Анимации работают при скролле
- [ ] Marquee логотипов партнёров работает
- [ ] Трекинг-форма визуально оформлена
- [ ] Карта с маркерами отображается

---

*Этот файл — полная инструкция для Claude Code. Следуй ей строго, не упрощай блоки.*
