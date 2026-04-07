# Company Website — Technical Specification
**Transnatur INC** — Freight & Trucking
> Inspired by Revolut's approach: value-first, scroll-driven, conversion-focused.
> Stack: Next.js 14 (App Router) + Tailwind CSS + Framer Motion

---

## Project Philosophy

Build the site **not as a brochure, but as a sales funnel**.
Every section must lead the visitor toward one action: **contact us / get started**.

- Show value first, details second
- Lots of whitespace, large blocks, zero noise
- Cards and scroll help users scan quickly
- Animations and hover effects are part of the experience
- Strong section hierarchy — each block sells the next

---

## Tech Stack

| Layer | Choice |
|---|---|
| Framework | Next.js 14 (App Router) |
| Styling | Tailwind CSS |
| Animations | Framer Motion |
| Icons | Lucide React |
| Forms | React Hook Form |
| Fonts | `Barlow Condensed` (700) for headings + `DM Sans` (400/500) for body — via `next/font/google` |
| Theme | **Dark industrial** — `#111111` background, `#C79A1B` mustard accent, no light mode |

---

## Color & Design System

**Direction: Dark Industrial — built for freight & trucking.**
Heavy, trustworthy, built to last. The mustard accent signals movement, urgency, and precision — like road markings on asphalt.

### Palette

| Token | Hex | Usage |
|---|---|---|
| `--color-bg` | `#111111` | Main page background |
| `--color-surface` | `#1F1F1F` | Cards, sections, panels |
| `--color-accent` | `#C79A1B` | Primary accent — buttons, highlights, borders, icons |
| `--color-accent-hover` | `#A87E14` | Accent on hover (darkened ~15%) |
| `--color-text-primary` | `#F2F2F2` | Headings, body text on dark |
| `--color-text-secondary` | `#A8A8A8` | Subtitles, captions, placeholders |
| `--color-border` | `#2A2A2A` | Card borders, dividers |
| `--color-border-accent` | `#C79A1B` | Accent borders (ghost buttons, card hover) |

### CSS Variables Setup

Add to `globals.css`:

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
```

### Button Variants

Two button styles only — no other variants:

```
Primary button:
  background: #C79A1B
  color: #111111 (black text on mustard)
  font-weight: 600
  hover: background → #A87E14

Ghost button:
  background: transparent
  border: 1.5px solid #C79A1B
  color: #F2F2F2
  hover: background → #C79A1B, color → #111111
```

### Typography

Font pairing that matches the industrial-premium feel:
- **Display / Headings**: `Barlow Condensed` (700) — bold, road-sign energy
- **Body**: `DM Sans` (400, 500) — clean, readable, modern

```tsx
// next/font setup
import { Barlow_Condensed, DM_Sans } from 'next/font/google'

const display = Barlow_Condensed({ subsets: ['latin'], weight: ['700'] })
const body = DM_Sans({ subsets: ['latin'], weight: ['400', '500'] })
```

### Visual Texture Rules

- Card borders: `1px solid #2A2A2A`, on hover switch to `1px solid #C79A1B`
- Subtle noise or grain overlay on hero background (CSS or SVG filter) — adds industrial depth
- Accent underlines on section labels: a short `3px` mustard line above section titles
- No gradients except: a very subtle `radial-gradient` from `#1F1F1F` to `#111111` on hero
- Icon color: `#C79A1B` for primary icons, `#A8A8A8` for decorative/secondary

### Tailwind Config Extension

```js
// tailwind.config.ts
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
    }
  }
}
```

---

## File Structure

```
/app
  /page.tsx              ← Home (Landing)
  /about/page.tsx
  /services/page.tsx
  /contact/page.tsx
  /blog/page.tsx
  /privacy/page.tsx
  /terms/page.tsx
  /layout.tsx            ← Shared layout with Navbar + Footer

/components
  /layout
    Navbar.tsx
    Footer.tsx
  /sections
    Hero.tsx
    FeatureCards.tsx
    TrustSection.tsx
    Testimonials.tsx
    FAQ.tsx
    CTABanner.tsx
  /ui
    Button.tsx
    Card.tsx
    Badge.tsx
    AnimatedText.tsx
```

---

## Page Breakdown

---

### 1. HOME PAGE `/`

The homepage is the full narrative. It must tell a complete story top-to-bottom.

