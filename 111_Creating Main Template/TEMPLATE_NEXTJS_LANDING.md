# ============================================================
# LANDING PAGE TEMPLATE — Next.js 14 (App Router) Full Stack
# ============================================================
# WHEN TO USE THIS:
#   Professional landing pages that may grow into full sites.
#   When you need SSR, SEO control, TypeScript, or plan to
#   add more pages/features later. Requires Vercel or Node hosting.
#
# TECH STACK (from CLAUDE(tech stack).md):
#   Next.js 14 (App Router) · TypeScript · Tailwind CSS
#   Framer Motion · shadcn/ui · Lucide React
#   React Hook Form · Zod · CLSX + Tailwind Merge
#   ESLint + Prettier · next/font/google
#
# HOW TO USE:
#   1. Fill in SECTION 1 (Project Config) — changes every project
#   2. Adjust SECTION 2 (Design System) colors/fonts
#   3. Check SECTION 3 (Pages) — remove sections you don't need
#   4. Configure SECTION 4 (Form)
#   5. Run SECTION 8 install commands
#   6. Grab the prompt from SECTION 9 and paste to Claude Code
# ============================================================

---

## SECTION 1 — PROJECT CONFIG
# ✏️ CHANGE EVERYTHING IN THIS SECTION FOR EACH NEW PROJECT

### 1.1 Company Info
```
Company Name:   [COMPANY NAME]
Tagline:        [SHORT TAGLINE — 5-8 words, e.g. "Moving cargo. Building trust."]
Address:        [FULL ADDRESS]
Phone:          [PHONE NUMBER]
Email:          [EMAIL ADDRESS]
Website:        [DOMAIN — e.g. transnatur.com]
Legal IDs:      [MC# / USDOT# / Business license / leave blank if not applicable]
```

### 1.2 Niche & Goal
```
Industry:       [e.g. Trucking / Real Estate / SaaS / Fitness / Legal]
Target user:    [Who is this page for? e.g. CDL-A truck drivers / homeowners / founders]
Primary action: [What should visitor do? e.g. Apply / Book a call / Buy / Sign up]
Urgency hook:   [Optional — e.g. "Hiring now" / "Limited spots" / leave blank]
```

