# PROMPT — Next.js Landing Page Builder
# HOW TO USE:
#   1. Fill in TEMPLATE_NEXTJS_LANDING_v5_PROJECT.md
#   2. Open Claude Code → type: Read TEMPLATE_NEXTJS_LANDING_v5_PROMPT.md
#   3. Attach your reference image in the same message
#   That's it. Claude handles the rest.

# ─────────────────────────────────────────────────────────────
# CHANGELOG
# [v1] Initial minimal template — content + style + prompt in one file
# [v2] Added two-step style verification (Style Card before any code)
# [v3] Split into PROJECT.md (data) + PROMPT.md (instructions)
# [v4] Added NO LIST — prevents AI-style visual effects
#      Added photo placeholder rule — PENDING assets become labeled divs
# [v5] PROJECT.md filled with test trucking content (lorem ipsum)
#      Added Style Note field — bridges gap between reference style and niche
#      All assets set to PENDING for placeholder test
# ─────────────────────────────────────────────────────────────

---

Read TEMPLATE_NEXTJS_LANDING_v5_PROJECT.md for project content.
A reference image is attached — use it as the sole style source.
Also read the Style Note field in PROJECT.md before extracting styles.

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
Rules:
- Use only the approved Style Card values — no Tailwind defaults
- Configure fonts via next/font/google
- All images via next/image (no raw <img> tags)
- Use Lucide React for icons

NO — never add any of these:
- Particle or canvas background effects
- Gradient text (background-clip: text)
- Glassmorphism / backdrop-blur on cards
- Neon glow or box-shadow glow effects
- Lottie or SVG path animations
- Typewriter / letter-by-letter text effects
- Entrance animations on more than one element per section

PHOTO PLACEHOLDERS:
- Check the Assets section in PROJECT.md
- READY → use next/image with the given path
- PENDING → render a labeled div, example:
    {/* PLACE PHOTO HERE */}
    <div className="w-full h-[500px] bg-zinc-800 flex items-center justify-center">
      <p className="text-white/40 text-sm">[ photo: /public/assets/hero-bg.jpg · recommended: 1920×1080px ]</p>
    </div>
- Never use external placeholder services (placehold.co, picsum, etc.)

Build order: layout.tsx → Navbar → Footer → page.tsx → /form → /thank-you
Show me layout.tsx and Navbar first. Wait for approval before continuing.
