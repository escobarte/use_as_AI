# Drive Your Business — Website SKILL.md

## Company
**Drive Your Business** — маркетинговое агентство для малых trucking-компаний в США.
Помогает флотам с 5–50 грузовиками привлекать водителей, улучшать онлайн-присутствие и превращать внимание в реальные заявки.

---

## Site Structure

The project has 3 pages:

### Page 1: Main Landing Page (`index.html`)

Sections in order:

1. **Hero Section** — Full-width dark background with subtle truck silhouette, headline, subheadline, two CTA buttons → link to form page. Strip of 5 thumbnail cards at the bottom (icon + label: "5–50 Trucks", "Social Media", "Landing Pages", "Driver Leads", "Fast Start").
2. **Problem Section** — Two-column layout: left side has headline + bullet list with ✕ icons; right side has a decorative visual card.
3. **Services Section** — 3 cards in a grid (Driver Recruitment $600/mo, Full Social Media $1,200/mo, Websites $500–800). Each card: icon, title, price in gold, description, bullet list, result line. CTA button below grid.
4. **How It Works** — Vertical timeline with 4 steps (numbered 01–04), connected by a gold vertical line.
5. **Why Us** — Two-column: left has headline + 5 icon cards; right has decorative stats block ("100% Trucking Focus", "24h Response").
6. **FAQ** — Accordion with 4 questions. Click to expand/collapse.
7. **Final CTA Section** — Centered, dark gradient background with grid texture overlay, big headline, two buttons.
8. **Footer** — Logo, tagline, two link columns (Services, Company). Bottom bar with copyright.

---

### Page 2: Contact / Lid Form Page (`form.html`)

Sections in order:

1. **Header** — Logo + "Back to Home" link. Minimal, clean.
2. **Split Layout** — Two columns:
   - **Left (Info side):** Eyebrow label, large headline, short description, 4 trust perk items (icon + text).
   - **Right (Form side):** Form card with heading, subtext, fields, submit button.
3. **Form Fields:**
   - First Name * (required)
   - Last Name * (required)
   - Phone Number * (required)
   - Email * (required)
   - Company Name
   - What do you need help with? (textarea)
   - Submit Button → "SEND REQUEST →" (red, full-width)
4. **On submit:** Validate required fields → redirect to `thankyou.html`
5. **Footer** — Single line copyright.

---

### Page 3: Thank You Page (`thankyou.html`)

- Logo text
- Animated gold checkmark circle (CSS animation: pop scale)
- Large headline: "Thank You!"
- Subtext: "We will contact you within 24 hours."
- CTA: "← Back to Home" (red button)

---

## Design Rules

### Visual Style
Inspired by dark cinematic travel landing pages (see reference screenshot). Dark, premium, trustworthy.

- **Overall feel:** Dark cinematic. Like a premium travel or automotive brand — not a typical trucking company.
- **Backgrounds:** Deep navy (`#0a0f1e`, `#111827`). Never white or light backgrounds.
- **Accent color:** Gold (`#c8a84b`) — used for eyebrow labels, dividers, prices, borders, timeline dots.
- **Action color:** Red (`#C62828`) — used ONLY for CTA buttons.
- **Text:** Off-white (`#f5f0e8`). Body text at 70% opacity for secondary content.
- **Texture:** Subtle grid overlay (`opacity: 0.04`) with gold grid lines on hero and CTA sections.

### Typography
- **Display / Headings:** `Bebas Neue` — large, bold, cinematic. Used for H1, H2, step numbers, prices, button labels.
- **Body / Labels:** `Barlow` (weight 300, 400, 600, 700) — clean, readable.
- **Condensed labels:** `Barlow Condensed` — used for eyebrow labels, nav links, form labels. Letter-spacing 2–3px, uppercase.
- Import from Google Fonts: `Bebas Neue`, `Barlow`, `Barlow Condensed`.
- **Never use:** Inter, Roboto, Arial, system fonts.

