# SKILL.md — Freight Company Website
> Read this file completely before writing a single line of code.
> Build everything exactly as described. No deviations.

---

## What you are building

A complete multi-page company website for a freight & trucking business called **Transnatur INC**.

Philosophy: build it **not as a brochure, but as a sales funnel**. Every section leads the visitor toward one action — apply / contact us. Inspired by Revolut's approach: value-first, scroll-driven, conversion-focused.

---

## Tech stack

| Layer | Choice |
|---|---|
| Framework | Next.js 14 (App Router) |
| Styling | Tailwind CSS |
| Animations | Framer Motion |
| Icons | Lucide React |
| Forms | React Hook Form |
| Fonts | `Barlow Condensed` 700 (headings) + `DM Sans` 400/500 (body) via `next/font/google` |
| Theme | Dark industrial — no light mode |

Install commands:
```bash
npx create-next-app@latest transnatur --typescript --tailwind --app
cd transnatur
npm install framer-motion lucide-react react-hook-form
```

---

## Design system

Apply this everywhere. No other colors, no gradients except where noted.

### CSS variables — add to `globals.css`

```css
:root {
  --color-bg: #111111;
  --color-surface: #1F1F1F;
  --color-accent: #C79A1B;
  --color-accent-hover: #A87E14;
  --color-text-primary: #F2F2F2;
  --color-text-secondary: #A8A8A8;
  --color-border: #2A2A2A;
  --color-border-accent: #C79A1B;
}

body {
  background-color: var(--color-bg);
  color: var(--color-text-primary);
}
```

### Tailwind config extension — `tailwind.config.ts`

```ts
theme: {
  extend: {
    colors: {
      bg: '#111111',
      surface: '#1F1F1F',
      accent: '#C79A1B',
      'accent-hover': '#A87E14',
      'text-primary': '#F2F2F2',
      'text-secondary': '#A8A8A8',
      border: '#2A2A2A',
    },
    fontFamily: {
      display: ['Barlow Condensed', 'sans-serif'],
      body: ['DM Sans', 'sans-serif'],
    },
  },
}
```

### Buttons — two variants only

```
Primary:
  bg: #C79A1B  |  text: #111111  |  font-weight: 600
  hover: bg → #A87E14

Ghost:
  bg: transparent  |  border: 1.5px solid #C79A1B  |  text: #F2F2F2
  hover: bg → #C79A1B, text → #111111
```

### Cards

```
bg: #1F1F1F
border: 1px solid #2A2A2A
border-radius: 8px
hover: border → 1px solid #C79A1B + translateY(-4px)
transition: all 0.2s ease
```

### Visual texture rules

- Section labels: short `3px` mustard top-border line above each section title
- Subtle `radial-gradient` from `#1F1F1F` to `#111111` on hero background only
- No other gradients
- Primary icons: `#C79A1B` — secondary/decorative icons: `#A8A8A8`
- Card hover always: `translateY(-4px)` + mustard border

### Typography

- All headings: `font-family: Barlow Condensed, font-weight: 700`
- Body text: `font-family: DM Sans, font-weight: 400 or 500`
- Hero headline: 64–80px
- Section titles: 36–48px
- Card titles: 18–20px
- Body: 15–16px, line-height 1.7

---

## File structure

```
/app
  layout.tsx              ← root layout: Navbar + Footer + Analytics in <head>
  page.tsx                ← Home
  /about/page.tsx
  /services/page.tsx
  /contact/page.tsx
  /blog/page.tsx
  /privacy/page.tsx
  /terms/page.tsx

/components
  /layout
    Navbar.tsx
    Footer.tsx
  /sections
    Hero.tsx
    SocialProofBar.tsx
    FeatureCards.tsx
    TrustSection.tsx
    Testimonials.tsx
    FaqAccordion.tsx
    CtaBanner.tsx
  /ui
    Button.tsx
    Card.tsx
    Badge.tsx
    SectionLabel.tsx
```

---

## Pages — build in this order

### 1. layout.tsx (root)

Wraps every page. Contains:
- Google Analytics snippet in `<head>` (see Analytics section below)
- Global SEO base tags in `<head>`
- `<Navbar />` at top
- `{children}` in main
- `<Footer />` at bottom

### 2. Home page `/`

Build sections top to bottom:

