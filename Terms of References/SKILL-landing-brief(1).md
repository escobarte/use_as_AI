---
name: transnatur-landing
description: Build the Transnatur INC recruitment landing page. Use this skill whenever working on the Transnatur website, landing page, driver recruitment site, lead form, or any page for TRANSNATUR INC. Contains all branding, company data, page structure, and Google Sheets integration instructions.
---

# Transnatur INC — Recruitment Landing Page

## Company Information

```
Company:    TRANSNATUR INC
Address:    16305 S WHEATGRASS ST, LOCKPORT IL 60441
MC#:        1592651
USDOT#:     4149516
President:  Vasilii Iurcu
Phone:      (312) 909-4861
Email:      Transnaturinc@gmail.com
```

---

## Stack

This project uses **React + TypeScript + Vite + Tailwind CSS + shadcn/ui**.
Bundled into a single `bundle.html` using the `web-artifacts-builder` skill.

---

## Branding Colors

| Role         | Name       | Hex       |
|--------------|------------|-----------|
| Primary      | Navy Blue  | `#0B1F3A` |
| Secondary    | Dark Gray  | `#4A444A` |
| Background   | White      | `#FFFFFF` |
| CTA / Accent | Red        | `#C62828` |

**Usage rules:**
- Navy Blue → headers, navbar, hero background, footer
- Red → ALL call-to-action buttons, highlights, urgency elements
- Dark Gray → body text, secondary text
- White → section backgrounds, text on dark backgrounds

Define in `tailwind.config.ts`:
```ts
colors: {
  navy:  '#0B1F3A',
  red:   '#C62828',
  gray:  '#4A444A',
  light: '#F5F5F5',
}
```

---

## Logo & Image Assets

All images are in `../assets/` (one level up from the React project folder).

| File                         | Import as         | Use                          |
|------------------------------|-------------------|------------------------------|
| `Ttransnatur_logo_white.png` | `logoWhite`       | Navbar, footer, hero         |
| `Ttransnatur_logo_black.png` | `logoBlack`       | Light backgrounds            |
| `cover_img.png`              | `heroBg`          | Hero section background      |
| `4.png`                      | `truckImg`        | Fleet section                |

Import example in React component:
```tsx
import logoWhite from '../../assets/Ttransnatur_logo_white.png';
import heroBg from '../../assets/cover_img.png';
import truckImg from '../../assets/4.png';
```

---

## File Structure to Create

```
landing-steck/
├── assets/                          ← Images folder (already exists)
│   ├── Ttransnatur_logo_white.png
│   ├── Ttransnatur_logo_black.png
│   ├── cover_img.png
│   └── 4.png
├── web-artifacts-builder/           ← Builder skill (already exists)
├── SKILL-landing-brief.md
├── README.md
└── transnatur-landing/              ← React project (create with init script)
    ├── index.html
    ├── tailwind.config.ts
    ├── vite.config.ts
    ├── src/
    │   ├── main.tsx
    │   ├── App.tsx                  ← React Router setup
    │   └── pages/
    │       ├── Home.tsx             ← Main landing page
    │       ├── Form.tsx             ← Lead form page
    │       └── ThankYou.tsx         ← Thank you page
    └── bundle.html                  ← Final output (after bundling)
```

---

## Routing

Use `react-router-dom` for navigation between pages:

```tsx
// App.tsx
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Home from './pages/Home';
import Form from './pages/Form';
import ThankYou from './pages/ThankYou';

export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/form" element={<Form />} />
        <Route path="/thankyou" element={<ThankYou />} />
      </Routes>
    </BrowserRouter>
  );
}
```

Navigation between pages:
```tsx
import { useNavigate } from 'react-router-dom';
const navigate = useNavigate();
// Go to form:
navigate('/form');
// Go back home:
navigate('/');
```

---

## Typography

- **DO NOT use:** Inter, Roboto, Arial, or system fonts
- **Headings:** `Poppins` weight 800
- **Subtext / labels:** `Bebas Neue` weight 400

Add to `index.html`:
```html
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@800&family=Bebas+Neue&display=swap" rel="stylesheet">
```

Add to `tailwind.config.ts`:
```ts
fontFamily: {
  heading: ['Poppins', 'sans-serif'],
  label:   ['Bebas Neue', 'sans-serif'],
}
```

Usage in components:
```tsx
<h1 className="font-heading font-extrabold">JOIN THE TRANSNATUR TEAM</h1>
<p className="font-label tracking-wider">CDL-A Drivers Wanted</p>
```

---

## Page 1: Home.tsx — Main Landing Page

Sections in order:

1. **Navbar** — Sticky, navy background, white logo, "APPLY NOW" red button → `navigate('/form')`
2. **Hero Section** — Full viewport (`h-screen`), `cover_img.png` background with dark overlay, headline, subheadline, CTA button → `navigate('/form')`
3. **Pay & Benefits** — Navy background, icons + bold numbers (CPM, home time, bonuses)
4. **Modern Fleet** — `4.png` truck photo, fleet description text
5. **Why Drive With Us** — 3–4 cards with icons, short text
6. **Driver Requirements** — Checklist items
7. **Final CTA** — Big red button → `navigate('/form')`
8. **Footer** — White logo, address, MC#, USDOT#, phone, email

---

## Page 2: Form.tsx — Lead Form Page

Sections in order:

1. **Header** — White logo on navy background, company name
2. **Call to Action text** — Short motivating text above the form
3. **Lead Form** — Use shadcn/ui `Input`, `Select`, `Button` components
4. **Footer** — Same as Home footer

### Form Fields

