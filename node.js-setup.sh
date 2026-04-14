#!/bin/bash

# ─────────────────────────────────────────
# Шаг 1 — Проверка / установка Node.js
# ─────────────────────────────────────────

if command -v node &>/dev/null; then
  echo "✅ Node.js уже установлен: $(node -v)"
else
  echo "⏳ Node.js не найден. Устанавливаю через nvm..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh"
  nvm install 20
  nvm use 20
  echo "✅ Node.js установлен: $(node -v)"
fi

# ─────────────────────────────────────────
# Шаг 2 — Создание проекта Next.js 14
# ─────────────────────────────────────────

echo ""
echo "⏳ Создаю проект Next.js 14..."

npx -y create-next-app@14 my-project \
  --typescript \
  --eslint \
  --tailwind \
  --src-dir \
  --app \
  --no-import-alias

echo "✅ Проект создан!"

# ─────────────────────────────────────────
# Шаг 3 — Переход в папку проекта
# ─────────────────────────────────────────

cd my-project || { echo "❌ Папка my-project не найдена"; exit 1; }

# ─────────────────────────────────────────
# Шаг 4 — Установка библиотек
# ─────────────────────────────────────────

echo ""
echo "⏳ Устанавливаю framer-motion, lucide-react, react-hook-form..."
npm install framer-motion lucide-react react-hook-form
echo "✅ Все библиотеки установлены!"

# ─────────────────────────────────────────

echo ""
echo "🎉 Готово! Запусти проект командой:"
echo "   cd my-project && npm run dev"