#### 1.1 Navbar (sticky)
- Left: Logo (text or SVG placeholder)
- Center: Navigation links — Home, About, Services, Blog, Contact
- Right: Two buttons — `Log in` (ghost/outline) + `Get started` (primary, filled)
- On scroll: navbar gets a subtle background blur + border-bottom
- Mobile: hamburger menu with slide-in drawer

#### 1.2 Hero Section
**Goal**: Immediate value statement. No confusion about what this company does.

- Full viewport height (`100vh`)
- Large headline (60–80px): bold, multi-line, punchy
  - Example placeholder: *"Your business, handled."* or *"We do [service]. You grow."*
- Subheadline (18–20px): one sentence explaining who this is for
- Two CTA buttons: `Get started` (primary) + `See our services` (secondary/ghost)
- Visual: abstract geometric shapes, gradient blobs, or a strong placeholder image on the right. No stock photo of a handshake.
- Scroll indicator at the bottom (animated arrow or "scroll" text)
- **Animations**: headline words appear with staggered fade-up on load (Framer Motion)

#### 1.3 Social Proof Bar
Thin horizontal strip below hero:
- 3–4 stats or trust markers, e.g.:
  - `500+ clients served`
  - `12 years on the market`
  - `4.9★ average rating`
  - `Licensed & insured`
- Separated by vertical dividers, centered, muted style
- Subtle fade-in animation on scroll

#### 1.4 Feature Cards — "What we do"
- Section title: `Everything you need. Nothing you don't.`
- Grid of 4–6 cards (2 columns on desktop, 1 on mobile)
- Each card: icon (Lucide) + short title + 1–2 sentence description
- Cards should have hover effect: slight lift (`translateY(-4px)`) + border glow
- Example services to use as placeholder:
  - Fast delivery
  - Expert consultation
  - 24/7 support
  - Transparent pricing
  - Custom solutions
  - Proven results

#### 1.5 "Why Us" — Trust & Credibility Section
Revolut-style: full-width dark (or light-inverted) section.

- Left side: big bold statement — *"Built on trust. Proven by results."*
- Right side: 3–4 bullet points with icons:
  - Licensed and certified
  - Data privacy guaranteed
  - No hidden fees
  - Money-back guarantee
- Optional: a subtle background pattern or gradient mesh
- **This is the trust anchor** — make it feel solid and serious

#### 1.6 Testimonials
- Section title: `What our clients say`
- 3 cards in a row (or horizontal scroll on mobile)
- Each card: avatar placeholder (initials circle) + name + role/company + quote
- Clean card design, no excessive decoration

#### 1.7 FAQ Section (Accordion)
- Section title: `Common questions`
- 5–6 Q&A items, collapsed by default
- Smooth expand/collapse animation (Framer Motion `AnimatePresence`)
- Example questions:
  1. How do I get started?
  2. What does the service include?
  3. How long does it take?
  4. Do you offer custom packages?
  5. What if I'm not satisfied?

#### 1.8 CTA Banner (Bottom of page)
- Full-width section, strong accent background color
- Big headline: *"Ready to get started?"*
- One button: `Contact us today`
- Simple, clean, direct. This is the last conversion moment before footer.

---

### 2. ABOUT PAGE `/about`

Tell the human story behind the company. Build trust.

**Sections:**
1. **Page Hero** — short headline + 2-line description. No full-screen, just ~400px tall.
2. **Our story** — 2–3 paragraphs of company history (placeholder text). Left text, right visual/image placeholder.
3. **Mission & Values** — 3 value cards with icon + title + short description
4. **Team section** — 3–4 team member cards: avatar placeholder (colored circle with initials) + name + title
5. **Achievements** — a simple row of stats: years in business, clients, projects, certifications

---

### 3. SERVICES PAGE `/services`

The product showcase. Each service must feel valuable.

**Sections:**
1. **Page Hero** — headline: *"What we offer"*, short subline
2. **Services grid** — 4–6 service cards, larger than homepage cards:
   - Icon + Name + Description (3–4 lines) + `Learn more` link
   - On hover: card expands slightly, accent border appears
3. **Pricing section** (optional) — 3 pricing tiers: Basic / Professional / Enterprise
   - Each tier: name + price + feature list + CTA button
   - Middle tier highlighted as "Most popular"