### Layout
- Mobile-first. All sections fully responsive.
- Max content width: `1200px`, centered with `margin: 0 auto`.
- Section padding: `90px 5%`.
- Use CSS Grid for multi-column layouts. Switch to single column on mobile (`max-width: 800px`).

### Navbar
- Fixed, `height: 64px`.
- Background: `rgba(10,15,30,0.85)` + `backdrop-filter: blur(12px)`.
- Bottom border: `1px solid rgba(200,168,75,0.15)`.
- Left: Logo (truck emoji + "Drive Your Business" in Bebas Neue).
- Center: Nav links (Services, How It Works, FAQ) — hidden on mobile.
- Right: Red "BOOK A FREE CALL" button.

### Hero Section
- Full viewport height (`100vh`), minimum `600px`.
- Background: Deep navy gradient (`#0a1628` → `#1a2a4a` → `#0d1520`).
- Decorative truck silhouette (CSS clip-path shape, low opacity `0.18`, gold tint).
- Overlay gradient: left side opaque navy, right side transparent.
- Grid texture overlay.
- Content pinned to bottom-left, max-width `750px`.
- Eyebrow: gold label with line before it.
- H1: Bebas Neue, `clamp(60px, 10vw, 120px)`, multi-line. One word in gold color.
- Subheadline: 18px, weight 300, 75% opacity, max-width 480px.
- Two buttons side by side: Primary (red, filled) + Secondary (transparent with border).
- Small note text below buttons: 12px, 40% opacity.
- Thumbnail strip at bottom: horizontal scroll row of 5 cards (120×80px each, gold border, icon + label).

### Buttons
- **Primary / CTA:** `background: #C62828`, white text, `border-radius: 8px`, `padding: 15px 36px`, Bebas Neue font, uppercase, letter-spacing 2px. Hover: darker red + `translateY(-2px)`.
- **Secondary / Outline:** Transparent background, `border: 1px solid rgba(245,240,232,0.35)`, white text. Hover: gold border + gold text.
- **Submit button (form):** Full-width, `padding: 18px`, Bebas Neue, 22px, letter-spacing 3px.
- **Never** use purple, blue, or green buttons.

### Cards (Services)
- `border: 1px solid rgba(200,168,75,0.15)`, `border-radius: 16px`.
- Background: `rgba(255,255,255,0.02)`.
- Top gold accent bar (3px height, gradient left-to-right) — appears on hover.
- Hover: `border-color` brightens, card lifts `translateY(-4px)`.
- Price in gold (`#c8a84b`), Barlow Condensed, 22px, bold.
- Result line at bottom, separated by a gold divider line.

### Section Eyebrow Labels
- Pattern: `[gold line] UPPERCASE TEXT`
- Font: Barlow Condensed, 12px, letter-spacing 3px, uppercase, color gold.
- `::before` pseudo-element: 32px gold line.
- Always placed above the H2 title.

### Dividers
- Between sections: `<div class="divider">` — `width: 100%`, `height: 1px`, `background: rgba(200,168,75,0.15)`.

### How It Works Timeline
- Vertical line on left side: `left: 28px`, gold gradient top to bottom.
- Step number circles: 56×56px, round border in gold, Bebas Neue, gold text. White fill background so the line appears behind.
- Each step: flex row, gap 32px.

### FAQ Accordion
- Items separated by gold divider lines.
- Question row: flex space-between. Gold "+" icon on right.
- On `.open` class: answer expands (`max-height` transition), "+" rotates 45° to "×".
- Toggle via `onclick="this.classList.toggle('open')"`.

### Form Inputs
- Background: `rgba(255,255,255,0.04)`.
- Border: `1px solid rgba(200,168,75,0.2)`. Focus: gold border.
- Text color: off-white. Placeholder: dimmed.
- `border-radius: 8px`, padding `14px 16px`.
- Select dropdowns: `appearance: none`, options styled dark.