### 1.3 Branding Colors
# Fill in all rows. Claude Code will add these as Tailwind tokens + CSS variables.
| Role           | Color Name   | Hex       | Usage                              |
|----------------|--------------|-----------|------------------------------------|
| Primary / BG   | [Name]       | [#XXXXXX] | Page bg, Navbar (on dark themes)   |
| Surface        | [Name]       | [#XXXXXX] | Cards, panels, elevated sections   |
| Accent         | [Name]       | [#XXXXXX] | Buttons, highlights, borders       |
| Accent Hover   | [Name]       | [#XXXXXX] | Button hover state (darken ~15%)   |
| Text Primary   | [Name]       | [#XXXXXX] | Headings, main body text           |
| Text Secondary | [Name]       | [#XXXXXX] | Subtitles, captions, placeholders  |
| Border         | [Name]       | [#XXXXXX] | Card borders, dividers             |

# CSS Variables block — Claude Code adds this to globals.css:
```css
:root {
  --color-bg:             [#XXXXXX];
  --color-surface:        [#XXXXXX];
  --color-accent:         [#XXXXXX];
  --color-accent-hover:   [#XXXXXX];
  --color-text-primary:   [#XXXXXX];
  --color-text-secondary: [#XXXXXX];
  --color-border:         [#XXXXXX];
}
body {
  background-color: var(--color-bg);
  color: var(--color-text-primary);
}
```

# Tailwind config tokens — Claude Code adds this to tailwind.config.ts:
```ts
theme: {
  extend: {
    colors: {
      bg:              '[#XXXXXX]',
      surface:         '[#XXXXXX]',
      accent:          '[#XXXXXX]',
      'accent-hover':  '[#XXXXXX]',
      'text-primary':  '[#XXXXXX]',
      'text-secondary':'[#XXXXXX]',
      border:          '[#XXXXXX]',
    },
  },
}
```

### 1.4 Typography
```
Headings font:  [e.g. Barlow Condensed / Poppins / Montserrat / Oswald]
Headings weight:[e.g. 700 / 800]
Body font:      [e.g. DM Sans / Inter / Plus Jakarta Sans]
Body weight:    [e.g. 400 / 500]
```
# next/font/google setup — Claude Code adds this to layout.tsx:
```tsx
import { [HeadingFont], [BodyFont] } from 'next/font/google'

const displayFont = [HeadingFont]({ subsets: ['latin'], weight: ['[WEIGHT]'] })
const bodyFont = [BodyFont]({ subsets: ['latin'], weight: ['400', '500'] })
```

### 1.5 Logo & Image Assets
```
Logo (dark bg):   /public/assets/logo-white.[ext]   ← navbar, footer, hero
Logo (light bg):  /public/assets/logo-black.[ext]   ← light section backgrounds
Hero image:       /public/assets/hero-bg.[ext]       ← hero background photo
Section image:    /public/assets/section-img.[ext]   ← optional, product/fleet/team
```
# If no logo files → use styled text "COMPANY NAME" in Tailwind (Claude handles this)
# All images must use next/image with width, height, alt — no raw <img> tags

### 1.6 Hero Section Content
```
Headline:     [MAIN HEADLINE — bold, direct, 5-8 words max]
              e.g. "JOIN THE TRANSNATUR TEAM" / "SELL YOUR HOME IN 30 DAYS"
Subheadline:  [ONE sentence — what you offer and who it's for]
              e.g. "CDL-A Drivers Wanted — Competitive Pay · Modern Fleet · Home Time"
CTA Button:   [BUTTON TEXT] e.g. "Apply Now" / "Book a Free Call" / "Get Started"
```

### 1.7 Benefits / Features Section
# List 4-7 items. Format: Lucide icon name + title + short description
```
Section title: [e.g. "Pay & Benefits" / "What You Get" / "Our Services"]

1. Icon: [Lucide icon name]  Title: [Benefit Title]  — [Short description, 1 line]
2. Icon: [Lucide icon name]  Title: [Benefit Title]  — [Short description, 1 line]
3. Icon: [Lucide icon name]  Title: [Benefit Title]  — [Short description, 1 line]
4. Icon: [Lucide icon name]  Title: [Benefit Title]  — [Short description, 1 line]
5. Icon: [Lucide icon name]  Title: [Benefit Title]  — [Short description, 1 line]
6. Icon: [Lucide icon name]  Title: [Benefit Title]  — [Short description, 1 line]  ← optional
```
# Common Lucide icons: DollarSign, Home, Truck, Shield, Clock, Zap, MapPin,
#   CheckCircle, Star, Headphones, Package, Radio, BarChart, Users, Award

### 1.8 Requirements / Checklist Section
# What must the visitor have/be to qualify? Skip if not applicable.
```
Section title: [e.g. "Driver Requirements" / "Who We Work With" / "Eligibility"]

✔ [Requirement 1]
✔ [Requirement 2]
✔ [Requirement 3]
✔ [Requirement 4]
✔ [Requirement 5]  ← optional
```
# SKIP THIS SECTION? → [SKIP / INCLUDE]

### 1.9 Product / Fleet / Portfolio Section
# Showcase your main product, service, fleet, or team. Optional.
```
Section title: [e.g. "Our Fleet" / "The Product" / "Our Work"]
Image:         /public/assets/section-img.[ext]
Description:   [2-3 sentences about your product/fleet/portfolio]
Highlight 1:   [e.g. "2022–2024 Peterbilt Fleet"]
Highlight 2:   [e.g. "GPS Tracked, Every Load"]
Highlight 3:   [e.g. "Flatbed & Dry Van Available"]
```
# SKIP THIS SECTION? → [SKIP / INCLUDE]

### 1.10 Social Proof — Testimonials OR Stats
# Choose ONE format (or BOTH if you have content for both)

# OPTION A — Testimonials:
```
Testimonial 1: "[Quote text]" — [Name], [Company or Role]
Testimonial 2: "[Quote text]" — [Name], [Company or Role]
Testimonial 3: "[Quote text]" — [Name], [Company or Role]
```

# OPTION B — Stats Bar:
```
Stat 1: [Number/Value]  [Label]   e.g. "500+"   "Loads Delivered Monthly"
Stat 2: [Number/Value]  [Label]   e.g. "12 yrs" "In Operation"
Stat 3: [Number/Value]  [Label]   e.g. "4.9★"   "Driver Satisfaction"
Stat 4: [Number/Value]  [Label]   e.g. "DOT"    "Licensed & Insured"
```
# Using: [TESTIMONIALS / STATS / BOTH]

### 1.11 "Why Choose Us" Cards
```
Section title: [e.g. "Why Drive With Us" / "Why Choose Us"]

Card 1: ✅ [Value prop]  — [1 sentence explanation]
Card 2: ✅ [Value prop]  — [1 sentence explanation]
Card 3: ✅ [Value prop]  — [1 sentence explanation]
Card 4: ✅ [Value prop]  — [1 sentence explanation]  ← optional
```

### 1.12 Final CTA Section
```
Headline: [e.g. "Ready to Drive With the Best?" / "Let's Work Together"]
Subtext:  [1 sentence — urgency or reassurance]
Button:   [CTA TEXT — same as hero or stronger e.g. "APPLY NOW — IT'S FREE"]
```

### 1.13 Footer Content
```
Tagline:      [e.g. "Moving cargo. Building trust."]
Show:         Company name, Address, Phone, Email, Legal IDs (from 1.1)
Footer links: [e.g. Privacy Policy / Terms of Service / Contact]
Social links: [Facebook URL / Instagram URL / LinkedIn URL — leave blank if none]
Copyright:    © [YEAR] [COMPANY NAME]. All rights reserved.
```

---

## SECTION 2 — DESIGN SYSTEM
# 📋 KEEP AS-IS BY DEFAULT — adjust only if your brand requires it

### Component Style Rules

**Buttons — two variants ONLY:**
```
Primary button:
  bg: var(--color-accent)       text: #111111 (dark text on light accent)
  font-weight: 600              border-radius: 8px
  hover: bg → var(--color-accent-hover)
  Tailwind: "bg-accent text-bg font-semibold hover:bg-accent-hover rounded-lg px-6 py-3"

Ghost button:
  bg: transparent               border: 1.5px solid var(--color-accent)
  text: var(--color-text-primary)
  hover: bg → accent, text → bg
  Tailwind: "border border-accent text-text-primary hover:bg-accent hover:text-bg rounded-lg px-6 py-3"
```
# ✏️ OVERRIDE for dark/light theme swap:
# If PRIMARY color is light (e.g. white) and ACCENT is dark → swap text colors above

**Cards:**
```
bg: var(--color-surface)        border-radius: 8px
border: 1px solid var(--color-border)
hover: border → accent + translateY(-4px)
transition: all 0.2s ease
Tailwind: "bg-surface border border-border rounded-lg hover:border-accent transition-all hover:-translate-y-1"
```

**Section Labels (above section titles):**
```
Short text in accent color, with a 3px accent-color left border or top bar
e.g. "WHAT WE OFFER" above "Everything you need on the road"
```

### Navbar
```
Position: sticky, top-0, z-50
Initial state: transparent background (or primary color — see 1.3)
After 60px scroll: background rgba + backdrop-blur-md + border-bottom border-border
Left: Logo (text or image)
Center: nav links (Home, About if multi-page, else skip)
Right: Ghost "Log in" button (optional) + Primary CTA button → /form
Mobile (<768px): hamburger icon → slide-in drawer with links + buttons
```

### Layout & Spacing
```
Max content width:  max-w-7xl mx-auto
Section padding:    py-20 px-4 (desktop) / py-12 px-4 (mobile)
Card grid:          grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6
Hero height:        h-screen (100vh)
```

### Typography Scale
```
Hero headline:     text-6xl lg:text-8xl font-display font-bold (64–80px)
Section titles:    text-4xl lg:text-5xl font-display (36–48px)
Card titles:       text-lg font-semibold (18–20px)
Body text:         text-base font-body leading-relaxed (15–16px, line-height 1.7)
```

### Visual Texture (optional, for premium feel)
```
Hero background:  subtle radial-gradient from surface to bg color
                  "background: radial-gradient(ellipse at center, var(--color-surface), var(--color-bg))"
Section labels:   3px accent top-border line above each section title
Card hover:       translateY(-4px) + accent border
No gradients:     except hero background only
```

---

## SECTION 3 — PAGE STRUCTURE (3 pages)

### Page 1: /app/page.tsx — Main Landing Page
# Sections in order (remove any marked SKIP in Section 1)
```
Component file          Section content
─────────────────────────────────────────────────────────
Navbar.tsx              sticky, logo, CTA button → /form
Hero.tsx                bg image/gradient, headline, subheadline, CTA → /form
BenefitsSection.tsx     icon cards grid (from Section 1.7)
RequirementsSection.tsx checklist (from Section 1.8)    [SKIP if marked]
ProductSection.tsx      image + description (from Section 1.9) [SKIP if marked]
SocialProof.tsx         testimonials or stats (from Section 1.10)
WhyUsSection.tsx        value prop cards (from Section 1.11)
CtaBanner.tsx           final CTA → /form (from Section 1.12)
Footer.tsx              from Section 1.13
```

### Page 2: /app/form/page.tsx — Lead Form Page
```
Component file          Section content
─────────────────────────────────────────────────────────
FormHeader.tsx          minimal: logo + company name only
FormPage.tsx            motivating headline + form (from Section 4)
Footer.tsx              same shared footer component
```

### Page 3: /app/thank-you/page.tsx — Thank You Page
```
- Logo / company name (centered)
- Large headline: "Thank You!"
- Message: [CUSTOMIZE — e.g. "We will contact you within 24 hours."]
- Button: "Back to Home" → /
- Button: "Write us an email" → mailto:[email]
- Footer.tsx (shared)
```

---

## SECTION 4 — LEAD FORM CONFIGURATION
# ✏️ CUSTOMIZE: keep required fields, add/remove optional ones

### 4.1 Form Fields
# Uses React Hook Form + Zod validation
```
REQUIRED — always include:
- First Name *          (type: text, Zod: z.string().min(2))
- Last Name *           (type: text, Zod: z.string().min(2))
- Phone Number *        (type: tel, Zod: z.string().regex(/phone pattern/))
- Email Address *       (type: email, Zod: z.string().email())

OPTIONAL — add what's relevant to your niche:
- [Field Label] *       (type: text / tel / number, Zod: z.string().min(1))
- [Dropdown Label]:     Options: [Option 1] / [Option 2] / [Option 3]
  (type: select, Zod: z.enum(['Option1', 'Option2', 'Option3']))
- [Dropdown Label]:     Options: [Option 1] / [Option 2] / [Option 3]
- [Checkbox]:           [Label text]  (Zod: z.boolean())

Submit button text: "[CTA TEXT]"
  Primary variant, full-width on mobile, accent color
```

# EXAMPLE for trucking niche (replace for other niches):
# - CDL Class: dropdown [CDL-A / CDL-B / No CDL]
# - Years of Experience: dropdown [Less than 1 / 1-2 / 3-5 / 5+]
# - State: dropdown [all 50 US states]

### 4.2 Form Validation (Zod Schema)
# Claude Code will generate this — no action needed
# Just ensure field names match your custom fields in 4.1
```typescript
// Claude Code generates this based on your fields
const formSchema = z.object({
  firstName: z.string().min(2, 'First name is required'),
  lastName:  z.string().min(2, 'Last name is required'),
  phone:     z.string().min(10, 'Valid phone required'),
  email:     z.string().email('Valid email required'),
  // YOUR CUSTOM FIELDS ADDED HERE BY CLAUDE
})
```

### 4.3 Form Submission Method
# ✏️ CHOOSE ONE — Claude Code will implement the selected option
```
OPTION A: Google Sheets via Apps Script (see setup in 4.4)
  → POST JSON to Apps Script URL → redirect to /thank-you

OPTION B: API Route (Next.js /api/submit)
  → POST to /api/submit → send email via Nodemailer/Resend → redirect to /thank-you

OPTION C: No backend — just redirect
  → onSubmit: router.push('/thank-you')
  → Use when: you'll collect leads another way or add backend later
```
# Selected option: [A / B / C]

### 4.4 Google Sheets Setup (ONLY if Option A selected)
# ❓ Claude Code will ask before implementing unless you specify in prompt

**Step 1 — Create Sheet:**
- Name: "[COMPANY NAME] Leads"
- Row 1 headers: `Timestamp | First Name | Last Name | Phone | Email | [your custom fields]`

**Step 2 — Apps Script:**
```javascript
// Extensions → Apps Script → paste this, deploy as Web App
function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);

  sheet.appendRow([
    new Date(),
    data.firstName,
    data.lastName,
    data.phone,
    data.email,
    // ADD YOUR CUSTOM FIELDS HERE — match names from formSchema
    // data.cdlClass,
    // data.experience,
    // data.state,
  ]);

  return ContentService
    .createTextOutput(JSON.stringify({ result: "success" }))
    .setMimeType(ContentService.MimeType.JSON);
}
```

**Step 3 — Deploy & Connect:**
1. Deploy → New Deployment → Web App
2. Execute as: Me | Who has access: Anyone
3. Copy Web App URL
4. Add to `.env.local`: `NEXT_PUBLIC_SHEETS_URL="PASTE_URL_HERE"`
5. In form component: `const sheetsUrl = process.env.NEXT_PUBLIC_SHEETS_URL`

---

## SECTION 5 — SEO
# 📋 KEEP STRUCTURE — fill in values per page

### Metadata (Next.js App Router format — add to each page file)
```tsx
// Add to each page.tsx file above the component
export const metadata: Metadata = {
  title: '[Page Title] | [Company Name]',
  description: '[Page-specific description, 120–160 chars]',
  keywords: '[keyword1, keyword2, keyword3]',
  openGraph: {
    title: '[OG Title]',
    description: '[OG Description]',
    siteName: '[Company Name]',
  },
}
```

### Page-specific metadata values
```
Landing page (/):
  title:       "[CTA Hook] | [Company Name]"
  description: "[One sentence about what you offer and who it's for]"

Form page (/form):
  title:       "Apply Now | [Company Name]"
  description: "[Short motivating sentence about applying]"

Thank You (/thank-you):
  title:       "Thank You | [Company Name]"
  description: "Application received. We'll contact you within 24 hours."
```

---

## SECTION 6 — ANALYTICS
# 📋 KEEP AS-IS — replace GA_MEASUREMENT_ID before going live

### Google Analytics (add to layout.tsx via Next.js Script)
```tsx
import Script from 'next/script'

// Inside <head> in layout.tsx:
<Script
  src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"
  strategy="afterInteractive"
/>
<Script id="google-analytics" strategy="afterInteractive">
  {`
    window.dataLayer = window.dataLayer || [];
    function gtag(){dataLayer.push(arguments);}
    gtag('js', new Date());
    gtag('config', 'GA_MEASUREMENT_ID');
  `}
</Script>
```

---

## SECTION 7 — FILE STRUCTURE
```
[project-name]/
├── app/
│   ├── layout.tsx              ← Root layout: Navbar + Footer + Analytics + Fonts
│   ├── page.tsx                ← Landing page (/)
│   ├── form/
│   │   └── page.tsx            ← Form page (/form)
│   └── thank-you/
│       └── page.tsx            ← Thank you page (/thank-you)
├── components/
│   ├── layout/
│   │   ├── Navbar.tsx
│   │   └── Footer.tsx
│   ├── sections/
│   │   ├── Hero.tsx
│   │   ├── BenefitsSection.tsx
│   │   ├── RequirementsSection.tsx     ← skip if not needed
│   │   ├── ProductSection.tsx          ← skip if not needed
│   │   ├── SocialProof.tsx             ← testimonials or stats
│   │   ├── WhyUsSection.tsx
│   │   └── CtaBanner.tsx
│   ├── form/
│   │   └── LeadForm.tsx                ← React Hook Form + Zod
│   └── ui/
│       ├── Button.tsx
│       ├── Card.tsx
│       └── SectionLabel.tsx
├── public/
│   └── assets/
│       ├── logo-white.[ext]
│       ├── logo-black.[ext]
│       ├── hero-bg.[ext]
│       └── section-img.[ext]           ← optional
├── .env.local                          ← NEXT_PUBLIC_SHEETS_URL (if Google Sheets)
├── tailwind.config.ts
├── globals.css
└── package.json
```

---

## SECTION 8 — INSTALL COMMANDS
# Run these before giving the prompt to Claude Code

```bash
# 1. Create the project
npx create-next-app@latest [project-name] --typescript --tailwind --app --eslint
cd [project-name]

# 2. Install dependencies
npm install framer-motion lucide-react react-hook-form @hookform/resolvers zod clsx tailwind-merge

# 3. Install shadcn/ui
npx shadcn@latest init
# When prompted: Dark theme, Default style, CSS variables: Yes

# 4. Add shadcn components you'll need
npx shadcn@latest add button input select checkbox label form

# 5. Optional: additional icon libraries
npm install react-icons          # if you need brand icons (Facebook, etc.)
```

---

## SECTION 9 — ANIMATIONS REFERENCE
# 📋 Claude Code uses these patterns — no action needed, just reference

### Standard Framer Motion Variants
```typescript
// Fade up — use on every section
const fadeInUp = {
  hidden:  { opacity: 0, y: 24 },
  visible: { opacity: 1, y: 0, transition: { duration: 0.5, ease: 'easeOut' } }
}

// Stagger children — use on card grids and hero words
const stagger = {
  visible: { transition: { staggerChildren: 0.08 } }
}

// All section wrappers use:
// <motion.section whileInView="visible" initial="hidden" viewport={{ once: true }}>

// Cards:
// <motion.div variants={fadeInUp} whileHover={{ y: -4 }}>

// Accessibility:
// @media (prefers-reduced-motion: reduce) { * { animation: none !important; } }
```

---

## SECTION 10 — PROMPT FOR CLAUDE CODE
# 📋 COPY → PASTE TO CLAUDE CODE TO START BUILDING
# Customize the lines marked with ✏️

```
Read [THIS_TEMPLATE_FILE_NAME].md completely before writing a single line of code.

Build a 3-page landing site (/, /form, /thank-you) exactly as described in the template.

Tech stack:
- Next.js 14 App Router + TypeScript
- Tailwind CSS (with custom tokens from Section 1.3)
- Framer Motion (animations from Section 9)
- shadcn/ui components
- Lucide React icons
- React Hook Form + Zod validation
- next/font/google for fonts

Instructions:
- CSS variables and Tailwind tokens from Section 1.3 → add to globals.css and tailwind.config.ts
- Fonts from Section 1.4 → configure via next/font in layout.tsx
- Analytics from Section 6 → add to layout.tsx using next/script
- All images via next/image with width, height, alt — no raw <img> tags
- Build in order: layout.tsx → Navbar → Footer → UI components → page.tsx → /form → /thank-you
- Include all sections listed in Section 3 (skip any marked SKIP in Section 1)

✏️ Google Sheets integration: [YES, set up Option A from Section 4.4 / NO, just redirect to /thank-you]

✏️ Assets: [Images are in /public/assets/ folder / Use placehold.co placeholders for now]

✏️ Sections to skip: [list any sections marked SKIP / none]

Start with layout.tsx and the shared Navbar + Footer. Show me those before proceeding.
```
