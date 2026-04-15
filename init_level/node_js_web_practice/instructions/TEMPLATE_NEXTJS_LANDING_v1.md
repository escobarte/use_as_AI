# LANDING PAGE TEMPLATE v1
# Next.js 14 · App Router · TypeScript · Tailwind · shadcn/ui
#
# HOW TO USE:
#   1. Fill in CONTENT section below
#   2. Attach your reference image
#   3. Copy the PROMPT section → paste to Claude Code

---

## CONTENT

### Company
```
Name:     [COMPANY NAME]
Industry: [e.g. Trucking / Real Estate / SaaS]
Phone:    [PHONE]
Email:    [EMAIL]
```

### Goal
```
Primary action: [What should visitor do? e.g. Apply / Book a call / Buy]
Target user:    [Who is this page for? e.g. CDL-A drivers / homeowners]
```

### Hero
```
Headline:    [5–8 words, bold, direct]
Subheadline: [1 sentence — what you offer and who it's for]
CTA Button:  [Button text — e.g. "Apply Now"]
```

### Benefits (4–6 items)
```
1. [Title] — [One line description]
2. [Title] — [One line description]
3. [Title] — [One line description]
4. [Title] — [One line description]
```

### Social Proof (pick one)
```
STATS:  [Value] [Label] / [Value] [Label] / [Value] [Label]
  e.g.  500+  Loads/Month  /  12 yrs  In Business  /  4.9★  Driver Rating

QUOTES: "[Quote text]" — [Name, Role]
```

### Form Fields
```
Required: First Name, Last Name, Phone, Email
Optional: [any niche-specific fields, e.g. CDL Class / Years Experience]
Submit button text: [e.g. "Apply Now"]

Submission:
  [ ] Google Sheets (Apps Script — URL goes in .env.local as NEXT_PUBLIC_SHEETS_URL)
  [ ] Redirect only → /thank-you (no backend)
```

---

## STYLE
Extract ALL visual decisions from the attached reference image:
colors, fonts, tone, button style, spacing, card style, layout mood.
Do NOT use Tailwind defaults or invent anything. If something is unclear → ask.

---

## PROMPT
# Copy everything below this line → paste to Claude Code (with reference image attached)

```
Read [THIS FILENAME].md completely. A reference image is attached — use it as the sole style source.

Build a 3-page Next.js 14 site:
  /           → Landing page
  /form       → Lead capture form
  /thank-you  → Confirmation page

Stack: Next.js 14 App Router · TypeScript · Tailwind CSS · shadcn/ui · Lucide React · Framer Motion · React Hook Form + Zod

Rules:
- Extract colors, fonts, spacing, button style, and layout mood FROM THE REFERENCE IMAGE only
- Configure extracted fonts via next/font/google
- All images via next/image (no raw <img> tags)
- Use Lucide React for icons

Build order: layout.tsx → Navbar → Footer → page.tsx → /form → /thank-you
Show me layout.tsx and Navbar first. Wait for approval before continuing.
```