**Navbar** (sticky)
- Left: logo — text "TRANSNATUR" in Barlow Condensed + "INC" in mustard
- Center: Home · About · Services · Blog · Contact
- Right: Ghost button "Log in" + Primary button "Get a quote"
- On scroll past 60px: add `backdrop-blur-md` + `border-b border-border`
- Mobile: hamburger → slide-in drawer

**Hero**
- Height: `100vh`
- Background: subtle radial gradient `#1F1F1F → #111111`
- Headline (Barlow Condensed, 72px): `"Built for the road. Trusted by shippers."`
- Subheadline (DM Sans, 18px): `"Transnatur INC delivers full truckload and partial freight across the US. CDL-A drivers wanted — join our modern Peterbilt fleet."`
- Two buttons: Primary `"Apply now"` + Ghost `"See our services"`
- Right side: large placeholder image or abstract geometric shape
- Scroll indicator at bottom: animated chevron-down
- Animation: headline words staggered fade-up on load (Framer Motion, delay 0.1s per word)

**Social proof bar**
- Background: `#1F1F1F`, thin top/bottom borders `#2A2A2A`
- 4 stats separated by vertical dividers:
  - `500+` Loads delivered monthly
  - `12 yrs` In operation
  - `4.9★` Driver satisfaction
  - `DOT` Licensed & insured
- Fade-in on scroll enter

**Feature cards — "What we offer"**
- Section label + title: `"Everything you need on the road"`
- 6 cards in a 3×2 grid (2 columns on tablet, 1 on mobile):
  1. Truck icon — Full Truckload — `"Door-to-door FTL across all 48 states. Dedicated lanes, competitive rates."`
  2. Package icon — Partial Load — `"LTL options for smaller shipments. Pay only for the space you use."`
  3. Zap icon — Express Delivery — `"Time-sensitive cargo handled with priority routing and real-time updates."`
  4. Map icon — Route Planning — `"Optimized routes with live traffic data. Fewer delays, lower fuel costs."`
  5. Radio icon — Real-time Tracking — `"GPS tracking on every truck. Know where your load is at all times."`
  6. Headphones icon — 24/7 Dispatch — `"Round-the-clock dispatch team. Someone always picks up the phone."`

**Trust section**
- Full-width, background `#1A1A1A`, padding `80px 0`
- Left (50%): large bold headline `"Built on trust. Backed by miles."` + short paragraph
- Right (50%): 4 bullet rows with checkmark icons in mustard:
  - DOT licensed and fully certified
  - GPS tracking on every load
  - No hidden fees — transparent invoicing
  - On-time delivery guarantee or we make it right

**Testimonials**
- Title: `"What our partners say"`
- 3 cards, each: initials circle (mustard bg, black text) + full name + company + quote
  1. `"R.K."` — Robert Kline, Kline Logistics — `"Transnatur has been our go-to carrier for 4 years. Never a missed deadline."`
  2. `"S.M."` — Sara Mitchell, MidWest Supply Co — `"The tracking system alone is worth it. We always know exactly where our freight is."`
  3. `"D.T."` — Dave Torres, Torres Cold Chain — `"Professional drivers, clean equipment, zero headaches. Highly recommend."`

**FAQ accordion**
- Title: `"Common questions"`
- 6 items, collapsed by default, AnimatePresence for open/close:
  1. What lanes do you cover? — `"We operate across all 48 contiguous states with primary corridors in the Midwest and Southeast."`
  2. Do you hire owner-operators? — `"Yes. We work with both company drivers and qualified owner-operators with their own authority."`
  3. What equipment do you run? — `"Our fleet consists of late-model Peterbilt 579s and 389s. All trucks are under 3 years old."`
  4. How do I get a freight quote? — `"Fill out our contact form or call dispatch directly. We respond within 2 business hours."`
  5. What is your on-time delivery rate? — `"We maintain a 98.6% on-time delivery rate across all routes, tracked monthly."`
  6. How do I apply as a CDL-A driver? — `"Click 'Apply now' at the top of this page or visit our Contact page and select 'Driver application'."`

**CTA banner**
- Full-width, background: `#C79A1B`
- Headline (Barlow Condensed, black): `"Ready to move with us?"`
- Subline (DM Sans, black 70% opacity): `"Whether you're shipping freight or looking for your next driving job — we're ready."`
- One button: dark filled `"Contact us today"` (black bg, white text, hover → surface)

