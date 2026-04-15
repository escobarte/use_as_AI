[3/31/2026 1:52 PM] Женушка: Q- Who is this for?
A- For professionals and business owners who want to grow on LinkedIn and get real opportunities.

Q- What results can I expect?
A- More profile visibility, relevant connections, and leads—usually within 4–8 weeks.

Q- I've tried LinkedIn™ before. Why is this different?
A- Our data-driven strategy targets the right audience and ensures every action counts.

Q-Do I need to be active every day?
A-No. A few smart, consistent actions per week are enough.

Q- What’s in the Strategic Audit?
A- Profile review, content strategy, audience targeting, and a clear action plan.

Q- Do you work with teams or individuals?
A- Both. Solutions adapt to solo professionals or teams.
[3/31/2026 1:53 PM] Женушка: Структура FAQ компонента (под твой лендинг)
1. Общая секция (Section)

FAQ Section

Title: Questions we hear often
Subtitle: короткое пояснение
Список вопросов
CTA кнопка (у тебя уже есть)

👉 В Auto Layout:

Direction: Vertical
Spacing: 40–64px между блоками
2. Компонент: FAQ / Item

Это главный элемент UI-kit.

📦 Структура внутри:

Container (Auto Layout — Vertical)

Header (всегда виден)
Question (текст)
Icon (+ / −)
Answer (скрытый блок)
Текст ответа
3. Детали по элементам
🔸 Header (вопрос)
Auto Layout: Horizontal
Justify: Space between
Padding: 20–24px
Кликабельна ВСЯ область (не только текст)

Содержимое:

Question text (16–18px, medium)
Icon (16–20px)
🔸 Answer (ответ)
Размер: 14–16px
Line height: 140–160%
Цвет: чуть мягче, чем вопрос (например opacity 70–80%)

Отступы:

Padding: 0 24px 20–24px
4. Variants (самое важное)

Сделай компонент с вариантами:

🟢 Variant 1 — Closed
Answer: hidden (или height = 0)
Icon: +
Border / divider снизу (тонкий, нейтральный)
🔵 Variant 2 — Open
Answer: виден
Icon: −
Можно:
чуть усилить цвет вопроса
или добавить лёгкий background (очень subtle)
🟡 Variant 3 — Hover (опционально)
лёгкое изменение:
текст ярче
или фон #FFFFFF → #FAFAFA

👉 Без перегруза — у тебя стиль минимал

5. FAQ / List (группа)

Собираешь список:

FAQ Item
FAQ Item
FAQ Item

Spacing:

либо 0 (если есть divider)
либо 8–12px между карточками
6. Визуальный стиль (под «дорогой минимализм»)

Чтобы выглядело премиально:

✔️ Линии вместо карточек
Тонкий divider (1px, low opacity)
Без тяжёлых рамок
✔️ Много воздуха
Не жми текст
Лучше больше vertical spacing
✔️ Иконка
Очень простая:
/ −
или тонкий chevron
✔️ Анимация (если будешь описывать dev’у)
плавное раскрытие 200–300ms
ease-in-out
7. Как это назвать в UI-kit

Чёткая система:

FAQ / Item
State: Closed
State: Open
State: Hover
FAQ / List
8. Маленький UX-апгрейд (совет)

Сделай:

по умолчанию открыт 1 вопрос
👉 это снижает пустоту и сразу даёт ценность