4. **Process section** — *"How it works"*
   - 3–4 numbered steps in a horizontal row
   - Step: number + title + short description
   - Connected by a dashed line between steps
5. **CTA banner** — same as homepage bottom CTA

---

### 4. CONTACT PAGE `/contact`

Make it easy and trustworthy to reach out.

**Layout:** 2-column on desktop, stacked on mobile.

**Left column:**
- Headline: *"Let's talk"*
- 2–3 lines of friendly copy
- Contact details:
  - Email (placeholder)
  - Phone (placeholder)
  - Address (placeholder)
  - Working hours: Mon–Fri, 9am–6pm
- Social media links (icons)

**Right column:**
- Contact form with fields:
  - Full name (required)
  - Email address (required)
  - Phone number
  - Subject (dropdown: General inquiry / Quote request / Support / Other)
  - Message (textarea)
  - Submit button: `Send message`
- Form validation: show inline errors
- Success state: replace form with a thank-you message after submit

---

### 5. BLOG PAGE `/blog`

Placeholder content only. Structure for future use.

**Sections:**
1. Page headline: *"Insights & updates"*
2. Featured post (large card, top of page): image placeholder + category badge + title + excerpt + `Read more`
3. Grid of 4–6 post cards: image + category + title + date + `Read more`
4. Category filter buttons at the top (All / News / Guides / Updates)

---

### 6. PRIVACY POLICY `/privacy` + TERMS `/terms`

Simple legal pages.
- Clean layout: no sections, just `<article>` with headings + paragraphs
- Standard placeholder legal text
- Sidebar or top: table of contents (anchor links)
- Date: *Last updated: January 2025*

---

## Shared Components

### Navbar
- Sticky on scroll
- Transparent initially → background blur after 60px scroll
- Active link highlighted
- Mobile: hamburger → full-screen drawer with links

### Footer
- 4 columns: Logo/tagline | Navigation | Services | Legal
- Bottom bar: copyright text + social icons
- Color: dark background regardless of page theme

### Button Component
Two variants:
- `primary`: filled with accent color, hover darkens slightly
- `ghost`: transparent with border, hover fills

### Animations (global rules)
- All sections: `fadeInUp` on scroll enter (Framer Motion `whileInView`)
- Cards: `hover: { y: -4, boxShadow: ... }`
- Page transitions: fade between routes
- No animations on mobile if `prefers-reduced-motion` is set

---

## SEO Requirements

Every page must have:
```tsx
export const metadata: Metadata = {
  title: 'Page Title | Company Name',
  description: 'Page-specific description, 150–160 chars',
}
```

Also add:
- `<link rel="canonical">` on each page
- Open Graph tags (`og:title`, `og:description`, `og:image` placeholder)
- `robots.txt` and `sitemap.xml` (Next.js auto-generation)

---

## Responsive Breakpoints (Tailwind)

| Breakpoint | Width | Behavior |
|---|---|---|
| `sm` | 640px | Cards stack, font sizes reduce |
| `md` | 768px | 2-column layouts switch to 1 |
| `lg` | 1024px | Full desktop layout |
| `xl` | 1280px | Max content width: `max-w-7xl mx-auto` |

---

## Performance Requirements

- Images: use `next/image` with `width`, `height`, `alt` on all images
- Lazy loading: all sections below fold use `loading="lazy"` or scroll-triggered
- Fonts: use `next/font` for zero layout shift
- Lighthouse target: Performance > 90, Accessibility > 95

---

## Placeholder Content

- Company name: **Transnatur INC**
- Tagline: **"Moving cargo. Building trust."**
- Industry: freight & trucking — all text must use realistic industry language, NOT Lorem Ipsum
- All images: `https://placehold.co/WIDTHxHEIGHT/1F1F1F/C79A1B`
- Team: Alex Morgan (CEO & Founder) · Jamie Chen (Head of Operations) · Sam Rivera (Fleet Manager) · Chris Park (Dispatch Lead)

---

## Start Instructions for Claude Code

> The `/web` directory is already initialized with Next.js 14, Tailwind, and all dependencies per README.md setup steps.

1. Read `SKILL.md` — it is the single source of truth for build instructions
2. `website-spec.md` (this file) — design rationale and architecture reference
3. Build everything into the `/web` directory
4. Follow the build order in `SKILL.md` exactly