---

### 3. About page `/about`

- **Page hero** (~380px): headline `"The company behind the cargo"` + 2-line description
- **Our story**: 2 paragraphs about founding in 2012, growing from 3 trucks to a full fleet, values of reliability. Left text, right image placeholder.
- **Mission & values**: 3 cards — Reliability · Safety · Transparency
- **Team**: 4 members with mustard initials circles
  - Alex Morgan — CEO & Founder
  - Jamie Chen — Head of Operations
  - Sam Rivera — Fleet Manager
  - Chris Park — Dispatch Lead
- **Stats row**: `12 yrs` in operation · `500+` monthly loads · `1M+` miles driven · `98.6%` on-time rate

---

### 4. Services page `/services`

- **Page hero**: `"What we offer"` + short subline
- **Services grid**: 6 larger cards (same services as homepage) with icon + name + 3–4 line description + `"Learn more →"` link in mustard
- **How it works**: 4 steps connected by a dashed mustard line:
  1. Request a quote — fill the form or call dispatch
  2. We confirm your lane and rate within 2 hours
  3. Driver picks up — you get live tracking link
  4. Delivery confirmed — invoice sent, done
- **CTA banner**: same component as homepage

---

### 5. Contact page `/contact`

2-column layout on desktop, stacked on mobile.

**Left column**
- Headline: `"Let's talk freight"`
- Subline: `"Whether you need a quote, want to join our team, or just have a question — reach out."`
- Address: 842 Industrial Pkwy, Joliet, IL 60431
- Phone: +1 (815) 555-0174
- Email: dispatch@transnatur.com
- Hours: Mon–Fri 6am–10pm · Sat 8am–4pm · 24/7 emergency dispatch
- Social icons: LinkedIn · Facebook · Instagram (Lucide icons, mustard color)

**Right column — form (React Hook Form)**
Fields:
- Full name (required)
- Email address (required, validated)
- Phone number
- Subject: dropdown — `Freight quote / Driver application / General inquiry / Other`
- Message (textarea, min 20 chars)
- Submit button: Primary `"Send message"`

Validation: inline red error messages below each field.
Success state: replace form with a card — checkmark icon + `"Message received!"` + `"We'll get back to you within 2 business hours."`

---

### 6. Blog page `/blog`

- Headline: `"Freight industry insights"`
- Featured post (large card, full width):
  - Category badge: `"Industry"`
  - Title: `"How fuel surcharges actually work — and what shippers can do about it"`
  - Excerpt: 2 sentences
  - Date + `"Read more →"`
- Grid of 5 post cards:
  1. News — `"DOT issues new ELD compliance update for 2025"`
  2. Guides — `"FTL vs LTL: which is right for your shipment?"`
  3. Industry — `"Driver shortage trends and what carriers are doing about it"`
  4. Guides — `"How to read a bill of lading (BOL) — a shipper's guide"`
  5. News — `"Transnatur INC expands Southeast corridor service"`
- Category filter: All · News · Guides · Industry

---

### 7. Privacy policy `/privacy`

- Title: `"Privacy Policy"`
- Last updated: January 2025
- Table of contents with anchor links: Information We Collect · How We Use It · Cookies · Third Parties · Your Rights · Contact
- Standard realistic placeholder legal text under each heading

---

### 8. Terms of service `/terms`

- Title: `"Terms of Service"`
- Last updated: January 2025
- Table of contents with anchor links: Acceptance · Services · Payment Terms · Liability · Disputes · Governing Law
- Standard realistic placeholder legal text under each heading

---

## Shared components

### Navbar
- Sticky (`position: sticky; top: 0; z-index: 50`)
- Initial: fully transparent
- After 60px scroll: `background: rgba(17,17,17,0.85)` + `backdrop-filter: blur(12px)` + `border-bottom: 1px solid #2A2A2A`
- Active route: mustard underline on nav link
- Mobile (<768px): hamburger icon → full-screen slide-in drawer with all links + both buttons

### Footer
4-column grid:

| Column 1 | Column 2 | Column 3 | Column 4 |
|---|---|---|---|
| Logo + tagline | Navigation | Services | Legal |
| `"Moving cargo. Building trust."` | Home, About, Services, Blog, Contact | FTL, LTL, Express, Tracking, Dispatch | Privacy Policy, Terms of Service |