```
- First Name *        → Input
- Last Name *         → Input
- Phone Number *      → Input
- Email *             → Input (type="email")
- CDL Class           → Select: CDL-A / CDL-B / No CDL
- Years of Experience → Select: Less than 1 / 1–2 / 3–5 / 5+
- State               → Select: all 50 US states
- Submit Button       → "APPLY NOW" (red, full-width)
```

### On Submit

```tsx
const GOOGLE_SHEET_URL = "YOUR_APPS_SCRIPT_URL"; // Replace after deploy

async function handleSubmit(formData: FormData) {
  try {
    await fetch(GOOGLE_SHEET_URL, {
      method: "POST",
      mode: "no-cors",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(formData)
    });
    navigate('/thankyou');
  } catch (error) {
    console.error("Submit error:", error);
    alert("Error submitting form. Please call us: (312) 909-4861");
  }
}
```

---

## Page 3: ThankYou.tsx — Thank You Page

- White logo on navy background
- Large "Thank You!" heading
- Subtext: "We will contact you within 24 hours."
- Button: "Back to Home" → `navigate('/')`

---

## Design Rules

### Core Layout
- **Mobile-first** — fully responsive, Tailwind breakpoints `sm:` `md:` `lg:`
- **Hero:** `h-screen`, dark overlay `bg-navy/80` over truck image, white text
- **Sections:** alternate `bg-white` and `bg-light`
- **Navbar:** `sticky top-0 z-50 bg-navy`
- **Footer:** `bg-navy text-white`
- **Buttons:** `bg-red hover:bg-red-700 text-white font-bold rounded-lg px-6 py-3`

### Aesthetic Direction — "Industrial American Power"
Bold, trustworthy, no-nonsense, American blue-collar. Not corporate. Not generic.

**CRITICAL:** No soft gradients, no rounded pastel cards, no generic icon libraries.
Every design choice must feel intentional — trucking/logistics culture.

### Animations (use Tailwind + CSS)
- Hero CTA button: subtle pulse (`animate-pulse`)
- Benefit cards: fade-in + slide-up on scroll (`IntersectionObserver` + Tailwind transition classes)
- Navbar: opacity change on scroll
- Form inputs: `focus:border-red transition-colors duration-200`

### What Makes This Site UNFORGETTABLE
- Large bold CPM number as visual anchor: `$0.65` in massive text (`text-7xl font-heading`)
- Red CTA button appears **at least 3 times** on Home page
- Hero headline is the largest text on the page

---

## Content Copy

### Hero
```
Headline:    JOIN THE TRANSNATUR TEAM
Subheadline: CDL-A Drivers Wanted — Competitive Pay · Modern Fleet · Home Time
CTA Button:  APPLY NOW →
```

### Pay & Benefits
```
💰 Up to $0.65 CPM
🏠 Home Weekly
🚛 2022–2024 Peterbilt Fleet
🏥 Health Insurance Available
💵 Direct Deposit Weekly
📦 Flatbed & Dry Van Loads
✈️ Relocation Support (flight covered)
```

### Why Drive With Us
```
✅ Family-Owned Company — You're not a number
✅ Consistent Freight — No forced dispatch
✅ 24/7 Dispatch Support
✅ Clean DOT Record Required
```

### Driver Requirements
```
✔ Valid CDL-A License
✔ Minimum 1 Year OTR Experience
✔ Clean MVR (no DUI/DWI)
✔ Must pass DOT Physical
✔ Flatbed experience preferred (not required)
✔ US Work Authorization
```

### Final CTA
```
Headline: Ready to Drive With the Best?
Subtext:  Join Transnatur INC today. We respond within 24 hours.
Button:   APPLY NOW — IT'S FREE
```

---

## SEO (add to index.html `<head>`)

```html
<meta name="description" content="Drive with Transnatur INC. CDL-A drivers wanted. Competitive pay, modern fleet, home time. Apply now!">
<meta name="keywords" content="CDL-A driver jobs, truck driver hiring, Transnatur INC, flatbed driver, Illinois trucking">
<meta property="og:title" content="Drive With Transnatur INC — Apply Now">
<meta property="og:description" content="Join our team. Competitive pay, modern Peterbilt fleet, great home time.">
```

---

## Google Sheets Integration

### Step 1 — Create Google Sheet

1. Go to [sheets.google.com](https://sheets.google.com)
2. Create new sheet → name it: **Transnatur Leads**
3. Row 1 headers:
   ```
   A: Timestamp | B: First Name | C: Last Name | D: Phone | E: Email | F: CDL Class | G: Experience | H: State
   ```

### Step 2 — Create Apps Script

1. In the Sheet: **Extensions → Apps Script**
2. Delete existing code, paste:

```javascript
function doPost(e) {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getActiveSheet();
  var data = JSON.parse(e.postData.contents);
  sheet.appendRow([
    new Date(),
    data.firstName, data.lastName, data.phone,
    data.email, data.cdlClass, data.experience, data.state
  ]);
  return ContentService
    .createTextOutput(JSON.stringify({ result: "success" }))
    .setMimeType(ContentService.MimeType.JSON);
}
```

3. **Deploy → New Deployment** → Type: Web app → Execute as: Me → Access: Anyone → **Deploy**
4. Copy the **Web App URL**

### Step 3 — Add URL to Form.tsx

Replace `YOUR_APPS_SCRIPT_URL` in `Form.tsx` with the copied URL.

---

## How to Build

```bash
# From landing-steck/ folder:

# 1. Initialize React project
bash ./web-artifacts-builder/scripts/init-artifact.sh transnatur-landing

# 2. Go into project
cd transnatur-landing

# 3. Build the site (Claude Code edits files here)

# 4. Bundle to single HTML
bash ../web-artifacts-builder/scripts/bundle-artifact.sh

# Output: transnatur-landing/bundle.html
```