### Animations
- Hero content: `fadeUp` animation (opacity 0→1, translateY 30px→0, 0.9s).
- Thank You checkmark: `pop` animation (scale 0.5→1, opacity 0→1, 0.5s, 0.3s delay).
- All card hovers: smooth `transition: 0.2s–0.3s`.

---

## Copy (Content)

### Company Name
Drive Your Business

### Tagline
More Driver Applications for Small Trucking Companies

### Hero
- **Headline:** MORE / DRIVER / APPLICATIONS (3 lines, second word in gold)
- **Subheadline:** We help fleets with 5–50 trucks attract drivers, improve their online presence, and turn attention into real inquiries.
- **Buttons:** Book a Free Call | Get a Free Audit
- **Note:** Built specifically for small trucking companies. No fluff. Just results.

### Problem Section
- **Eyebrow:** The Problem
- **Title:** Hiring Drivers Shouldn't Be This Hard
- **Bullets (with ✕ icons):**
  - You're not getting enough driver applications
  - Your social media looks inactive or unprofessional
  - Your company doesn't build trust online
  - You don't have a clear system to attract and convert drivers
- **Closing:** Most small fleets don't need more effort. They need a better system.

### Services

| Service | Price | Result |
|---|---|---|
| Driver Recruitment System | $600/month | More driver inquiries every month |
| Full Social Media Management | $1,200/month | Stronger online presence and trust |
| Websites & Landing Pages | $500–$800 | More calls, messages, and applications |

Each service includes 4 bullet points (see CompanyDetails.md for full copy).

### How It Works (4 steps)
1. We Understand Your Company
2. We Build Your System
3. We Launch and Optimize
4. You Get Results

### Why Us (5 cards)
- 🚛 We only work with trucking companies
- 🎯 We understand driver hiring deeply
- ⚡ We keep things simple and practical
- 📊 Focused on results, not vanity metrics
- 🤝 No overcomplicated strategies or corporate nonsense

### FAQ
- Who is this for? → Small trucking companies in the USA, 5–50 trucks.
- How fast can we start? → Usually within a few days after the initial call.
- Do you run ads? → Yes, if needed for driver recruitment.
- Do I need a website? → Not required, but it helps improve results.

### Final CTA
- **Title:** Let's Get You More Driver Applications
- **Text:** If you're tired of struggling to find drivers or having no online presence — let's fix it.
- **Buttons:** Book a Free Call | Send a Message

### Form Page
- **Left side title:** Let's Talk About Your Company
- **Left perks:** ⚡ Response within 24 hours | 🎯 Free audit | 🚛 Trucking only | 💬 No pressure
- **Form title:** Book a Free Call
- **Submit button text:** SEND REQUEST →

### Thank You Page
- Headline: Thank You!
- Text: We will contact you within 24 hours.
- Button: ← Back to Home

### Footer
- Logo: 🚛 Drive Your Business
- Tagline: Built specifically for small trucking companies. We help fleets with 5–50 trucks grow.
- Links: Services (Driver Recruitment, Social Media, Websites) | Company (How It Works, Why Us, FAQ, Contact)
- Copyright: © 2025 Drive Your Business. All rights reserved.

---

## File Structure

```
/
├── index.html       ← Main landing page
├── form.html        ← Contact / lead form page
└── thankyou.html    ← Thank you confirmation page
```

All pages link to each other:
- All CTA buttons → `form.html`
- Form submit → `thankyou.html`
- "Back to Home" → `index.html`
- Logo always links to `index.html`

---

## Google Sheets Integration (Optional)

On form submit, send data via `fetch()` to a Google Apps Script web app URL:

```javascript
fetch('YOUR_APPS_SCRIPT_URL', {
  method: 'POST',
  body: JSON.stringify({
    firstName, lastName, phone, email, company, message
  })
});
```

Then redirect to `thankyou.html`.