Bottom bar: `© 2025 Transnatur INC. All rights reserved.` + social icons right-aligned.
Background: `#0D0D0D` (slightly darker than page bg).

### Button component (`Button.tsx`)
Props: `variant: 'primary' | 'ghost'`, `size: 'sm' | 'md' | 'lg'`, `children`, `onClick`, `type`

### SectionLabel component
Renders a short mustard `3px` top-bar + label text above section titles.
Usage: `<SectionLabel>What we offer</SectionLabel>`

---

## Animations

Apply after all content is built.

```ts
// Standard fadeInUp — use on every section
const fadeInUp = {
  hidden: { opacity: 0, y: 24 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.5, ease: 'easeOut' } }
}

// Stagger children (hero headline, card grids)
const stagger = {
  visible: { transition: { staggerChildren: 0.08 } }
}
```

Rules:
- All `<section>` elements: `<motion.section whileInView="visible" initial="hidden" viewport={{ once: true }}>`
- Cards: `whileHover={{ y: -4 }}`
- Hero headline: words split into spans, staggered on load
- Page transitions: `opacity: 0 → 1` on route change
- FAQ: `AnimatePresence` + `height: 0 → auto` on open/close
- Always add: `@media (prefers-reduced-motion: reduce)` — disable all transforms and transitions

---

## SEO — add to every page

### Metadata (Next.js App Router format)

```tsx
export const metadata: Metadata = {
  title: 'Page Title | Transnatur INC',
  description: '...',
  openGraph: {
    title: '...',
    description: '...',
    siteName: 'Transnatur INC',
  },
}
```

### Meta tags to include on every page

```html
<meta name="description" content="Drive with Transnatur INC. CDL-A drivers wanted. Competitive pay, modern fleet, home time. Apply now!">
<meta name="keywords" content="CDL-A driver jobs, truck driver hiring, Transnatur INC, flatbed driver, Illinois trucking">
<meta property="og:title" content="Drive With Transnatur INC — Apply Now">
<meta property="og:description" content="Join our team. Competitive pay, modern Peterbilt fleet, great home time.">
```

---

## Analytics — add to `<head>` in `layout.tsx`

```html
<!-- Google Analytics — replace GA_MEASUREMENT_ID with real ID before going live -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

Use Next.js `<Script>` component with `strategy="afterInteractive"` for the gtag config script.

---

## Performance requirements

- All images: `next/image` with `width`, `height`, `alt` — no raw `<img>` tags
- Fonts: `next/font/google` only — no external `<link>` font imports
- Sections below the fold: `viewport={{ once: true }}` on Framer Motion (no re-animation on scroll up)
- Lighthouse targets: Performance > 90 · Accessibility > 95

---

## Responsive breakpoints

| Breakpoint | Width | Key behavior |
|---|---|---|
| default (mobile) | <640px | Single column, reduced font sizes, hamburger nav |
| `sm` | 640px | 2-column cards |
| `md` | 768px | Full nav visible, 2-column layouts |
| `lg` | 1024px | 3-column cards, full desktop layout |
| `xl` | 1280px | `max-w-7xl mx-auto` content container |

---

## Build order — follow exactly

1. Initialize Next.js 14 + install all dependencies
2. Set up `globals.css` with CSS variables + `tailwind.config.ts`
3. Set up fonts in `layout.tsx` via `next/font/google`
4. Add Analytics snippet to `layout.tsx` `<head>`
5. Build `Navbar.tsx` and `Footer.tsx`
6. Build UI components: `Button.tsx`, `Card.tsx`, `SectionLabel.tsx`
7. Build Home page — section by section, top to bottom
8. Build About → Services → Contact → Blog → Privacy → Terms
9. Add all Framer Motion animations
10. Add metadata to every page
11. Test responsive layout at all breakpoints
12. Verify no raw colors — everything must use CSS variables or Tailwind tokens

---

## Content rules

- Company name: **Transnatur INC**
- Tagline: **"Moving cargo. Building trust."**
- All text: realistic freight/trucking industry language — NOT Lorem Ipsum
- All images: `https://placehold.co/WIDTHxHEIGHT/1F1F1F/C79A1B` (dark surface + mustard text)
- Team: Alex Morgan · Jamie Chen · Sam Rivera · Chris Park
