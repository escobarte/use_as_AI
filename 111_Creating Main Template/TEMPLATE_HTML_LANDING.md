# ============================================================
# LANDING PAGE TEMPLATE — HTML / CSS / Vanilla JS
# ============================================================
# WHEN TO USE THIS:
#   Quick landing pages, ad campaigns, recruitment pages,
#   promo pages. No Node.js required. Host on GitHub Pages,
#   Netlify, or any static hosting for free.
#
# HOW TO USE:
#   1. Fill in SECTION 1 (Project Config) — changes every project
#   2. Adjust SECTION 2 (Design System) colors/fonts if needed
#   3. Check SECTION 3 (Pages) — remove sections you don't need
#   4. Configure SECTION 4 (Form Fields)
#   5. Grab the prompt from SECTION 7 and paste to Claude Code
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
Website:        [DOMAIN if exists, else leave blank]
Legal IDs:      [MC# / USDOT# / Business license / leave blank if not applicable]
```

### 1.2 Niche & Goal
```
Industry:       [e.g. Trucking / Real Estate / SaaS / Fitness / Legal]
Target user:    [Who is this page for? e.g. CDL-A truck drivers / homeowners / startup founders]
Primary action: [What should visitor do? e.g. Apply / Book a call / Buy / Sign up]
Urgency:        [Optional — e.g. "Hiring now" / "Limited spots" / leave blank]
```

### 1.3 Branding Colors
# Fill in all 4 rows. Use hex codes.
| Role         | Color Name   | Hex       | Usage                              |
|--------------|--------------|-----------|------------------------------------|
| Primary      | [Name]       | [#XXXXXX] | Navbar, Hero background, Footer    |
| Accent / CTA | [Name]       | [#XXXXXX] | ALL buttons, highlights, urgency   |
| Background   | [Name]       | [#XXXXXX] | Section backgrounds, cards         |
| Text         | [Name]       | [#XXXXXX] | Body text, secondary text          |

# CSS Variables block — Claude Code will add this to styles.css
# Fill hex values from the table above:
```css
:root {
  --color-primary:    [#XXXXXX];   /* Navbar, Hero bg, Footer */
  --color-accent:     [#XXXXXX];   /* Buttons, highlights */
  --color-bg:         [#XXXXXX];   /* Page background / white sections */
  --color-bg-alt:     [#F5F5F5];   /* Alternating section bg — usually keep this */
  --color-text:       [#XXXXXX];   /* Main body text */
  --color-text-light: [#FFFFFF];   /* Text on dark backgrounds */
}
```

### 1.4 Typography
```
Headings font:  [e.g. Poppins / Barlow Condensed / Montserrat / Oswald]
Headings weight:[e.g. 800 / 700]
Body font:      [e.g. Inter / DM Sans / Open Sans / Lato]
Body weight:    [e.g. 400 / 500]
```
# Google Fonts <link> import — paste here (copy from fonts.google.com):
```html
<link href="https://fonts.googleapis.com/css2?family=[FONT1]:wght@[WEIGHT]&family=[FONT2]:wght@[WEIGHT]&display=swap" rel="stylesheet">
```

### 1.5 Logo & Image Assets
```
Logo (dark bg):   assets/logo-white.[ext]    ← used in navbar, footer, hero
Logo (light bg):  assets/logo-black.[ext]    ← used on light section backgrounds
Hero image:       assets/hero-bg.[ext]        ← full-width hero background photo
Section image:    assets/section-img.[ext]    ← optional, for fleet/product/team section
```
# If no logo files → use company name as styled text (Claude will handle this)

### 1.6 Hero Section Content
```
Headline:     [MAIN HEADLINE — bold, direct, 5-8 words max]
              e.g. "JOIN THE TRANSNATUR TEAM" / "SELL YOUR HOME IN 30 DAYS"
Subheadline:  [ONE sentence — what you offer and who it's for]
              e.g. "CDL-A Drivers Wanted — Competitive Pay · Modern Fleet · Home Time"
CTA Button:   [BUTTON TEXT] e.g. "APPLY NOW" / "BOOK A FREE CALL" / "GET STARTED"
```

### 1.7 Benefits / Features Section
# List 4-7 items. Format: emoji icon + title + short description
```
1. [emoji] [Benefit Title]   — [Short description, 1 line max]
2. [emoji] [Benefit Title]   — [Short description, 1 line max]
3. [emoji] [Benefit Title]   — [Short description, 1 line max]
4. [emoji] [Benefit Title]   — [Short description, 1 line max]
5. [emoji] [Benefit Title]   — [Short description, 1 line max]
6. [emoji] [Benefit Title]   — [Short description, 1 line max]  ← optional
7. [emoji] [Benefit Title]   — [Short description, 1 line max]  ← optional

Section title: [e.g. "Pay & Benefits" / "What You Get" / "Our Services"]
```

### 1.8 Requirements / Checklist Section
# What does the visitor need to qualify? Remove this block if not applicable.
```
Section title: [e.g. "Driver Requirements" / "Who We Work With" / "Eligibility"]

✔ [Requirement 1]
✔ [Requirement 2]
✔ [Requirement 3]
✔ [Requirement 4]
✔ [Requirement 5]  ← optional
```
# SKIP THIS SECTION? → Write "SKIP" here: [SKIP / INCLUDE]

### 1.9 Product / Fleet / Portfolio Section
# Showcase your main product, truck, service, or team photo. Optional.
```
Section title: [e.g. "Our Fleet" / "Our Work" / "The Product"]
Image:         assets/section-img.[ext]
Description:   [2-3 sentences about your fleet/product/portfolio]
Highlight 1:   [e.g. "2022–2024 Peterbilt" / "10+ Projects Delivered"]
Highlight 2:   [e.g. "Flatbed & Dry Van" / "5-Star Rated"]
Highlight 3:   [e.g. "GPS Tracked" / "Licensed & Insured"]
```
# SKIP THIS SECTION? → Write "SKIP" here: [SKIP / INCLUDE]

### 1.10 Social Proof — Testimonials OR Stats
# Choose ONE: Testimonials OR Stats bar (or both if you have content for both)

# OPTION A — Testimonials:
```
Testimonial 1: "[Quote text]" — [Name], [Company or Role]
Testimonial 2: "[Quote text]" — [Name], [Company or Role]
Testimonial 3: "[Quote text]" — [Name], [Company or Role]
```

# OPTION B — Stats bar (numbers that build trust):
```
Stat 1: [Number/Value]  [Label]   e.g. "500+"   "Loads Delivered Monthly"
Stat 2: [Number/Value]  [Label]   e.g. "12 yrs" "In Operation"
Stat 3: [Number/Value]  [Label]   e.g. "4.9★"   "Driver Satisfaction"
Stat 4: [Number/Value]  [Label]   e.g. "DOT"    "Licensed & Insured"
```
# Using: [TESTIMONIALS / STATS / BOTH]

### 1.11 "Why Choose Us" Cards
# 3-4 short value propositions — what makes you different
```
Section title: [e.g. "Why Drive With Us" / "Why Choose Us" / "Why We're Different"]

✅ [Value prop 1]   — [1 sentence explanation]
✅ [Value prop 2]   — [1 sentence explanation]
✅ [Value prop 3]   — [1 sentence explanation]
✅ [Value prop 4]   — [1 sentence explanation]  ← optional
```

### 1.12 Final CTA Section
```
Headline: [e.g. "Ready to Drive With the Best?" / "Let's Work Together"]
Subtext:  [1 sentence — urgency or reassurance]
          e.g. "Join Transnatur INC today. We respond within 24 hours."
Button:   [CTA TEXT — same as hero or stronger]
          e.g. "APPLY NOW — IT'S FREE"
```

### 1.13 Footer Content
```
Show in footer: Company name, Address, Phone, Email, Legal IDs (from 1.1)
Footer links:   [e.g. Privacy Policy / Terms / Contact]
Social links:   [Facebook URL / Instagram URL / LinkedIn URL — leave blank if none]
Copyright:      © [YEAR] [COMPANY NAME]. All rights reserved.
```

---

## SECTION 2 — DESIGN RULES
# 📋 KEEP AS-IS BY DEFAULT — adjust only if your brand requires it

### Core Layout
- **Mobile-first**: all sections fully responsive, tested at 375px, 768px, 1280px
- **Hero**: 100vh, dark overlay on bg image (`rgba(0,0,0,0.6)`), white headline text
- **Sections**: alternate between `var(--color-bg)` and `var(--color-bg-alt)`
- **Navbar**: sticky, primary color background, logo left, CTA button right
- **Footer**: primary color background, white text, multi-column layout
- **Buttons**: accent color, white text, `border-radius: 8px`, bold, full-width on mobile
- **CTA button appears minimum 3 times**: hero, mid-page, final CTA section

### Button Style
```css
.btn-primary {
  background: var(--color-accent);
  color: #ffffff;
  font-weight: 700;
  border-radius: 8px;
  padding: 14px 28px;
  border: none;
  cursor: pointer;
  transition: filter 0.2s ease;
}
.btn-primary:hover {
  filter: brightness(0.9);
}
```

### Motion & Micro-interactions
- Hero CTA button: subtle pulse animation (`@keyframes pulse`)
- Cards: fade-in + slide-up on scroll via `IntersectionObserver`
- Navbar: background becomes opaque after 60px scroll
- Form inputs: smooth `border-color` transition on focus (0.2s)
- Card grid: staggered `animation-delay` (0.1s increments per card)

### Aesthetic — "Bold & Trustworthy"
- Heavy typography for headlines (large, uppercase or title case)
- Strong contrast between sections
- NO generic gradients or pastel colors unless specified in Section 1.3
- Use large bold numbers as visual anchors in benefits (e.g. `$0.65`, `500+`)

---

## SECTION 3 — PAGE STRUCTURE

### Page 1: index.html — Main Landing Page
Sections in order (remove any marked SKIP in Section 1):
```
1. Navbar        — sticky, logo, nav links (if any), CTA button → form.html
2. Hero          — bg image + overlay, headline, subheadline, CTA button → form.html
3. Benefits      — icon cards grid (from Section 1.7)
4. Requirements  — checklist (from Section 1.8)  [SKIP if marked]
5. Fleet/Product — image + description (from Section 1.9)  [SKIP if marked]
6. Social Proof  — testimonials or stats (from Section 1.10)
7. Why Us        — value prop cards (from Section 1.11)
8. Final CTA     — big button → form.html (from Section 1.12)
9. Footer        — from Section 1.13
```

### Page 2: form.html — Lead Form Page
```
1. Header   — minimal: logo + company name only (no full navbar)
2. CTA text — short motivating headline above the form
             e.g. "One step away from your next opportunity"
3. Form     — fields from Section 4
4. Footer   — same as main page footer
```

### Page 3: thankyou.html — Thank You Page
```
1. Logo / company name
2. Big headline: "Thank You!"
3. Message: [CUSTOMIZE — e.g. "We will contact you within 24 hours."]
4. Button: "Back to Home" → index.html
5. Button: "Write us an email" → mailto:[email]
```

---

## SECTION 4 — LEAD FORM CONFIGURATION
# ✏️ CUSTOMIZE: keep required fields, add/remove optional fields

### 4.1 Form Fields
```
# REQUIRED — always include these:
- First Name *          (text input)
- Last Name *           (text input)
- Phone Number *        (tel input)
- Email Address *       (email input)

# OPTIONAL — add what's relevant to your niche:
- [Field Label] *       (type: text / tel / email / number)
- [Dropdown Label]:     [Option 1] / [Option 2] / [Option 3]
- [Dropdown Label]:     [Option 1] / [Option 2] / [Option 3]
- [Checkbox]:           [Label text]

# Submit Button text: "[CTA TEXT]"  — accent color, full-width
```

# EXAMPLE for trucking niche (from Design.md — replace for other niches):
# - CDL Class (dropdown: CDL-A / CDL-B / No CDL)
# - Years of Experience (dropdown: Less than 1 / 1-2 / 3-5 / 5+)
# - State (dropdown, all US states)

### 4.2 Form Submission Method
# ✏️ CHOOSE ONE — delete the others:

```
OPTION A: Google Sheets (see setup in Section 4.3)
  → On submit: POST data to Apps Script URL, redirect to thankyou.html
  → Fallback: alert with phone number if submit fails

OPTION B: EmailJS (no backend, sends to email)
  → On submit: send via EmailJS API, redirect to thankyou.html

OPTION C: No backend (form collects data, just redirect)
  → On submit: redirect to thankyou.html
  → Use when: you'll collect leads another way (e.g. Tally, Typeform embed)
```
# Selected option: [A / B / C]

### 4.3 Google Sheets Setup (ONLY if Option A selected)
# ❓ Claude Code will ask before implementing, or specify in prompt

**Step 1 — Create Sheet:**
- Name: "[COMPANY NAME] Leads"
- Row 1 headers: `Timestamp | First Name | Last Name | Phone | Email | [your custom fields]`

**Step 2 — Apps Script:**
```javascript
// Paste in Extensions → Apps Script → replace existing code
function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);

  sheet.appendRow([
    new Date(),
    data.firstName,
    data.lastName,
    data.phone,
    data.email,
    // ADD YOUR CUSTOM FIELDS HERE:
    // data.fieldName,
  ]);

  return ContentService
    .createTextOutput(JSON.stringify({ result: "success" }))
    .setMimeType(ContentService.MimeType.JSON);
}
```

**Step 3 — Deploy & Connect:**
1. Deploy → New Deployment → Web App
2. Execute as: Me | Who has access: Anyone
3. Copy the Web App URL
4. In form.html, set: `const GOOGLE_SHEET_URL = "PASTE_URL_HERE";`

---

## SECTION 5 — SEO & ANALYTICS
# 📋 KEEP STRUCTURE — replace placeholder values

### SEO Meta Tags (add to `<head>` of every page)
```html
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="[Page description — 120-160 chars]">
<meta name="keywords" content="[keyword1, keyword2, keyword3, city, industry]">
<meta property="og:title" content="[Page title for social sharing]">
<meta property="og:description" content="[OG description]">
<title>[Page Title] | [Company Name]</title>
```

### Google Analytics (add to `<head>` of every page)
```html
<!-- Replace GA_MEASUREMENT_ID with your real ID before going live -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

---

## SECTION 6 — FILE STRUCTURE
```
[project-folder-name]/
├── index.html          ← Main landing page
├── form.html           ← Lead form page
├── thankyou.html       ← Thank you page
├── styles.css          ← All styles (shared across pages)
├── main.js             ← Animations, scroll effects, form submit logic
└── assets/
    ├── logo-white.[ext]
    ├── logo-black.[ext]
    ├── hero-bg.[ext]
    └── section-img.[ext]    ← optional
```

---

## SECTION 7 — PROMPT FOR CLAUDE CODE
# 📋 COPY → PASTE TO CLAUDE CODE TO START BUILDING
# Customize the lines marked with ✏️

```
Read [THIS_TEMPLATE_FILE_NAME].md completely before writing a single line of code.

Build a 3-page landing site exactly as described in the template.

Tech stack: HTML5, CSS3, Vanilla JavaScript — no frameworks, no build tools.

Instructions:
- Use all branding from Section 1 (colors, fonts, content, assets)
- Follow design rules from Section 2 exactly
- Build pages in order: index.html → form.html → thankyou.html
- Include all sections from Section 3 (skip any marked SKIP)
- Form fields from Section 4.1

✏️ Google Sheets integration: [YES, use Option A from Section 4.3 / NO, just redirect to thankyou.html]

✏️ Assets: [Images are in /assets folder / Placeholder images for now — I'll replace later]

Start with index.html. Do not proceed to form.html until I approve the first page.
```
