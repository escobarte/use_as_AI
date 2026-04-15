# PROMPT — Next.js Landing Page Builder
# HOW TO USE:
#   1. Fill in TEMPLATE_NEXTJS_LANDING_v3_PROJECT.md
#   2. Open Claude Code → type: Read PROMPT_v3.md
#   3. Attach your reference image in the same message
#   That's it. Claude handles the rest.

# ─────────────────────────────────────────────────────────────
# CHANGELOG
# [v1] Initial minimal template — content + style + prompt in one file
# [v2] Added two-step style verification (Style Card before any code)
# [v3] Split into PROJECT.md (data) + PROMPT.md (instructions)
#      Claude now receives two focused inputs instead of one mixed file
# ─────────────────────────────────────────────────────────────

---

Read TEMPLATE_NEXTJS_LANDING_v3_PROJECT.md for project content.
A reference image is attached — use it as the sole style source.

Build a 3-page Next.js 14 site:
  /           → Landing page
  /form       → Lead capture form
  /thank-you  → Confirmation page

Stack: Next.js 14 App Router · TypeScript · Tailwind CSS · shadcn/ui · Lucide React · Framer Motion · React Hook Form + Zod

--- STEP 1 (before any code) ---
Look at the reference image and output a Style Card:
  - Background color (hex)
  - Accent / button color (hex)
  - Text color (hex)
  - Heading font (name + weight)
  - Body font (name + weight)
  - Button style (rounded / sharp / pill · outlined / filled)
  - Overall mood (1–3 words, e.g. "industrial, dark, bold")

Wait for approval before writing any code.

--- STEP 2 (after approval) ---
- Use only the approved Style Card values — no Tailwind defaults
- Configure fonts via next/font/google
- All images via next/image (no raw <img> tags)
- Use Lucide React for icons

Build order: layout.tsx → Navbar → Footer → page.tsx → /form → /thank-you
Show me layout.tsx and Navbar first. Wait for approval before continuing.
